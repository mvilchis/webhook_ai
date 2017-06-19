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

echo ${PROJECT_NAME} > .project-name

sed "%s/-dummy/-${PROJECT_NAME}/g"

git add .project-name

git commit -m "Ajustando el nombre del proyecto a ${PROJECT_NAME}"


make help

echo "############################################################################################"
echo "##                                                                                        ##"
echo "##  No olvides ejecutar 'make set_project_name' para ajustar el nombre de las carpetas    ##"
echo "##                                                                                        ##"
echo "############################################################################################"

echo ""

make info
