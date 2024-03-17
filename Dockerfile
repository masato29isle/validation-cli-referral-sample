FROM public.ecr.aws/amazoncorretto/amazoncorretto:17

RUN yum install -y wget
RUN yum install -y tar
RUN yum install -y gzip

WORKDIR /tmp/fhir-test/

RUN mkdir .fhir
RUN mkdir pkgJp
RUN mkdir targets
RUN mkdir prog

## 検証用コアパッケージ群のinstall
RUN wget https://jpfhir.jp/fhir/clins/pkgValidation/fhir-core-pkg.tgz
RUN tar -zxvf ./fhir-core-pkg.tgz
RUN cp -R ./fhir-core-pkgs-20231111-forV6.1.8-20230921/packages/ .fhir/

## 検証対象データ
COPY ./target/ targets/

## JP検証パッケージ群のinstall
RUN wget -P pkgJp/ https://jpfhir.jp/fhir/core/1.1.2/jp-core.r4-1.1.2.tgz
RUN wget -P pkgJp/ https://jpfhir.jp/fhir/core/terminology/jpfhir-terminology.r4-1.1.1.tgz
### カスタムpackageをCOPYする
COPY ./jp-eReferral.r4-1.1.6.tgz pkgJp/
### 公開パッケージをそのままinstallしたい場合はこちらを有効化する
# RUN wget -P pkgJp/ https://jpfhir.jp/fhir/eReferral/jp-eReferral.r4-1.1.6.tgz

## validation-cli
### サイズが大きくエラーとなることがある為、事前にダウンロードしたことがあるものをコピーする形とする
COPY ./validator_cli_6.1.8.jar prog/

## CLI 実行スクリプト
COPY ./validation-cli.sh .
RUN chmod +x validation-cli.sh

ENTRYPOINT ["./validation-cli.sh"]