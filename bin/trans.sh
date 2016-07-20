#!/bin/bash
#
# Author: jaypei <jaypei97159@gmail.com>
# Site: http://github.com/jaypei/hh-awesome
#
# A translate script in awesome-wm (en <-> cn).
# script refs: http://awesome.naquadah.org/wiki/TranslateIt
# ydcv refs: https://github.com/felixonmars/ydcv
#

CURRPATH=$(cd "$(dirname "$0")"; pwd)
TRANS_FILE="/tmp/trans.out"
# 0 as infinity
TIMEOUT_SECS=0

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Exiting"
fi

transtool="$1"
text="$2"

$CURRPATH/$transtool "$text" > $TRANS_FILE

result="
naughty = require('naughty')

local f = assert(io.open(\"$TRANS_FILE\", \"r\"))
local t = f:read(\"*all\")
f:close()

naughty.notify({
  title=nil,
  text=\"\" .. t:gsub(\"^(.-)%s*$\", \"%1\"),
  timeout=$TIMEOUT_SECS
})
"
echo $result | awesome-client -

exit
