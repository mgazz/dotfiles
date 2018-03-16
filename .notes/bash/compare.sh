#operations
let "var=var+1"
#or
let "var+=1"
#or
let "var++"

#arithmetic
Arithmetic relational operators

#(<)
-lt

#(>)
-gt

#(<=)
-le

#(>=)
-ge

#(==)
-eq

#(!=)
-ne

if [[ ${string} == "" ]]; then
    (>&2 echo "string not defined")
fi

#difference between test, [ and [[
#test and [[ for evaluate expressions
#[[ works only in Bash, Zsh and the Korn shell, and is more powerful
#[ and test are available in POSIX shells

#booleans
var=true
if $var; then
    echo 'var is true'
fi
