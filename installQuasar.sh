echo "Automation for installing Quasar in linux made by youhacker55"

if (( $EUID != 0 )); then
    echo "[-] Please run as root"
    exit
fi
FILE=Quasar/Quasar.exe
Firsttime=Firsttime.txt
if [ -f "$Firsttime" ]; then
         :
else 
    touch Firsttime.txt
    apt-get  update
    apt install curl
    apt install unzip
    apt install wine
    apt install wine-mono
    apt install winetricks
fi



if [ -f "$FILE" ]; then
    echo "[+] Found Quasar.exe"
else 
    echo "Quasar.exe Not Found installing "
    curl https://raw.githubusercontent.com/youhacker55/InstallQuasarRATInlinux/main/Quasar.v1.3.0.0.zip -o Quasar.zip
    unzip Quasar.zip 
    mv Quasar\ v1.3.0.0 Quasar 
    
   
    
fi

echo """
1) install .net 4.0
2) run Quasar (always run option 1 before running Quasar the first time)

"""
read option

if [ "$option" -eq "1" ]; then
        winetricks dotnet45

elif [ "$option" -eq "2" ]; then
        echo "[+] starting Quasar"
        wine Quasar/Quasar.exe
else
   echo "[-] Invalid option"
   
fi
