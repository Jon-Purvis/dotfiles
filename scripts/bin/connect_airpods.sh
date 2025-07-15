#!/bin/bash

MAC="F0:04:E1:D2:13:2F"

echo "[+] Restarting Bluetooth service (requires sudo)"
sudo systemctl restart bluetooth

echo "[+] Disconnecting device $MAC"
bluetoothctl disconnect "$MAC"

sleep 1

echo "[+] Connecting device $MAC"
bluetoothctl connect "$MAC"

