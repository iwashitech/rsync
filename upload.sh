set -eu

SCRIPT_DIR=$(cd $(dirname $0); pwd)

source $SCRIPT_DIR/settings/env.sh
# サイト選択して変数を設定
source $SCRIPT_DIR/scripts/select_site.sh
# アップロードするか確認
source $SCRIPT_DIR/scripts/select_upload.sh

if [ ! "$PRIVATE_KEY" = "NONE" ]; then
  RSH="-e ssh -i ${PRIVATE_KEY}"
fi

CONFIRM_DRY_RUN="
######################################################

実際にアップロードする前に
動作確認(dry-run)を行いますか？(y/n): 

######################################################
"

read -p "$CONFIRM_DRY_RUN" DRY_RUN_OK
case "$DRY_RUN_OK" in
  y)
    OPTION_DRY_RUN="--dry-run"
    ;;
  n)
    OPTION_DRY_RUN=""
    ;;
  *)
    echo "どちらかを選んでください"
    exit 0
    ;;
esac

# アップロード実行
if [ $UPLOAD_OK = "y" ] && [ "$ACCEPTED_UPLOAD" = "OK" ]; then
  rsync -avu $OPTION_DRY_RUN "$RSH" upload/ $USER@$HOST:$SITEDIR > logs/upload/$WORK_DATE.log
else
  exit 0
fi