#!/bin/bash

sudo apt update && apt upgrade

sudo apt install \
    curl \
    ninja-build \
    build-essential \
    mesa-utils \
    libgl-dev \
    libx11-dev \
    libxtst-dev \
    libxt-dev \
    libxinerama-dev \
    libx11-xcb-dev \
    libxkbcommon-dev \
    libxkbcommon-x11-dev \
    libxkbfile-dev \
    libxrandr-dev \
    libxcursor-dev \
    clang-tidy
