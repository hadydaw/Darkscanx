#!/bin/bash
clear
echo "[*] Memulai instalasi Darkscanx..."
sleep 1
echo "[*] Mengupdate package..."
pkg update -y > /dev/null
pkg upgrade -y > /dev/null

echo "[*] Menginstall nmap..."
pkg install nmap -y > /dev/null

echo "[*] Mengunduh file tool..."
wget https://raw.githubusercontent.com/hadydaw/Darkscanx/main/scan.sh -O scan.sh
wget https://raw.githubusercontent.com/hadydaw/Darkscanx/main/README.txt -O README.txt
chmod +x scan.sh

echo ""
echo "[✓] Instalasi selesai!"
echo "[*] Jalankan dengan perintah: ./scan.sh
