
#print with backslash interpretation
echo -e ' \t '

#remove prefix
KEY_PATH=${KEY_PATH#\"}
#remove suffix
KEY_PATH=${KEY_PATH%\"}


###
## cat in file
###
## NOTE: to make it clean wrap it in function
## otherwise, not using tabs, it becomes quite ugly :(
cat <<EOF >> brightup.sh
blablabla
EOF

##
#cat with tabs
##
TAB="$(printf '\t')"
cat <<EOF >> file.sh
${TAB}blablabla
EOF



ssh -i ./key/testbed.key  ubuntu@$VM_IP << EOF

EOF
