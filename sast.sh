#!/bin/bash

semgrep \
  --use-git-ignore \
  --sarif --output build/semgrep_scan.sarif \
  --config p/java

checkov -d . -o sarif

docker run -t -v .:/path checkmarx/kics scan -p /path --report-formats sarif

