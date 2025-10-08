#!/bin/bash
# WEBMEHR TOP Installer
# Version: 1.0.0
# GitHub: https://github.com/webmehr/webmehr-top

set -e

# رنگ‌ها
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${CYAN}╔════════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║         🚀  WEBMEHR TOP Installer  🚀                 ║${NC}"
echo -e "${CYAN}║          Real-Time PHP-FPM Monitor                     ║${NC}"
echo -e "${CYAN}╚════════════════════════════════════════════════════════╝${NC}"
echo ""

# بررسی root
if [ "$EUID" -ne 0 ]; then 
    echo -e "${RED}❌ Please run as root (use sudo)${NC}"
    exit 1
fi

# بررسی وجود watch
echo -e "${BLUE}🔍 Checking dependencies...${NC}"
if ! command -v watch &> /dev/null; then
    echo -e "${YELLOW}⚠️  'watch' command not found. Installing...${NC}"
    if command -v yum &> /dev/null; then
        yum install -y procps-ng
    elif command -v apt-get &> /dev/null; then
        apt-get update && apt-get install -y procps
    else
        echo -e "${RED}❌ Could not install 'watch'. Please install it manually.${NC}"
        exit 1
    fi
    echo -e "${GREEN}✅ 'watch' installed successfully${NC}"
else
    echo -e "${GREEN}✅ 'watch' is already installed${NC}"
fi

# دانلود wmtop اگر وجود نداره
if [ ! -f "wmtop" ]; then
    echo -e "${BLUE}📥 Downloading wmtop script...${NC}"
    if command -v curl &> /dev/null; then
        curl -sL https://raw.githubusercontent.com/webmehr/webmehr-top/main/wmtop -o wmtop
    elif command -v wget &> /dev/null; then
        wget -q https://raw.githubusercontent.com/webmehr/webmehr-top/main/wmtop -O wmtop
    else
        echo -e "${RED}❌ Neither curl nor wget found. Please install one of them.${NC}"
        exit 1
    fi
    
    if [ ! -f "wmtop" ]; then
        echo -e "${RED}❌ Failed to download wmtop script${NC}"
        exit 1
    fi
    echo -e "${GREEN}✅ wmtop script downloaded${NC}"
fi

# نصب
echo -e "${BLUE}📦 Installing WEBMEHR TOP...${NC}"

# کپی فایل
cp wmtop /usr/local/bin/wmtop
chmod +x /usr/local/bin/wmtop

echo ""
echo -e "${GREEN}╔════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║  ✅  Installation completed successfully!  ✅         ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${CYAN}📖 Usage:${NC}"
echo -e "   ${YELLOW}wmtop${NC}"
echo ""
echo -e "${CYAN}🔗 GitHub:${NC} https://github.com/webmehr/webmehr-top"
echo -e "${CYAN}📚 Documentation:${NC} https://github.com/webmehr/webmehr-top#readme"
echo ""
echo -e "${BLUE}💡 Tip:${NC} Press ${YELLOW}Ctrl+C${NC} to exit wmtop"
echo ""
