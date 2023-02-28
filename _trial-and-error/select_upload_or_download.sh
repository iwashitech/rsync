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

read -p "アップロードかダウンロードかを選んでください(up/down): " UP_OR_DOWN
case "$UP_OR_DOWN" in
  up)
    read -p "$CONFIRM_FINAL" UPLOAD_OK
    case "$UPLOAD_OK" in
      y)
        ACCEPTED_UPLOAD="OK"
        make_directory up
        ;;
      n*) exit 0 ;;
    esac
    ;;
  down)
    make_directory  down
    ;;
  *)
    echo "どちらかを選んでください"
    exit 1
    ;;
esac