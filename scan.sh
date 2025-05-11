#!/bin/bash

# Fungsi spinner loading
spinner() {
    local pid=$1
    local delay=0.1
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c] Menginstal nmap... " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
    done
    printf " [✓] nmap berhasil diinstal!\n"
}

# Cek dan install dependensi
install_deps() {
    for pkg in nmap whois; do
        if ! command -v $pkg &> /dev/null; then
            echo "[!] $pkg tidak ditemukan. Memulai instalasi..."
            pkg install $pkg -y > /dev/null 2>&1 & spinner $!
            sleep 1
        else
            echo "[✓] $pkg sudah terinstal."
        fi
    done
}

# Mulai program
install_deps
clear
echo "╔═══════════════════════════════╗"
echo "║        DARKSCANX v1.3         ║"
echo "║     Terminal GUI Interface    ║"
echo "║        © nullbyt 2025         ║"
echo "╚═══════════════════════════════╝"
echo
echo "Pilih mode:"
echo "1. Scan IP Target"
echo "2. Scan Link atau Situs"
echo "3. Ping Target"
echo "4. Cek Whois Domain"
echo "5. About Tool"
echo "6. Keluar"
read -p "[*] Masukkan pilihan (1-6): " pil

case $pil in
    1)
        read -p "[?] Masukkan IP target: " ip
        echo "[*] Sedang memindai IP: $ip ..."
        sleep 1
        echo "[*] Proses hacking dalam perjalanan..."
        sleep 2
        filename="hasil_${ip}_$(date +%H%M%S).txt"
        nmap $ip > $filename
        echo "[✓] Pemindaian selesai."
        echo "[-] Hasil disimpan di file: $filename"
        ;;
    2)
        read -p "[?] Masukkan link/situs: " site
        echo "[*] Sedang memindai situs: $site ..."
        sleep 1
        echo "[*] Proses hacking dalam perjalanan..."
        sleep 2
        filename="hasil_${site}_$(date +%H%M%S).txt"
        nmap $site > $filename
        echo "[✓] Pemindaian selesai."
        echo "[-] Hasil disimpan di file: $filename"
        ;;
    3)
        read -p "[?] Masukkan alamat IP/domain: " target
        echo "[*] Melakukan ping ke $target ..."
        ping -c 4 $target
        ;;
    4)
        read -p "[?] Masukkan nama domain: " domain
        echo "[*] Mengambil data WHOIS dari $domain ..."
        whois $domain
        ;;
    5)
        echo "═══════════════════════════════"
        echo "Nama Tool : DARKSCANX v1.3"
        echo "Creator   : nullbyt"
        echo "Bahasa    : Bash (Termux)"
        echo "Fungsi    : Network Scanning & Edukasi"
        echo "Note      : Gunakan untuk pembelajaran."
        echo "═══════════════════════════════"
        ;;
    6)
        echo "[*] Keluar..."
        exit
        ;;
    *)
        echo "[!] Pilihan tidak valid!"
        ;;
esac
