#!/bin/sh

if echo $PREFIX | grep -qi termux ; then

 if ! command -v node>/dev/null ||
   ! command -v udocker>/dev/null ||
   ! command -v git >/dev/null ; then
   
  echo "nodejs & udocker & git required"
  echo -n "Install?(Y/n)"
  read ans
  
  if printf "%s" "$ans" | grep -qi n ; then
    echo "Aborted."
    exit 1
  fi

  pkg update && pkg upgrade
  pkg install nodejs udocker git

 fi

fi

# 1. Clone the official repo
git clone https://github.com/openclaw/openclaw.git

# 2. Clone my js-udocker for build
git clone https://github.com/jjtseng93/js-udocker.git

# 3. Copy patched files
cp Dockerfile openclaw/
cp -r patches openclaw/

# 4. Start building process
node js-udocker/udocker.js build -t clawdroid -y openclaw





echo -e "\033[33mBuild complete!\033[0m"

echo "For a graphical environment,"
echo "  1. Install termux-x11 app"
echo "  2. Run in Termux:"
echo "    pkg install termux-x11-nightly"
echo "    termux-x11 :0 -listen tcp -ac &"

echo ""

echo "After entering shell by udocker run or"
echo "  sh enter_container.sh"
echo "You can do:"
echo "  claw gateway --allow-unconfigured &"
echo "    (will take a while)"
echo "    (& means run in background)"
echo "    (bring it to foreground later by fg)"
echo ""
echo "  In Termux, Open another tab at the left side"
echo "    or run ↓ directly otherwise"
echo "  sh patches/test_browser_open.sh"
echo "  sh patches/test_browser_snapshot.sh"
echo ""
echo "Get token after first start by:"
echo "  cat ~/.openclaw/openclaw.json"
echo ""
echo "To change the AI models used, run:"
echo "  claw onboard"
echo ""
echo "For language issues, run:"
echo "  apt update"
echo "  apt install locales fonts-noto-cjk"
echo "  dpkg-reconfigure locales"
