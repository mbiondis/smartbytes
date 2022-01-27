#!/bin/sh

while [ ! -n "$ORG_NAME"  ]
do
    echo "Please enter a name for your scratch org:"
    read ORG_NAME
    echo " "
done

echo "Pushing customization as a source package"

echo sfdx force:source:push -u "${ORG_NAME}"

echo "Loading record data"
sfdx sfdmu:run -s csvfile -u "${ORG_NAME}" -p Step_1 --concise
sfdx sfdmu:run -s csvfile -u "${ORG_NAME}" -p Step_2 --concise