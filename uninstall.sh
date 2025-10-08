#!/bin/bash
# WEBMEHR TOP Uninstaller
# Version: 1.0.0
# GitHub: https://github.com/webmehr/webmehr-top

set -e

# رنگ‌ها
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}╔════════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║       🗑️  WEBMEHR TOP Uninstaller  🗑️                 ║${NC}"
echo -e "${CYAN}╚════════════════════════════════════════════════════════╝${NC}"
echo ""

# بررسی root
if [ "$EUID" -ne 0 ]; then 
    echo -e "${RED}❌ Please run as root (use sudo)${NC}"
    exit 1
fi

# حذف
if [ -f "/usr/local/bin/wmtop" ]; then
    echo -e "${YELLOW}🗑️  Removing WEBMEHR TOP...${NC}"
    rm -f /usr/local/bin/wmtop
    echo ""
    echo -e "${GREEN}╔════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║  ✅  Uninstalled successfully!  ✅                    ║${NC}"
    echo -e "${GREEN}╚════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${CYAN}Thank you for using WEBMEHR TOP!${NC}"
    echo -e "${CYAN}🔗 GitHub:${NC} https://github.com/webmehr/webmehr-top"
else
    echo -e "${YELLOW}⚠️  WEBMEHR TOP is not installed.${NC}"
fi

echo ""
