#!/bin/bash

# ways to run this script:
# ./runme.sh <lbCommand> <OPTIONAL:targetSchema>
# e.g. 
#   ./runme.sh update
#   ./runme.sh rollbackOneUpdate schema2


export lbCommand="$1"
export targetSchema="$2"

# Example Liquibase environment variables. 
# When these environment variables are set, Liquibase will not require a liquibase.properties file.
# Complete list of Liquibase envirnoment variables here: https://docs.liquibase.com/parameters/home.html
# export LIQUIBASE_COMMAND_URL=""
# export LIQUIBASE_COMMAND_USERNAME=""
# export LIQUIBASE_COMMAND_PASSWORD=""

echo lbCommand=$lbCommand
echo targetSchema=$targetSchema

for i in schema1 schema2 schema3
do
    if [ $lbCommand == "rollbackOneUpdate" ] 
    then
        if [ $targetSchema == "$i" ] 
        then 
            echo "i=$i and lbCommand=$lbCommand"
            export schema=$i
            liquibase flow
        fi
    else
        echo "i=$i and lbCommand=$lbCommand"
        export schema=$i
        liquibase flow
    fi
done