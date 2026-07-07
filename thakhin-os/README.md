# Thakhin OS (သခင် OS) 1.0 — Anti-Tarzan Community Edition

A fully-branded, Debian 12 (bookworm) based live/installable Linux distribution
starring **ဥက္ကဋ္ဌကြီး Win Ko Ko Latt (AnonyLatt ဌာနကြီး)** — the satirical
universe of [winkokolatt.me](https://winkokolatt.me), from boot loader to
desktop. မဘသ website gold/dark theme (`#D4AF37` on `#0D0D0D`) everywhere.

Builds for **amd64** (PC / Intel Mac / VirtualBox) **and arm64** (Apple Silicon via UTM).

## What's inside

| Layer | Branding |
|---|---|
| ISO boot menu (BIOS + UEFI) | Custom splash: chairman portrait + MTC seal + Buddhist flag + slogans |
| Plymouth boot splash | Chairman logo + flag + pulsing gold dots |
| Calamares graphical installer | Restyled gold/dark QSS + **animated 22-slide fun-fact & quiz slideshow** (bouncy transitions, spinning ☸ wheel, flag/MTC banner) |
| LightDM login | Thakhin wallpaper, Padauk font |
| XFCE desktop | Greybird-dark + Papirus + gold accent, compositing (shadows/transparency), Whisker menu "☸ သခင် OS", Conky widget, 4 wallpapers |
| Terminal | transparent gold/dark theme; **Myanmar renders** (fontconfig Padauk fallback); neofetch ☸ + random fact each shell; gold ☸ prompt; flag stripe in MOTD |
| Root/sudo culture | **`thakhin <command>`** replaces `sudo` (real sudo kept intact); themed Burmese sudo lecture |
| CLI tools | `thakhin`, `thakhin-arsenal`, `thakhin-facts`, `tarzan-check` |
| Firefox | Homepage = bundled offline copy of winkokolatt.me (whole site in `/usr/share/thakhin-os/website`) |
| OS identity | `/etc/os-release`, GRUB distributor, MOTD, `/etc/issue` = Thakhin OS 1.0 |

**Dev toolchain:** VS Code (arch-matched), git/gh, Docker + compose, build-essential/gdb/
clang/lldb/llvm/cmake, Python 3 stack, Node.js, Go, Java (+maven), PHP + composer, Ruby,
Rust, DB clients, neovim/tmux/geany, ripgrep/fd/fzf/bat/httpie, shellcheck, valgrind.

**Security arsenal (Kali/Parrot-style, resilient install):** Metasploit, nmap, masscan,
Wireshark, tcpdump, ettercap, bettercap, aircrack-ng, reaver, wifite, kismet, John,
Hashcat, Hydra, Medusa, sqlmap, Nikto, gobuster, ffuf, WPScan, OWASP ZAP, nuclei, SET,
Impacket, CrackMapExec/NetExec, radare2, Ghidra, binwalk, Volatility3, SecLists,
exploit-db, Lynis, chkrootkit, Tor, proxychains — plus the pinned Kali repo for
`thakhin apt install <more>`. **For authorized testing / CTF / education only.**

**Advanced frameworks:** Sliver / PowerShell-Empire / Starkiller / pwncat (C2),
Amass / subfinder / httpx / naabu / katana / dnsx / gospider / gitleaks (recon),
BloodHound + neo4j / evil-winrm / kerbrute / Certipy / pypykatz (Active Directory),
Pacu / ScoutSuite / Trivy / kube-hunter (cloud/container), Frida / apktool / jadx
(mobile), afl++ / pwndbg / GEF / ROPgadget / Veil (exploit-dev). `thakhin-arsenal` lists
what's present. All best-effort so a missing package never breaks the build.

## Build

Requirements: Docker Desktop (builds run in privileged Debian containers).

```sh
cd thakhin-os
./build.sh              # BOTH amd64 + arm64 (sequential — low-RAM safe)
./build.sh amd64        # just amd64
./build.sh arm64        # just arm64 (native & fast on an Apple Silicon host)
```

Each build runs Debian `live-build` inside a privileged `debian:bookworm` container of the
matching `--platform`, generates all art from `../images/` with ImageMagick + pango,
installs the security arsenal via a resilient hook, and drops the ISO + `.sha256` in `dist/`:
`ThakhinOS-1.0-amd64.iso`, `ThakhinOS-1.0-arm64.iso`.

Notes:
- `--compression gzip` keeps peak RAM low (Docker's Linux VM defaults to ~4 GB).
- The security hook is **best-effort**: missing packages / arch gaps / transient network
  errors are logged and skipped, never fatal.
- syslinux (BIOS) branding is amd64-only; arm64 is GRUB-EFI only. Both share the GRUB theme.

## Install

**PC / Intel Mac (amd64):** VirtualBox → New → Debian (64-bit), 4 GB+ RAM, 25 GB+ disk,
attach `ThakhinOS-1.0-amd64.iso`, boot → *Thakhin OS 1.0 Live* → double-click **Install
Thakhin OS**. Or `dd`/Rufus/Etcher the ISO to USB and boot a real laptop (BIOS or UEFI).

**Apple Silicon Mac (arm64):** UTM → Virtualize → Linux → boot `ThakhinOS-1.0-arm64.iso`
(native, fast). VirtualBox on Apple Silicon cannot boot amd64 — use arm64 + UTM.

After install: `tarzan-check` for your မြို့သားသခင် certification, `thakhin-arsenal`
to list security tools, `thakhin apt update && thakhin apt upgrade` to update.

Full illustrated guide + downloads: **winkokolatt.me/downloads/thakhin-os-community-edition/**

## Layout

```
build.sh                      host launcher (loops arches → Docker)
container/build-inside.sh     in-container: tooling → art → lb config → lb build (arch-aware)
container/gen-art.sh          wallpapers/splash/slides/flag composites from site media
config/package-lists/         desktop + dev + fun + firmware
config/hooks/normal/          0400 security arsenal · 0450 thakhin culture · 0500 os-release
                              0600 calamares · 0700 plymouth · 0800 vscode · 0900 desktop
config/includes.chroot/       everything shipped verbatim into the OS
dist/                         ISO output (git-ignored)
```

ထုတ်ဝေသူ — တောသားနှိမ်နင်းရေးအသင်း | မြန်မာနိုင်ငံတောသားကောင်စီ (MTC) အသိအမှတ်ပြု
"အမျိုးကိုစောင့်၊ ဘာသာကိုစောင့်၊ သာသနာကိုစောင့် — Data ကိုလည်းစောင့်"
