set -eu

SCRIPT_DIR=$(cd $(dirname $0); pwd)
source $SCRIPT_DIR/settings/env.sh

DIR_UP=logs/upload
DIR_DELETE=logs/delete
DIR_COMMAND=sftp_command
DIR_BACKUP=backup_delete_$WORK_DATE

function make_directory () {
  if [ ! -d $DIR_UP ] && [ "$1" = "up" ]; then
    mkdir -p $DIR_UP
  fi

  if [ ! -d $DIR_DELETE ] && [ "$1" = "del" ]; then
    mkdir -p $DIR_DELETE
  fi

  if [ ! -d $DIR_COMMAND ] && [ "$1" = "cmd" ]; then
    mkdir -p $DIR_COMMAND
  fi

  if [ ! -d $DIR_BACKUP ] && [ "$1" = "backup" ]; then
    while read line || [ -n "${line}" ];
    do
      # 最後のフィールドを除外 awk '{$NF="";print $0}'
      dir=`echo $line | awk -F "/" '{$NF="";print $0}' | sed -e "s@ @/@g"`
      if [ ! -d $DIR_BACKUP/$dir ]; then
        mkdir -p $DIR_BACKUP/$dir
      fi
    done < files/delete_list.txt
  fi
}