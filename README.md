# FHIRバリデーションCLI(診療情報提供書)

* 本リポジトリは以下Validationガイドの実施手順をDockerfile化し、  
診療情報提供書のリソースプロファイルをカスタマイズしてバリデーション実行できるようにしている  
https://jpfhir.jp/fhir/eReferral/igv1/validationGuide.html


## 前提事項
* 以下についてインストール済みであること
  * Docker
  * wget


## ディレクトリ構成

|No.|ディレクトリ/ファイル|説明|
|---|---|---|
|1|target/|FHIRバリデーション検証データ格納ディレクトリ|
|2|package/|診療情報提供書格納パッケージディレクトリ|
|3|docker-validation-cli.sh|FHIRバリデーションCLI(Docker)実行スクリプト|
|4|validation-cli.sh|FHIRバリデーションCLI実行スクリプト|


## CLI実行方法
1. target配下にバリデーション対象データを格納する

2. 診療情報提供書のリソースプロファイルをカスタマイズしたい場合、package配下のプロファイルを修正する

3. リポジトリ直下に移動後、以下コマンドを入力する

```sh
chmod +x ./docker-validation-cli.sh
./docker-validation-cli.sh
```
