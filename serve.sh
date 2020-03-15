#!/bin/bash
set -e
PORT=7997
HOST=127.0.0.1

echo Starting Server
echo "   Access: http://${HOST}:${PORT}/index.html"

if [ -x "$(command -v python3)" ]; then
  python3 -m http.server ${PORT} --bind ${HOST}
elif [ -x "$(command -v python2.7)" ]; then
  python2.7 -m SimpleHTTPServer ${PORT} --bind ${HOST}
elif [ -x "$(command -v php)" ]; then
  php -S ${HOST}:${PORT}
elif [ -x "$(command -v ruby)" ]; then
  ruby -rwebrick -e"WEBrick::HTTPServer.new(:Port => ${PORT}, :DocumentRoot => Dir.pwd).start"
fi
