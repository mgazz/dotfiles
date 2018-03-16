
#### check arguments
while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    -p1|--parameter1)
    P1="$2"
    #move from key to $2
    shift # past argument
    ;;
    -s|--searchpath)
    SEARCHPATH="$2"
    shift # past argument
    ;;
    --single)
    single=true
    ;;
    *)
            # unknown option
    ;;
esac
#move from $2 to the next param identifier
shift # past argument or value
done
