SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd "$SCRIPT_DIR"

sqlite3 :memory: \
"select 1, 'A' union select 2, 'B'"

sqlite3 :memory: \
".separator \"\t\" \"\n\"" \
"select 1, 'A' union select 2, 'B'"

sqlite3 :memory: ".show"
sqlite3 :memory: ".show" | grep separator
sqlite3 :memory: \
".separator \"\t\" \"\n\"" \
".show" | grep separator
sqlite3 :memory: \
".separator \"\t\" \"\r\n\"" \
".show" | grep separator

sqlite3 :memory: ".mode list" ".show" | grep separator
sqlite3 :memory: ".mode csv" ".show" | grep separator
sqlite3 :memory: ".mode tabs" ".show" | grep separator

