#!/bin/sh

orgAlias=$1

echo " "
echo "Loading record data..."
sfdx sfdmu:run -s csvfile -p data/step-1/csv -u "${orgAlias}"
sfdx sfdmu:run -s csvfile -p data/step-2/csv -u "${orgAlias}"