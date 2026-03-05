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

  pkg update
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
node js-udocker/udocker.js build -t clawdroid openclaw

echo -e "\033[33mBuild complete!\033[0m"

echo "For a graphical environment,"
echo "  Install termux-x11 app"
echo "  pkg install termux-x11-nightly"
echo "  termux-x11 :0 -listen tcp -ac &"

echo ""

echo "After entering shell by udocker run"
echo "You can do:"
echo "  claw gateway --allow-unconfigured"
echo "  Open another tab at the left side"
echo "  sh patches/test_browser_open.sh"
echo "  sh patches/test_browser_snapshot.sh"
