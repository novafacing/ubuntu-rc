# Ubuntu Configs

Configs for Ubuntu.

## Glamor

![image](https://user-images.githubusercontent.com/30083762/156246974-f3910b25-5d4d-4cb9-bb6d-0bf34d2c04c7.png)


## Prerequisites


1. Install Ubuntu Minimal (pretty self explanatory)

2. Install dependencies

### APT

```
sudo apt -y update && sudo apt -y install \
    apt-file \
    aptitude \
    aptitude \
    arandr \
    autoconf \
    automake \
    build-essential \
    cmake \
    curl \
    delta \
    feh \
    fonts-font-awesome \
    fonts-font-awesome \
    fonts-noto \
    fonts-noto-color-emoji \
    fonts-powerline \
    fzf \
    git \
    i3lock \
    imagemagick \
    libev-dev \
    libgmp-dev \
    libmpc-dev \
    libmpfr-dev \
    libpango1.0-dev \
    libstartup-notification0-dev \
    libxcb-cursor-dev \
    libxcb-icccm4-dev \
    libxcb-keysyms1-dev \
    libxcb-randr0-dev \
    libxcb-shape0-dev \
    libxcb-util0-dev \
    libxcb-xinerama0-dev \
    libxcb-xkb-dev \
    libxcb-xrm-dev \
    libxcb-xrm0 \
    libxcb1-dev \
    libxkbcommon-dev \
    libxkbcommon-x11-dev \
    libyajl-dev \
    lightdm \
    meson \
    neovim \
    ninja-build \
    nvidia-current \
    nvidia-current-updates \
    nvidia-driver-470 \
    nvidia-settings \
    pavucontrol \
    picom \
    python2 \
    python2-pip \
    python3 \
    python3-pip \
    rofi \
    silversearcher-ag \
    slurp \
    tasksel \
    texlive-full \
    wget \
    x11-xserver-utils \
    xclip \
    xcwd \
    xprop \
    xprop \
    xrandr \
    xserver-xorg-video-nvidia-470 \
    zsh

```

### Python

```
python3 -m pip install \
    ROPGadget \
    aiohttp \
    apt \
    beautifulsoup4 \
    binwalk \
    black \
    colour \
    construct \
    cryptography \
    cssselect \
    feedparser \
    filebytes \
    flake8 \
    flask \
    gmpy \
    gmpy2 \
    i3ipc \
    i3ipc \
    ipython \
    jedi \
    joblib \
    keyring \
    lxml \
    meson \
    mypy \
    netifaces \
    ninja \
    numpy \
    parse \
    pdf2image \
    pefile \
    pillow \
    poetry \
    power \
    psutil \
    psutil \
    pwntools \
    pycryptodome \
    pyelftools \
    pyfiglet \
    pygit2 \
    pygit2 \
    pygments \
    pyi3ipc
    pyqt5 \
    python-socketio \
    rarfile \
    requests \
    ropper \
    scipy \
    setuptools \
    six \
    spotipy \
    sympy \
    tqdm \
    urllib3 \
    websockets \
    yara \
    z3-solver
```

### i3

```
# BUILD
mkdir -p ~/hub
git clone https://github.com/Airblader/i3 ~/hub/i3
cd i3/
mkdir -p build && cd build && meson .. && ninja
# INSTALL
file * | grep ELF | grep -v test | cut -d':' -f1 | xargs -I {} sudo cp {} /usr/local/bin
# TEST
i3bar -h
i3 -h
# INSTALL DESKTOP ENTRY
cat <<EOF >/usr/share/xsessions/i3.desktop
[Desktop Entry]
Name=i3
Comment=improved dynamic tiling window manager
Exec=i3
TryExec=i3
Type=Application
X-LightDM-DesktopName=i3
DesktopNames=i3
Keywords=tiling;wm;windowmanager;window;manager;
EOF
```

### Kitty

```
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin | sudo sh /dev/stdin dest=/usr/local/bin
sudo ln -s /usr/local/bin/kitty.app/bin/kitty /usr/local/bin/kitty
```

### Install These Configs

```
cd ~
# DOWNLOAD
git clone https://github.com/novafacing/ubuntu-rc ~/hub/ubuntu-rc
# SYMLINK (THIS IS DANGEROUS!!!!)
find "/home/novafacing/hub/ubuntu-rc/" -maxdepth 1 -printf "%P\n" | while read file; do ln -s "/home/novafacing/hub/ubuntu-rc/$file" "$(pwd)/$file"; done
```


### OMZ

```
sudo chsh -s $(which zsh) novafacing
exit
# LOG BACK IN
sudo usermod -s $(which zsh) novafacing
exit
# LOG BACK IN
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 ssh://git@github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
p10k configure
```

### RUST

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install \
    exa \
    dust \
    ytop \
    rust_demangle
```

### Picom

```
git clone ssh://git@github.com/yshui/picom.git ~/hub/picom
cd ~/hub/picom
git submodule update --init --recursive
make install
meson --buildtype=release . build
chmod +x ~/.config/layout.sh
```

### Font

```
git clone --depth 1 https://github.com/sainnhe/icursive-nerd-font.git ~/hub/icursive-nerd-font
cd ~/hub/icursive-nerd-font
cd Fira\ Code\ iCursive\ S12
find . -type d -exec sudo cp -av {} /usr/local/share/fonts/ttf \;
```


### OTher

```
sudo timedatectl set-timezone America/Indianapolis
```
