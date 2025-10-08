#!/bin/bash
# WEBMEHR TOP Uninstaller
# Version: 1.0.0

set -e

echo "╔════════════════════════════════════════════════════════╗"
echo "║       🗑️  WEBMEHR TOP Uninstaller  🗑️                 ║"
echo "╚════════════════════════════════════════════════════════╝"
echo ""

# بررسی root
if [ "$EUID" -ne 0 ]; then 
    echo "❌ Please run as root (use sudo)"
    exit 1
fi

# حذف
if [ -f "/usr/local/bin/wmtop" ]; then
    echo "🗑️  Removing WEBMEHR TOP..."
    rm -f /usr/local/bin/wmtop
    echo "✅ WEBMEHR TOP has been uninstalled successfully!"
else
    echo "⚠️  WEBMEHR TOP is not installed."
fi

echo ""
