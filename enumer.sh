#!/bin/bash
 # Ansi color code variables
red="\e[0;91m"
blue="\e[0;94m"
expand_bg="\e[K"
blue_bg="\e[0;104m${expand_bg}"
red_bg="\e[0;101m${expand_bg}"
green_bg="\e[0;102m${expand_bg}"
green="\e[0;92m"
white="\e[0;97m"
bold="\e[1m"
uline="\e[4m"
clear="\e[0m"

clear

printf "
${red}
   - -   
  / _ \  _ \| | | |  _   _ \ / _ \  __|
 |  __/ | | | |_| | | | | | |  __/ |   
  \___|_| |_|\__,_|_| |_| |_|\___|_|   
${clear} "
echo ""
echo ""
sleep 0.2s
printf "${bold}// A TOOLBOX FOR WEB APPLICATION PENTESTER${clear}"
echo ""
echo ""
echo ""
sleep 0.2s
printf "${bold}${blue}SUBDOMAIN ENUMERATION (1)${clear}"
echo ""
sleep 0.2s
sleep 0.2s
printf "${bold}${blue}WAF DETECTION (2)${clear}"
echo ""
sleep 0.2s
printf "${bold}${blue}WEB CRAWLING (3)${clear}"
echo ""
sleep 0.2s
printf "${bold}${blue}TECHNOLOGY DETECTION (4)${clear}"
echo ""
sleep 0.2s
echo ""
echo ""
echo ""
echo ""
sleep 0.2s
 #user-input
read -p "YOUR DOMAIN (WITHOUT HTTPS://):" domain
read -p "YOUR CHOICE:" sel
clear
 #subdomain enumeration
if [ $sel -eq 1 ];then
 echo ""
 printf "${bold}SUBDOMAIN ENUMERATION${clear}"
 echo ""
 printf "${red}${bold}subfinder${clear} >> assetfinder >> gau "
 echo ""
 echo ""
  #subfinder(go/apt/go package)
 subfinder -d $domain -o ./tools-opt/subfinder-output.txt
 cat ./tools-opt/subfinder-output.txt
 clear
 #assetfinder
 echo ""
 printf "${bold}SUBDOMAIN ENUMERATION${clear}"
 echo ""
 printf "subfinder >> ${red}${bold}assetfinder${clear} >> gau "
 echo ""
 assetfinder -subs-only $domain  >> ./tools-opt/assetfinder-output.txt
 cat ./tools-opt/assetfinder-output.txt
 #sleep 5s
 clear
  #gau (go/go package)
 printf "${bold}SUBDOMAIN ENUMERATION${clear}"
 echo ""
 printf "subfinder >> assetfinder >> ${red}${bold}gau${clear} "
 echo ""
 echo "PLEASE WAITE"
 clear
  #copy textfiles to /integration/concatenate/subdomain
 mv ./tools-opt/subfinder-output.txt ./integration
 mv ./tools-opt/assetfinder-output.txt ./integration
 mv ./tools-opt/gau-output.txt ./integration
  #concatenate text files
 cd    integration
 cat   subfinder-output.txt  assetfinder-output.txt gau-output.txt  >> all-domain.txt
  #elminate duplicate domain
 sort all-domain.txt | uniq > subdomain.txt
 clear
  #showing result
 echo "RESULT (WITHOUT PROBE)"
 echo ""
 echo "DOMAIN:" ; wc -l < subdomain.txt
 echo ""
 cat subdomain.txt
 echo ""
 echo ""
 printf "SAVE IN /enumer/$domain/subdomain.txt$"
  #probing
 echo ""
 echo ""
 echo "PROBING"
 ../httpx  -l subdomain.txt
 echo ""
 echo ""
 echo ""
 echo ""
 #printf "${green_bg}${bold}SAVE IN /enumer/output/domains/$domain/subdomain/live-$domain.txt${clear}"
 echo ""
 echo "PROBING(STATUS CODE)"
 echo ""
 ../httpx -sc -l subdomain.txt
 echo ""
 echo ""
 #printf "${green_bg}${bold}SAVE IN /enumer/output/domains/$domain/subdomain/status-$domain.txt${clear}"
 echo ""
 #echo "YOU WILL GO BACK IN MAIN MENU"
 mkdir $domain
  #removing text files
 #cp ./tools-opt/finalrecon/finalrecon-output.txt ./output/$domain/subdomain/tools-outputs/finalrecon.txt
 cp subdomain.txt  $domain
 mv $domain ../
 rm -f all-domain.txt
 rm -f subdomain.txt
 rm -f subfinder-output.txt
 rm -f assetfinder-output.txt
 rm -f gau-output.txt
 #sleep 30s
fi

 #waf detection
if [ $sel -eq 2 ];then
 echo ""
 printf "${bold}WAF DETECTION${clear}"
 wafw00f https://$domain
 echo ""
 echo "YOU WILL GO BACK IN MAIN MENU"
 sleep 20s
 sh enumer.sh
fi

 #web crawling
if [ $sel -eq 3 ];then
 mkdir $domain
 echo ""
 echo "WEB CRAWLER"
 echo ""
 ./katana -u  https://$domain -o $domain/crawler.txt
 echo ""
 sleep 10s
 sh ./enumer.sh
fi

 #technology detection
if [ $sel -eq 4 ];then
mkdir $domain
echo ""
 printf "${bold}TECHNOLOGY ENUMERATION${clear}"
whatweb  https://$domain -v >> tech.txt
mv tech.txt $domain
echo "SAVED IN $domain/tech.txt"
sleep 5
sh ./enumer.sh
fi

if [ $sel -eq 7 ];then
 printf "${blue}
  fi
 fi

fi
