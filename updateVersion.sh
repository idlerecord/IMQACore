#!/bin/bash

# 定义路径
SRC_DIR="$1"
REPO_DIR="$2"
DEST_DIR="$REPO_DIR/IMQACore/Frameworks"
PODSPEC_FILE="$REPO_DIR/IMQACore.podspec"

# 获取源目录下的第一个 .xcframework
FIRST_SRC_XCFRAMEWORK=$(find "$SRC_DIR" -maxdepth 1 -type d -name "*.xcframework" | head -n 1)

if [ -z "$FIRST_SRC_XCFRAMEWORK" ]; then
    echo "❌ 源目录未找到 .xcframework"
    exit 1
fi

# 读取源 xcframework 版本号
SRC_INFO_PLIST="$FIRST_SRC_XCFRAMEWORK/Info.plist"

if [ ! -f "$SRC_INFO_PLIST" ]; then
    echo "❌ 源 Info.plist 未找到"
    exit 1
fi

SRC_VERSION=$(/usr/libexec/PlistBuddy -c "Print :XCFrameworkFormatVersion" "$SRC_INFO_PLIST")

if [ -z "$SRC_VERSION" ]; then
    echo "❌ 读取源版本号失败"
    exit 1
fi

echo "✅ 读取到源版本号: $SRC_VERSION"

# 获取目标目录下的第一个 .xcframework
FIRST_DEST_XCFRAMEWORK=$(find "$DEST_DIR" -maxdepth 1 -type d -name "*.xcframework" | head -n 1)

if [ -n "$FIRST_DEST_XCFRAMEWORK" ]; then
    # 读取目标 xcframework 版本号
    DEST_INFO_PLIST="$FIRST_DEST_XCFRAMEWORK/Info.plist"

    if [ -f "$DEST_INFO_PLIST" ]; then
        DEST_VERSION=$(/usr/libexec/PlistBuddy -c "Print :XCFrameworkFormatVersion" "$DEST_INFO_PLIST")

        if [ "$SRC_VERSION" == "$DEST_VERSION" ]; then
            echo "✅ 版本号相同 ($SRC_VERSION)，无需更新"
            exit 0
        fi

        echo "🚀 发现新版本 ($SRC_VERSION)，更新 Framework..."
    fi
else
    echo "⚠️ 目标目录未找到 .xcframework，执行更新..."
fi

# 删除目标目录下的所有文件
rm -rf "$DEST_DIR"/*
mkdir -p "$DEST_DIR"

# 复制文件到目标目录
cp -R "$SRC_DIR"/* "$DEST_DIR"
echo "✅ 复制完成: $SRC_DIR -> $DEST_DIR"

# 更新 podspec 版本号
sed -i '' "s/s.version *= *\"[0-9.]*\"/s.version = \"$SRC_VERSION\"/" "$PODSPEC_FILE"
echo "✅ 更新 podspec 版本号: $SRC_VERSION"

# Git 提交和推送
cd "$REPO_DIR" || exit
git add .
git commit -m "chore: 更新版本至 $SRC_VERSION"
git tag "$SRC_VERSION"
git push origin "$SRC_VERSION"
git push origin main

echo "✅ 推送代码并创建 Tag: $SRC_VERSION 🚀"

pod trunk push IMQACore.podspec --allow-warnings


