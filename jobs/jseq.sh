#!/bin/bash

BASE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

echo "Fetching Treasury Rates Data"
python ${BASE}/j1.py --file ${BASE}/../data/treasury_yield.csv

echo "Creating Charts"
mkdir -p ${BASE}/../notebook/charts
python ${BASE}/j2.py --in-csv ${BASE}/../data/treasury_yield.csv --out-png ${BASE}/../notebook/charts/ty_3m_5y_30y.png

