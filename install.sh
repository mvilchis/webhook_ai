while getopts ":p:u:" opt; do
    case $opt in
        p) PROJECT_NAME="$OPTARG"
           ;;
        u) USERNAME="$OPTARG"
           ;;
        \?) echo "Opción inválida -$OPTARG" >&2
            ;;
    esac
done


git init ${PROJECT_NAME}

cd ${PROJECT_NAME}

git remote add "template" https://github.com/mvilchis/webhook-template.git

git pull template master

find ./ -type f -exec sed -i -e "s/-dummy/-${PROJECT_NAME}/g" {} \;


echo ${PROJECT_NAME} > .project-name

git add .project-name

git commit -m "Ajustando el nombre del proyecto a ${PROJECT_NAME}"


echo "############################################################################################"
echo "##                                                                                        ##"
echo "##  No olvides modificar los archivos utils y webhook con el codigo correspondiente       ##"
echo "##                                                                                        ##"
echo "############################################################################################"

echo ""

make info
