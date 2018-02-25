# nassi

育児サポートアプリ

名前は娘のニックネームから取っています :baby:

## 何が出来る？

<img src="https://github.com/tamadon/nassi/blob/media/media/ss.png" width="320">

* 基本1タップ、多くても2タップで子供のイベント（ミルク、おむつ替え）をSlackに通知出来る
* Slackへの通知をHookしてGoogle スプレッドシートに記録
* 子供の泣き止ませ動画（カフカくん、胎動音）を再生する

## 制作した背景

[子育てエンジニアの家庭内生存戦略](https://speakerdeck.com/tamadon/zi-yu-teenziniafalsejia-ting-nei-sheng-cun-zhan-lue)

## How to Build
以下の情報を.envファイルに登録してビルド時に呼び出すようにしています
（書き方は.env.sampleを参考にしてください）
※このファイルはgit管理しないでください

SlackのWebHookURL
Slack起動用のURLスキーム
スプレッドシート起動用のURLスキーム
