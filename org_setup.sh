#!/bin/sh

while [ ! -n "$ORG_ALIAS"  ]
do
    echo "Please enter a name for your scratch org:"
    read ORG_ALIAS
done

echo " "
echo "Pushing customizations..."
sfdx force:source:push -u "${ORG_ALIAS}" -f

echo " "
echo "Assigning user permissions..."
sfdx force:user:permset:assign -n "SmartBytes_Admin" -u "${ORG_ALIAS}"

echo " "
echo "Loading record data..."
sfdx sfdmu:run -s csvfile -u "${ORG_ALIAS}" -p data/Step_1

if [ "$?" = "0" ]
then
    sfdx sfdmu:run -s csvfile -u "${ORG_ALIAS}" -p data/Step_2
fi