#!/bin/bash
INPUT=./usuarios2.csv
OLDIFS=$IFS
IFS=,
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
echo "While "
while read -r usuario grupo senha || [ -n "$usuario" ]
do
    if [ "$usuario" != "usuarios" ]; then
        aws iam create-user --user-name $usuario
        aws iam create-login-profile --password-reset-required --user-name $usuario --password $senha
        aws iam add-user-to-group --group-name $grupo --user-name $usuario
    fi
done < "$INPUT"
IFS=$OLDIFS