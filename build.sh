#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p build/classes
find src/main/java -name '*.java' -print | LC_ALL=C sort > build/sources.list
test -s build/sources.list
javac --release 21 -encoding UTF-8 -cp 'lib/*' -d build/classes @build/sources.list
jar --create --file build/jar-isolation-316.jar -C build/classes .
