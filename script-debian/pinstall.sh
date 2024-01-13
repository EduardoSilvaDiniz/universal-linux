#!/usr/bin/env bash

release="0.2"
pkgs_path="$(pwd)/lists"
line=""
instalando=
"
  $line
  Instalando...
  $line
"

main_title="$line
INSTALAR E CONFIGURAR - SISTEMA: DEBIAN 12 RELEASE: ${release}
$line"
main_menu="$main_title
   0. Conectar a Internet via USB
   1. Firmware
   2. Drivers nvidia
   3. Interface grafica Xmonad
   4. Utilitários de sistema
   5. fontes
   6. Internet
   7. Brave
   8. Multimídia
   9. Escritório
   10. Desenvolvimento
   11. Virtualização
   12. Steam e Wine
   13. Flatpak
   14. Docker
   15. Aplicativos FLatpak
   16. remover aplicativos Pré-instalados
   17. instalar zsh
$line
   G. Configuração do ambiente gráfico
   R. Reiniciar a máquina
   Q. Sair
$line
Escolha uma opção: "

read_pkgs() {
    pkgs_list=$(grep -vE "^\s*#" $1 | sed '/^\s*$/d')
    pkgs_apti=$(tr "\n" " " <<< $pkgs_list)
}

packageManager() {
    # Monta lista de pacotes para exibição e instalação...
    read_pkgs "$pkgs_path/$1"
    # Tela de instalação...
    clear
    echo "$main_title"
    echo -e "Os pacotes da lista '$1' serão $2:\n"
    echo -e "$pkgs_list\n"
    read -p "Deseja continuar (S/n)? " op
    [[ ${op,} = "n" ]] && return
    # Executa a instalação...
    if (($?)); then
        echo "$instalando"
        sudo apt $2 -y $pkgs_apti
        if (($?)); then
            echo -e "\n$line\nA instalação falhou!\nVerifique a lista de pacotes '$1' e tente novamente.\n$line\n"
        else
            echo -e "\n$line\nSucesso!\n$line\n"
        fi
        read -p "Tecle 'enter' para continuar... "
    fi
}
connectUSB()
{
  ip a > ip-a && awk -F ': ' '{ print $2 }' ip-a > ip-a && wifi=$(awk '/enx/ { print }' a-mod) && ip link set dev $wifi up && dhclient
}
installWine() # instala o ecosistema completo do wine
{
  read -p "please add 'deb https://dl.winehq.org/wine-builds/debian/ bookworm main' on /etc/apt/sources.list, done ?? (y/n) " resp

  if [ "$resp" = 'y' ]
    then
	    sudo dpkg --add-architecture i386
	    sudo wget -nc https://dl.winehq.org/wine-builds/winehq.key
	    sudo apt-key add winehq.key
	    sudo apt install winehq-staging -y
	    sudo apt install winetricks -y
	  else
	    printf "please add repo..."
	    sleep 10
	fi
}

installFlatpak() # instala o gerenciador de pacotes flatpak e adiciona o repositorio flathub
{
	sudo apt install flatpak -y
	echo "add repo flathub on flatpak"
	sleep 30
	flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
}

installJetbrains() # Adiciona o PPA do Jonas Gröger e instala intellij, clion e webstorm
{
	echo "install ide jetbrains"
	sleep 2
	curl -s https://s3.eu-central-1.amazonaws.com/jetbrains-ppa/0xA6E8698A.pub.asc | gpg --dearmor | \
	                        sudo tee /usr/share/keyrings/jetbrains-ppa-archive-keyring.gpg > /dev/null
	echo "deb [signed-by=/usr/share/keyrings/jetbrains-ppa-archive-keyring.gpg] http://jetbrains-ppa.s3-website.eu-central-1.amazonaws.com any main" \
	                                                                                | sudo tee /etc/apt/sources.list.d/jetbrains-ppa.list > /dev/null
	sudo apt update && sudo apt install intellij-idea-ultimate clion webstorm -y
}

installBrave() # Adiciona PPA oficial do brave e instala o brave
{
  echo "install brave"
  sleep 2
  curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
  echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/  \
                                                        stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
  sudo apt update && sudo apt install brave-browser -y
}

installDocker() # Instala o docker-cli e docker-desktop de acordo com a doc do docker
{
  echo "install Docker"
  sleep 2
  sudo apt install ca-certificates curl gnupg -y
  sudo install -m 0755 -d /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  sudo chmod a+r /etc/apt/keyrings/docker.gpg

  echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg]
                                          https://download.docker.com/linux/debian "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
                                          sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt update && sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
  # install dockerhub
  wget -O dockerhub.deb -q --show-progress "https://desktop.docker.com/linux/main/amd64/docker-desktop-4.24.0-amd64.deb? \
                                            utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64" \
                                            && wait && apt install ./discord.deb && rm -rf dockerhub.deb
}

installSteam()
{
    installWine
    clear
    echo "$main_title"
    echo -e "Esta opção ativa a arquiterura i386 e instala o cliente Steam.\n"
    continuar
    if (($?)); then
	echo -e "\nInstalando Steam...\n"
	sudo dpkg --add-architecture i386
	sudo apt update
	sudo apt install steam gamemode
	read -p "Tecle 'enter' para continuar... "
    fi
}

installAppFlatpak()
{
  flatpak install flathub net.ankiweb.Anki -y
  flatpak install flathub md.obsidian.Obsidian -y
  flatpak install flathub com.notesnook.Notesnook -y
  flatpak install com.jetbrains.IntelliJ-IDEA-Ultimate com.jetbrains.PyCharm-Professional com.jetbrains.WebStorm com.jetbrains.CLion -y
}

installOhMyZsh()
{
  sudo apt install zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}


installPipewire()
{
  sudo apt install wireplumber pipewire pipewire-pulse pipewire-alsa libspa-0.2-bluetooth \
  pulseaudio-utils pulsemixer pavucontrol alsa-utils
  systemctl --user enable --now pipewire wireplumber
  sudo systemctl enable --now lightdm # não deveira esta aqui, mas vou deixa, por enquanto
}
while true; do
    clear
	echo -e "$main_menu\c"
	read option
	case $option in
	    0) connectUSB ;;
	    1) packageManager 00-firmware install ;;
	    2) packageManager 00-nvidia install ;;
	    3) packageManager 01-base-desktop-xmonad install;;
	    4) packageManager 01-system-utilities install ;;
	    5) packageManager 02-fontes install ;;
	    6) packageManager 02-network install ;;
	    7) installBrave;;
	    8) packageManager 06-multimedia install ;;
	    9) packageManager 07-escritorio install ;;
	    10) installJetbrains ;;
      11) packageManager 10-virtualizacao install ;;
	    12) installSteam;;
	    13) installFlatpak;;
	    14) installDocker ;;
	    15) installAppsFlatpak ;; # instalar os apps que eu uso via flatpak, a função ainda não existe
	    16) packageManager 04-uninstall remove ;;
	    17) installOhMyZsh ;; # instala zsh e ohmyzsh
	 [gG]) desktop_settings ;; # não funciona ainda
	 [rR]) sudo reboot;;
	 [qQ]) echo -e "\nSaindo...\n"; exit 0;;
	esac
done