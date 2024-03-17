#!/bin/sh

wget https://github.com/hapifhir/org.hl7.fhir.core/releases/download/6.1.8/validator_cli.jar
mv ./validator_cli.jar ./validator_cli_6.1.8.jar

## 診療情報提供書のパッケージング
## カスタマイズして確認したい場合、package配下のリソース定義プロファイルを修正する
tar -zcvf jp-eReferral.r4-1.1.6.tgz package

docker build ./ -t fhir-validation-sample
docker run fhir-validation-sample