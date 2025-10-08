#!/bin/bash
# WEBMEHR TOP Installer
# Version: 1.0.0

set -e

echo "╔════════════════════════════════════════════════════════╗"
echo "║         🚀  WEBMEHR TOP Installer  🚀                 ║"
echo "║          Real-Time PHP-FPM Monitor                     ║"
echo "╚════════════════════════════════════════════════════════╝"
echo ""

# بررسی root
if [ "$EUID" -ne 0 ]; then 
    echo "❌ Please run as root (use sudo)"
    exit 1
fi

# بررسی وجود watch
if ! command -v watch &> /dev/null; then
    echo "⚠️  'watch' command not found. Installing..."
    if command -v yum &> /dev/null; then
        yum install -y procps-ng
    elif command -v apt-get &> /dev/null; then
        apt-get update && apt-get install -y procps
    else
        echo "❌ Could not install 'watch'. Please install it manually."
        exit 1
    fi
fi

# نصب
echo "📦 Installing WEBMEHR TOP..."

# کپی فایل
cp wmtop /usr/local/bin/wmtop
chmod +x /usr/local/bin/wmtop

echo ""
echo "✅ Installation completed successfully!"
echo ""
echo "📖 Usage:"
echo "   Run: wmtop"
echo ""
echo "🔗 GitHub: https://github.com/webmehr/webmehr-top"
echo ""
