#!/bin/bash

RED="$(printf '\033[31m')"  GREEN="$(printf '\033[32m')"  ORANGE="$(printf '\033[33m')"  BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  CYAN="$(printf '\033[36m')"  WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"  GREENBG="$(printf '\033[42m')"  ORANGEBG="$(printf '\033[43m')"  BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  CYANBG="$(printf '\033[46m')"  WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"
RESETBG="$(printf '\e[0m\n')" END="$(printf '\033[0m\e[0m')"

if [ $(id -u) -ne 0 ];then
	echo -e "\n[${RED}!${END}] ${RED}Ejecute este script como ROOT!${END}"
	exit 1
fi

banner() {
	cat <<- EOF
${RED}   _____   ____ ______________________  _______________  _______________________  
${RED}  /  _  \ |    |   \__    ___/\_____  \ \_   _____/\   \/  /\_   _____/\_   ___ \ 
${RED} /  /_\  \|    |   / |    |    /   |   \ |    __)_  \     /  |    __)_ /    \  \/ 
${RED}/    |    \    |  /  |    |   /    |    \|        \ /     \  |        \\     \____
${RED}\____|__  /______/   |____|   \_______  /_______  //___/\  \/_______  / \______  /
${RED}        \/                            \/        \/       \_/        \/         \/ 	
					                 ${MAGENTA}BY: ${BLUE}Alcatraz2033 - https://github.com/Alcatraz2033${END}

	EOF
}
banner

read -r -p "[${CYAN}>${END}] ${CYAN}Ingrese el nombre del ejecutable:${END} " name
read -r -p "[${CYAN}>${END}] ${CYAN}Ingrese la ruta absoluta del ejecutable:${END} " exec
read -r -p "[${CYAN}>${END}] ${CYAN}Ingrese la ruta absoluta de la imagen del ejecutable:${END} " ico; echo $ico | grep ".ico" &>/dev/null
if [[ $? -ne 0 ]];then
	echo -e "\n[${RED}!${END}] ${RED}La imagen debe estar en formato .ico${END}"	
	exit 1
fi

script() {
	cat <<- EOF
[Desktop Entry]
Type=Application
Categories=Utility
Name=$name
Icon=$ico
Exec=$exec
	EOF
}
script > $name.desktop
USER_HOME=$(getent passwd 1000 | cut -d: -f6)
mv $name.desktop "$USER_HOME/.local/share/applications"
update-desktop-database
echo -e "\n[${BLUE}+${END}] ${BLUE}Aplicativo creado exitosamente! 8===>"
