#!/usr/bin/env bash
set -euo pipefail

# SDDM 및 KDE X11 설치
sudo pacman -S --needed \
    sddm \
    plasma-x11-session \
    kwin-x11 \
    xorg-server

# SDDM 설정 배포
sudo install -Dm644 \
    "$(dirname "$0")/10-displayserver.conf" \
    /etc/sddm.conf.d/10-displayserver.conf

# 로그인 관리자 전환
sudo systemctl disable plasmalogin.service 2>/dev/null || true
sudo systemctl enable --force sddm.service

echo "설정 완료. 재부팅 후 SDDM X11 로그인 화면을 확인하세요."
