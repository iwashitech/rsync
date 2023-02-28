set -eu

CONFIRM_CODE="
######################################################

サイトコードを入力してください: 
foo) FOO
bar) BAR

######################################################
"

read -p "$CONFIRM_CODE" CODE

case "$CODE" in
  foo)
    echo "fooです"
    USER=bar
    HOST=example.example.jp
    PRIVATE_KEY="/home/user_name/.ssh/id_rsa"
    SITEDIR=/home/foo/bar/baz/
    ;;
  bar)
    echo "barです"
    USER=baz
    HOST=example.example.jp
    PRIVATE_KEY="NONE"
    SITEDIR=/home/quux/corge/grault/
    ;;
  *)
    echo "そのサイトは登録されていません"
    exit 0
    ;;
esac