#!/bin/sh

java -jar prog/validator_cli_6.1.8.jar \
    targets/*.json \
      -version 4.0.1 \
      -language ja   \
      -locale ja-JP  \
      -want-invariants-in-messages   \
      -no-extensible-binding-warnings   \
      -display-issues-are-warnings    \
      -level warnings   \
      -best-practice ignore \
      -tx n/a  \
      -ig pkgJp/jp-core.r4-1.1.2.tgz  \
      -ig pkgJp/jpfhir-terminology.r4-1.1.1.tgz  \
      -ig pkgJp/jp-eReferral.r4-1.1.6.tgz