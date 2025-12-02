#!/data/data/com.termux/files/usr/bin/bash
set -e

pkg update
pkg upgrade -y
pkg install -y proot-distro

ROOTFS_DIR="$PREFIX/var/lib/proot-distro/installed-rootfs"
DLCACHE_DIR="$PREFIX/var/lib/proot-distro/dlcache"
BOOTSTRAP="$DLCACHE_DIR/bootstrap-aarch64.zip"

echo "[*] Termux Multi-Instance Creator"

if [ ! -d "$ROOTFS_DIR/termux" ]; then
    echo "[!] Base 'termux' rootfs not found."
    echo "[*] Installing base Termux using: proot-distro install termux"
    proot-distro install termux
    echo "[+] Base Termux installation complete."
else
    echo "[*] Base Termux rootfs OK."
fi

i=1
while [ -d "$ROOTFS_DIR/termux-$i" ]; do
    i=$((i+1))
done

ALIAS="termux-$i"

if [ -f "$BOOTSTRAP" ]; then
    export PD_OVERRIDE_TARBALL_URL="$BOOTSTRAP"
    export PD_OVERRIDE_TARBALL_SHA256=""
else
    unset PD_OVERRIDE_TARBALL_URL
    unset PD_OVERRIDE_TARBALL_SHA256
fi

pd install --override-alias "$ALIAS" termux
