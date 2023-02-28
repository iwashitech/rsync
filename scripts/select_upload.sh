set -eu

SCRIPT_DIR=$(cd $(dirname $0); pwd)
source $SCRIPT_DIR/functions/mkdir.sh

ACCEPTED_UPLOAD="NO ACCEPTED"
CONFIRM_FINAL="
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

アップロードしようとしています！！！
本当にアップロードしてもよろしいですか？(y/n): 

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
"

read -p "$CONFIRM_FINAL" UPLOAD_OK
case "$UPLOAD_OK" in
  y)
    ACCEPTED_UPLOAD="OK"
    make_directory up
    ;;
  n)
    echo "アップロードを中止します"
    exit 0
    ;;
  *)
    echo "どちらかを選んでください"
    exit 1
    ;;
esac