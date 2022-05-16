#!/bin/sh

# First argument is the org alias
orgAlias=$1

echo " "
echo "Pushing customizations..."
sfdx force:source:push -u "${orgAlias}" -f

echo " "
echo "Assigning user permissions..."
sfdx force:user:permset:assign -n "SmartBytes_Admin" -u "${orgAlias}"