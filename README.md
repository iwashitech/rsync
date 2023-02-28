# rsync

## WSLの設定
- /mnt/c以下のパーミッションを変える([参考サイト](https://qiita.com/cabbage_lettuce/items/acecfaf270b564d8c5aa))

## パスワード
- 毎回入力を省略するための設定([参考サイト](https://inno-tech-life.com/dev/infra/wsl2-ssh-agent/#index_id1))
```bash
eval `ssh-agent`
ssh-add ~/.ssh/id_rsa
```

## エラー対応
- permission denied (publickey)
 - eオプションを使いダブルクオーテーションで囲んでsshのiオプションを使う
```bash
-e "ssh -i /Users/example_user/.ssh/id_rsa"
```
- Unprotected Private Key File (保護されていないプライベートキーファイル)
 - 権限を変更
```bash
chmod 600 /Users/example_user/.ssh/id_rsa
```


## 参考サイト

### rsync
- [rsync ファイルリストを指定してコピー - Qiita](https://qiita.com/hnishi/items/6668ecd7d5dbd9bc2f6d)
- [rsyncで特定のファイルを指定して転送する--files-fromオプションでハマった件について［自分でなんとかするWeb］](https://every-rating.com/linux/rsync--files-from.html)
- [rsyncでファイル指定して転送する方法(--files-fromオプション) - とりあえずphpとか](https://kimagureneet.hatenablog.com/entry/2014/12/27/122617)
- [はじめてrsyncを使う方が知っておきたい6つのルール：Command Technica（1/2 ページ） - ITmedia エンタープライズ](https://www.itmedia.co.jp/enterprise/articles/0804/21/news013.html)
- [なぜscpの代わりにrsyncコマンドを使うのか？ | たかけのブログ](https://takake-blog.com/rsync/#scp%E3%81%A8rsync)
- [rsyncを使った熟練者レベルのバックアップ | OSDN Magazine](https://mag.osdn.jp/07/07/19/0150245)
- [rsync options](https://gist.github.com/libitte/5898170)

### エラーが出た時の対処方法
- [rsyncでpermission denied (publickey) となった時の対処法 - MS Tech](https://miner.hatenablog.com/entry/554)
- [エラー: Unprotected Private Key File (保護されていないプライベートキーファイル) - Qiita](https://qiita.com/leomaro7/items/662699dcb7a7adc36f40)

### WSLパーミッション
- [WSLの/mnt/c以下のパーミッションを変える方法 - Qiita](https://qiita.com/cabbage_lettuce/items/acecfaf270b564d8c5aa)

### パーミッション
- [[rsync]permission/ユーザ/グループを変更しながら同期する - Qiita](https://qiita.com/yamaryu/items/0cf55209edbb780a66c5)
- [rsyncでファイルのパーミッションがコピーされない件 - VTRyo Blog](https://blog.vtryo.me/entry/rsync-permission)
- [Windows Subsystem for Linux(WSL)でrootのパスワード変更でrootへ昇格するために！ - lisz-works](https://www.lisz-works.com/entry/wsl-root-password-change)
- [How to Run a Shell Script as Superuser](https://inkplant.com/code/run-shell-script-as-superuser)
- [Linuxの対話がめんどくさい?そんな時こそ自動化だ！-expect編- - Qiita](https://qiita.com/ine1127/items/cd6bc91174635016db9b)
- [linux - rsync でリモート側の実行権限が非 root ユーザーの場合、ファイルの所有者情報がコピーされない - スタック・オーバーフロー](https://ja.stackoverflow.com/questions/86550/rsync-%E3%81%A7%E3%83%AA%E3%83%A2%E3%83%BC%E3%83%88%E5%81%B4%E3%81%AE%E5%AE%9F%E8%A1%8C%E6%A8%A9%E9%99%90%E3%81%8C%E9%9D%9E-root-%E3%83%A6%E3%83%BC%E3%82%B6%E3%83%BC%E3%81%AE%E5%A0%B4%E5%90%88-%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%81%AE%E6%89%80%E6%9C%89%E8%80%85%E6%83%85%E5%A0%B1%E3%81%8C%E3%82%B3%E3%83%94%E3%83%BC%E3%81%95%E3%82%8C%E3%81%AA%E3%81%84)
- [リモートでsudoしてrsyncしたい - mattintosh note](https://mattintosh.hatenablog.com/entry/20200325/1585115330)

### 入力待ち
- [BASHシェルスクリプトで「キー入力待ち」プロンプトを実装する | DevelopersIO](https://dev.classmethod.jp/articles/waiting-for-your-input-with-read-command/)
- [【シェルスクリプト】キーボードからの入力を受け付ける方法 | server-memo.net](https://www.server-memo.net/shellscript/key_read.html#i-3)

### 条件分岐
- [【シェルスクリプト】（条件分岐）case文 | server-memo.net](https://www.server-memo.net/shellscript/case.html)
- [bashで複数行の文字列の代入と、ヒアドキュメントを使わずに変数に格納する方法 - それマグで！](https://takuya-1st.hatenablog.jp/entry/2017/03/22/144700)

### ディレクトリ名・ファイル名
- [【bash】現在の日付時刻　がファイル名 - Qiita](https://qiita.com/moonsubaru/items/7e51446db8b570e21c65)

### 毎回パスワード入力
- [【解決】WSL2(Ubuntu)でsshキーの追加時にエラーが起きた時の対処法(Could not open a connection to your authentication agent.) | Inno-Tech-Life](https://inno-tech-life.com/dev/infra/wsl2-ssh-agent/#index_id1)

### if文のエラー
- [シェルスクリプトの「[: Too Many arguments」エラーについて - BinaryDevelop](https://www.binarydevelop.com/article/too-many-arguments-27987)
- [bash — if []からの "[：too many arguments"エラーの意味（角括弧）](https://www.web-dev-qa-db-ja.com/ja/bash/if-%E3%81%8B%E3%82%89%E3%81%AE-%EF%BC%9Atoo-many-arguments%E3%82%A8%E3%83%A9%E3%83%BC%E3%81%AE%E6%84%8F%E5%91%B3%EF%BC%88%E8%A7%92%E6%8B%AC%E5%BC%A7%EF%BC%89/1070004748/)

### シェルスクリプトの変数の不具合
- [scripting - Bash: echo string that starts with "-" - Stack Overflow](https://stackoverflow.com/questions/3652524/bash-echo-string-that-starts-with#answer-3652565)

### シェルスクリプトで引数を渡す
- [sourceコマンドについて詳しくまとめました 【Linuxコマンド集】](https://eng-entrance.com/linux-command-source#source-3)

### シェルスクリプトの関数
- [シェルスクリプトで関数を利用する - Qiita](https://qiita.com/kaw/items/034bc4221c4526fe8866)

### シェルスクリプトの絶対パス
- [[bash] 実行スクリプトの絶対パスの取得 - Qiita](https://qiita.com/koara-local/items/2d67c0964188bba39e29)
- [シェルスクリプトを実行している絶対パスを取得する | ex1-lab](https://ex1.m-yabe.com/archives/3948)
- [bash/zshでsourceされたスクリプト内で、ファイル自身の絶対パスをとるシンプルな記法 - Qiita](https://qiita.com/yudoufu/items/48cb6fb71e5b498b2532)

### ほかのファイルはインクルードしない
- [「アット・ア・グランス性」確保のための8つの原則：スマートな紳士のためのシェルスクリプト（7）（2/2 ページ） - ＠IT](https://atmarkit.itmedia.co.jp/ait/articles/1208/17/news110_2.html)

---

## SFTPに手動でアクセス
```bash
sftp -i /home/user_name/.ssh/id_rsa user@example.example.jp
cd /path/to/dir/
rm file.txt
```

## 削除処理用
```bash
echo path/to/dir/file.txt | awk -F "/" '{print $NF}'
# => file.txt

echo path/to/dir/file.txt | awk -F "/" '{$NF="";print $0}' | sed -e "s@ @/@g"
# => path/to/dir/
```

## 参考サイト

### SFTP
- [SFTP-how to log individual sftp command error while executing shell script](https://www.unix.com/shell-programming-and-scripting/168784-sftp-how-log-individual-sftp-command-error-while-executing-shell-script.html#post302562995)
- [Linuxコマンド【 sftp 】安全なファイル転送 - Linux入門 - Webkaru](https://webkaru.net/linux/sftp-command/)
- [SFTPコマンドをシェルファイルから使うサンプル - Qiita](https://qiita.com/tatsumi_t2/items/719206cb6ce33fcb414f)
- [Linuxコマンド【 sftp 】安全なファイル転送 - Linux入門 - Webkaru](https://webkaru.net/linux/sftp-command/)
- [sftpコマンドまとめ](https://chaingng.github.io/post/sftp_command/#%E3%83%87%E3%82%A3%E3%83%AC%E3%82%AF%E3%83%88%E3%83%AA%E3%82%92%E6%8C%87%E5%AE%9A%E3%81%97%E3%81%A6%E3%81%AE%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%83%80%E3%82%A6%E3%83%B3%E3%83%AD%E3%83%BC%E3%83%89)
- [【 sftp 】Linuxサーバ ⇔ ローカルのファイル転送 - Qiita](https://qiita.com/r18j21/items/373bd66324bda83e0349)
- [SFTPへの接続でエラーが発生する](https://developers.karte.io/docs/datahub-ts-sftp)
- [SFTPを使ってファイルのダウンロード/アップロードする - Qiita](https://qiita.com/tatsumi_t2/items/73567ff4a1006399969b#mac%E3%81%AE%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%82%92%E3%82%B5%E3%83%BC%E3%83%90%E3%83%BC%E3%81%B8%E3%82%A2%E3%83%83%E3%83%97%E3%83%AD%E3%83%BC%E3%83%89%E3%81%99%E3%82%8B)
- [SFTPはどこまで信頼できるのか - Qiita](https://qiita.com/craftone/items/3738e221480b6771dfd3)

### エラー処理
- [bash - SFTP suppress all messages except errors - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/279427/sftp-suppress-all-messages-except-errors)

### ファイル削除
- [sftpでファイルの削除　deletでなくrm - プログラムを楽しもう](http://sounanda.jp/itskillup/?p=1315)
- [sftpコマンドまとめ](https://chaingng.github.io/post/sftp_command/#rm-%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%82%92%E5%89%8A%E9%99%A4)
- [SFTP または FTP サーバー上のフォルダーの削除 - MATLAB rmdir - MathWorks 日本](https://jp.mathworks.com/help/matlab/ref/matlab.io.sftp.sftp.rmdir.html)

### expect
- [シェルスクリプト内でexpectを使ってSFTP接続 – ITめもっ](https://it.akachan.us/?p=239)
- [Linuxの対話がめんどくさい?そんな時こそ自動化だ！-expect編- - Qiita](https://qiita.com/ine1127/items/cd6bc91174635016db9b)

### シェル
- [【Shellスクリプト】文字列置換「bash」「sed」について！ | Beエンジニア](https://www.pmi-sfbac.org/string-replacement/)
- [今日のawkコマンド　最初or 最後のフィールドの値のみ除外 - Screaming Loud](https://yuutookun.hatenablog.com/entry/2013/11/27/224720)
- [【TIPS,Linux】シェル(awk)で最後のフィールドのみを抽出する | Linuxとかをつついてみるブログ](https://www.limemo.net/blog/2013/01/linux-shell-awk-select-last-field.html)
- [sedの正規表現のデリミタに、/ 以外を使用する - Qiita](https://qiita.com/sekineh/items/333e0a577e476e3018b6)
- [【シェルスクリプト】ファイルの中身を一行ずつ読み込む方法 | server-memo.net](https://www.server-memo.net/shellscript/read-file.html)
- [BASHのwhile readで最終行が処理されない問題の解決方法 - Qiita](https://qiita.com/Ets/items/a7fa24b138b8ee883dac)

### ログ
- [logging SFTP details in a log file...](https://www.unix.com/unix-for-dummies-questions-and-answers/30238-logging-sftp-details-log-file.html)
- [unix - Redirect SFTP command log in Shell Script to a File - Stack Overflow](https://stackoverflow.com/questions/46038875/redirect-sftp-command-log-in-shell-script-to-a-file)
- [shell - Issue while capturing SFTP output to variable - Stack Overflow](https://stackoverflow.com/questions/33475366/issue-while-capturing-sftp-output-to-variable)
- [linux - time + sftp commands script: how to correctly redirect output to log file - Stack Overflow](https://stackoverflow.com/questions/64572147/time-sftp-commands-script-how-to-correctly-redirect-output-to-log-file)