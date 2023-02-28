set -eu

SCRIPT_DIR=$(cd $(dirname $0); pwd)

source $SCRIPT_DIR/settings/env.sh
source $SCRIPT_DIR/functions/mkdir.sh

# サイト選択して変数を設定
source $SCRIPT_DIR/scripts/select_site.sh

CONFIRM_DELETE="
######################################################

リモートのファイルを削除しますか？(y/n): 

######################################################
"

CONFIRM_DELETE_FINAL="
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

リモートのファイルを削除しようとしています！！！
本当に削除してもよろしいですか？(y/n): 

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
"

read -p "$CONFIRM_DELETE" DELETE_OK
case "$DELETE_OK" in
  y)
    read -p "$CONFIRM_DELETE_FINAL" DELETE_FINAL_OK
    case "$DELETE_FINAL_OK" in
      y)
        # ログ用ディレクトリ作成
        make_directory del
        # コマンド用ディレクトリ作成
        make_directory cmd
        # バックアップ用ディレクトリ作成
        make_directory backup
        ;;
      n)
        exit 0
        ;;
      *)
        exit 0
        ;;
    esac
    ;;
  n)
    exit 0
    ;;
  *)
    exit 0
    ;;
esac

# バックアップコマンド用ファイル作成
echo "cd ${SITEDIR}" >> $DIR_COMMAND/${WORK_DATE}_backup.txt
while read line || [ -n "${line}" ];
do
  echo "get -r $line backup_delete_$WORK_DATE/$line" >> $DIR_COMMAND/${WORK_DATE}_backup.txt
done < files/delete_list.txt

# バックアップコマンド実行
result_backup=$(sftp -o "batchmode no"  -b $DIR_COMMAND/${WORK_DATE}_backup.txt -i $PRIVATE_KEY $USER@$HOST << EOF 2>&1
EOF
)
echo "$result_backup" > logs/delete/${WORK_DATE}_backup.log

# バックアップコマンドでエラーが発生した場合に作業を中止する
sftp_status_backup=$?

# bash - SFTP suppress all messages except errors - Unix & Linux Stack Exchange
# https://unix.stackexchange.com/questions/279427/sftp-suppress-all-messages-except-errors
if [ $sftp_status_backup -ne 0 ]; then
  echo "バックアップ作業中にエラーが発生しました"
  echo "作業を中止します"
  exit 1
fi

# 削除コマンド用ファイル作成
echo "cd ${SITEDIR}" >> $DIR_COMMAND/${WORK_DATE}_delete.txt
while read line || [ -n "${line}" ];
do
  echo "rm $line" >> $DIR_COMMAND/${WORK_DATE}_delete.txt
done < files/delete_list.txt

# 削除コマンド実行
result_delete=$(sftp -o "batchmode no"  -b $DIR_COMMAND/${WORK_DATE}_delete.txt -i $PRIVATE_KEY $USER@$HOST << EOF 2>&1
EOF
)
echo "$result_delete" > logs/delete/${WORK_DATE}_delete.log