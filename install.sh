#!/bin/bash
# WEBMEHR TOP - Installer & Auto-Updater
# Version: 1.1.0
# GitHub: https://github.com/webmehr/webmehr-top

INSTALL_PATH="/usr/local/bin/wmtop"
REMOTE_URL="https://raw.githubusercontent.com/webmehr/webmehr-top/main/wmtop"

echo "🚀 Installing or Updating WEBMEHR TOP..."

# بررسی وجود نسخه قدیمی
if [ -f "$INSTALL_PATH" ]; then
    echo "🔍 Checking for updates..."
    REMOTE_HASH=$(curl -sL "$REMOTE_URL" | md5sum | awk '{print $1}')
    LOCAL_HASH=$(md5sum "$INSTALL_PATH" | awk '{print $1}')
    if [ "$REMOTE_HASH" == "$LOCAL_HASH" ]; then
        echo "✅ Already up-to-date! (No changes)"
        echo "Run: wmtop"
        exit 0
    else
        echo "⬆️  New version found — updating..."
    fi
else
    echo "🆕 Fresh installation..."
fi

# دانلود و نصب نسخه جدید
curl -sL "$REMOTE_URL" -o "$INSTALL_PATH"
chmod +x "$INSTALL_PATH"

# تأیید نصب
if [ -x "$INSTALL_PATH" ]; then
    echo "✅ WEBMEHR TOP installed successfully!"
    echo "Run: wmtop"
else
    echo "❌ Installation failed! Check permissions."
    exit 1
fi

# ایجاد alias آپدیت سریع
UPDATE_CMD="sudo bash -c 'curl -sL https://raw.githubusercontent.com/webmehr/webmehr-top/main/install.sh | bash'"
if ! grep -q "wmtop-update" ~/.bashrc 2>/dev/null; then
    echo "alias wmtop-update=\"$UPDATE_CMD\"" >> ~/.bashrc
    echo "💡 You can now update anytime with: wmtop-update"
fi
