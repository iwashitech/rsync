set -eu

SCRIPT_DIR=$(cd $(dirname $0); pwd)

source $SCRIPT_DIR/settings/env.sh
# サイト選択して変数を設定
source $SCRIPT_DIR/scripts/select_site.sh
# アップロードかダウンロードを確認
source $SCRIPT_DIR/scripts/select_upload_or_download.sh

if [ ! "$PRIVATE_KEY" = "NONE" ]; then
  RSH="-e ssh -i ${PRIVATE_KEY}"
fi

CONFIRM_DRY_RUN="
######################################################

実際に動かす前に
動作テスト(dry-run)を行いますか？(y/n): 

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

if [ $UP_OR_DOWN = "up" ] && [ "$ACCEPTED_UPLOAD" = "OK" ]; then
  # アップロード
  rsync -avu $OPTION_DRY_RUN "$RSH" upload/ $USER@$HOST:$SITEDIR > logs/upload/$WORK_DATE.log
elif [ $UP_OR_DOWN = "down" ]; then
  # ダウンロード
  rsync -av $OPTION_DRY_RUN --files-from=files/download_list.txt "$RSH" $USER@$HOST:$SITEDIR backup_$WORK_DATE > logs/download/$WORK_DATE.log
else
  exit 1
fi