#!/bin/bash

# Check if critical vulnerabilities exist
if jq '.Results[]?.Vulnerabilities[]?.Severity == "CRITICAL"' reports/trivy-$1.json | grep -q true; then
  echo "CRITICAL vulnerabilities detected!"
  exit 1
fi

# Check CVSS scores
HIGH_CVSS=$(jq '[.Results[]?.Vulnerabilities[]? | select(.CVSS?.nvd?.V3Score >= 7.0)] | length' reports/trivy-$1.json)
if [ "$HIGH_CVSS" -gt 0 ]; then
  echo "$HIGH_CVSS high-risk vulnerabilities (CVSS >= 7.0)"
fi 