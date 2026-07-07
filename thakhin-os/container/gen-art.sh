#!/bin/bash
# Generates all Thakhin OS branding art from the winkokolatt.me media
# using ImageMagick + pango (proper Burmese text shaping via Padauk font).
# $1 = live-build tree root (contains config/)
set -euxo pipefail

BUILD="$1"
W="$BUILD/config/includes.chroot"
ART="$BUILD/art"
SITE=/website/images
GOLD='#D4AF37'
BUDDHA='#FFD700'
SAFFRON='#FF9933'
LIGHT='#FAFAFA'
MUTED='#999999'

mkdir -p "$ART" \
  "$W/usr/share/backgrounds/thakhin" \
  "$W/etc/calamares/branding/thakhin" \
  "$W/usr/share/plymouth/themes/thakhin" \
  "$W/usr/share/pixmaps"

# pango text renderer: $1 markup -> $2 file
txt() {
  convert -background none pango:"$1" "$2"
}

PORTRAIT="$SITE/webprofilepicture-optimized.jpg"
FLAG="$SITE/flag-image.png"

########################################
# 1. Main wallpaper (1920x1080)
########################################
convert -size 1920x1080 radial-gradient:'#2a2208'-'#0d0d0d' "$ART/wall-base.png"
convert "$PORTRAIT" -resize 600x600 -bordercolor "$GOLD" -border 8 "$ART/portrait-b.png"

txt "<span font='Padauk Bold 100' foreground='$GOLD'>သခင် OS</span>" "$ART/t-title.png"
txt "<span font='DejaVu Serif Bold 34' foreground='$LIGHT'>THAKHIN OS 1.0 — Community Edition</span>" "$ART/t-sub.png"
txt "<span font='Padauk Bold 30' foreground='$BUDDHA'>အမျိုးကိုစောင့်၊ ဘာသာကိုစောင့်၊ သာသနာကိုစောင့်</span>" "$ART/t-slogan.png"
txt "<span font='Padauk 24' foreground='$LIGHT'>တောသားနှိမ်နင်းရေးအသင်း | Anti-Tarzan Association</span>" "$ART/t-assoc.png"
txt "<span font='Padauk 22' foreground='$SAFFRON'>ဥက္ကဋ္ဌကြီး ဝင်းကိုကိုလတ် (AnonyLatt) မှ တည်ဆောက်သည်</span>" "$ART/t-chair.png"

convert "$FLAG" -resize x64 "$ART/flag-m.png"
convert "$ART/wall-base.png" \
  "$ART/portrait-b.png" -geometry +130+230 -composite \
  "$ART/flag-m.png"     -geometry +886+180 -composite \
  "$ART/t-title.png"    -geometry +880+270 -composite \
  "$ART/t-sub.png"      -geometry +886+480 -composite \
  "$ART/t-slogan.png"   -geometry +886+570 -composite \
  "$ART/t-assoc.png"    -geometry +886+650 -composite \
  "$ART/t-chair.png"    -geometry +886+710 -composite \
  "$W/usr/share/backgrounds/thakhin/thakhin-wall-1.png"

########################################
# 2. Photo wallpapers (dimmed + slogan)
########################################
n=2
for photo in "$SITE/IMG_7086.jpg" "$SITE/IMG_5518.JPG"; do
  convert "$photo" -resize 1920x1080^ -gravity center -extent 1920x1080 \
    -fill black -colorize 60% "$ART/wp-$n-base.png"
  convert "$ART/wp-$n-base.png" \
    \( "$FLAG" -resize x56 \) -gravity north -geometry +0+150 -composite \
    "$ART/t-title.png"  -gravity center -geometry +0-80 -composite \
    "$ART/t-slogan.png" -gravity center -geometry +0+80 -composite \
    "$ART/t-assoc.png"  -gravity center -geometry +0+150 -composite \
    "$W/usr/share/backgrounds/thakhin/thakhin-wall-$n.png"
  n=$((n+1))
done

########################################
# 3. Bootloader splash 640x480 (isolinux + grub)
########################################
convert "$PORTRAIT" -resize 220x220 -bordercolor "$GOLD" -border 4 "$ART/portrait-s.png"
txt "<span font='DejaVu Serif Bold 27' foreground='$GOLD'>THAKHIN OS</span>" "$ART/s-title.png"
txt "<span font='Padauk Bold 18' foreground='$BUDDHA'>သခင် OS ၁.၀ — Community Edition</span>" "$ART/s-sub.png"
txt "<span font='Padauk 13' foreground='$SAFFRON'>အမျိုးကိုစောင့်၊ ဘာသာကိုစောင့်၊ သာသနာကိုစောင့်</span>" "$ART/s-slogan.png"
txt "<span font='Padauk 13' foreground='$LIGHT'>တောသားနှိမ်နင်းရေးအသင်း တရားဝင် OS</span>" "$ART/s-assoc.png"
txt "<span font='DejaVu Sans 11' foreground='$MUTED'>Chairman Win Ko Ko Latt | AnonyLatt Dept. | MTC Approved | winkokolatt.me</span>" "$ART/s-foot.png"
convert "$SITE/mtc-profile.jpg" -resize 95x95 "$ART/mtc-small.png"
convert "$FLAG" -resize x30 "$ART/flag-s.png"
convert -size 640x480 gradient:'#1c1708'-'#0d0d0d' \
  "$ART/portrait-s.png" -geometry +28+105 -composite \
  "$ART/flag-s.png"     -geometry +287+66 -composite \
  "$ART/s-title.png"    -geometry +285+110 -composite \
  "$ART/s-sub.png"      -geometry +287+165 -composite \
  "$ART/s-slogan.png"   -geometry +287+218 -composite \
  "$ART/s-assoc.png"    -geometry +287+252 -composite \
  "$ART/mtc-small.png"  -geometry +515+310 -composite \
  "$ART/s-foot.png"     -geometry +28+432 -composite \
  "$ART/splash-640.png"
convert "$ART/splash-640.png" -resize '800x600!' "$ART/splash-800.png"

########################################
# 4. Calamares branding images
########################################
convert "$PORTRAIT" -resize 128x128 "$W/etc/calamares/branding/thakhin/logo.png"
convert "$PORTRAIT" -resize 256x256 "$W/usr/share/pixmaps/thakhinos.png"
convert "$FLAG" -resize x72 "$W/etc/calamares/branding/thakhin/flag.png"
convert "$SITE/mtc-profile.jpg" -resize 96x96 "$W/etc/calamares/branding/thakhin/mtc.png"

txt "<span font='Padauk Bold 26' foreground='#0d0d0d'>သခင် OS ၁.၀ တပ်ဆင်ခြင်းသို့ ကြိုဆိုပါသည်</span>" "$ART/w-line1.png"
txt "<span font='DejaVu Sans 15' foreground='#3a2f00'>Welcome to the Thakhin OS 1.0 Installer — Anti-Tarzan Community Edition</span>" "$ART/w-line2.png"
convert -size 700x170 gradient:"$BUDDHA"-"$GOLD" \
  \( "$PORTRAIT" -resize 130x130 \) -geometry +20+20 -composite \
  "$ART/w-line1.png" -geometry +180+45 -composite \
  "$ART/w-line2.png" -geometry +182+105 -composite \
  "$W/etc/calamares/branding/thakhin/welcome.png"

# Slideshow photos (16:10-ish crops, consistent size)
i=1
for photo in \
  "$SITE/webprofilepicture-optimized.jpg" \
  "$SITE/IMG_3268.JPG" \
  "$SITE/IMG_7166.jpg" \
  "$SITE/FB_IMG_1769003467445.jpg" \
  "$SITE/FB_IMG_1769003473226.jpg" \
  "$SITE/01_win_ko_ko_latt_court_2017.jpg" \
  "$SITE/IMG_5518.JPG" \
  "$SITE/IMG_7086.jpg" \
  "$SITE/IMG_2603.jpg" \
  "$SITE/IMG_5520.JPG"; do
  convert "$photo" -resize 560x420^ -gravity north -extent 560x420 \
    -bordercolor "$GOLD" -border 4 \
    "$W/etc/calamares/branding/thakhin/slide$i.jpg"
  i=$((i+1))
done

# MTC Council seal + frontline monument slides
convert -size 560x420 gradient:'#1c1708'-'#0d0d0d' \
  \( "$SITE/mtc-profile.jpg" -resize 350x350 \) -gravity center -composite \
  -bordercolor "$GOLD" -border 4 \
  "$W/etc/calamares/branding/thakhin/slide11.jpg"
convert "$SITE/frontline.jpg" -resize 560x420^ -gravity center -extent 560x420 \
  -bordercolor "$GOLD" -border 4 \
  "$W/etc/calamares/branding/thakhin/slide12.jpg"
convert "$SITE/mtc-profile.jpg" -resize 256x256 "$W/usr/share/pixmaps/mtc-seal.png"

########################################
# 4b. MTC official wallpaper
########################################
txt "<span font='Padauk Bold 46' foreground='$GOLD'>မြန်မာနိုင်ငံတောသားကောင်စီ</span>" "$ART/t-mtc1.png"
txt "<span font='DejaVu Serif Bold 24' foreground='$LIGHT'>MTC — Official Operating System Authority</span>" "$ART/t-mtc2.png"
txt "<span font='Padauk 24' foreground='$SAFFRON'>ရှေ့တန်းအမှတ် (၁) တောသားထိန်းသိမ်းရေးတပ်ဖွဲ့ခွဲ အသိအမှတ်ပြု</span>" "$ART/t-mtc3.png"
convert -size 1920x1080 radial-gradient:'#2a2208'-'#0d0d0d' \
  \( "$SITE/mtc-profile.jpg" -resize 480x480 \) -gravity north -geometry +0+120 -composite \
  \( "$FLAG" -resize x84 \) -gravity northwest -geometry +80+80 -composite \
  \( "$FLAG" -resize x84 \) -gravity northeast -geometry +80+80 -composite \
  -gravity north \
  "$ART/t-mtc1.png" -geometry +0+640 -composite \
  "$ART/t-mtc2.png" -geometry +0+730 -composite \
  "$ART/t-mtc3.png" -geometry +0+790 -composite \
  "$W/usr/share/backgrounds/thakhin/thakhin-wall-4-mtc.png"

########################################
# 5. Plymouth boot splash assets
########################################
txt "<span font='Padauk Bold 40' foreground='$GOLD'>သခင် OS</span>" "$ART/p-name.png"
txt "<span font='DejaVu Sans 14' foreground='$MUTED'>THAKHIN OS — Anti-Tarzan Community Edition</span>" "$ART/p-sub.png"
convert "$PORTRAIT" -resize 170x170 -bordercolor "$GOLD" -border 3 "$ART/p-logo.png"
convert "$FLAG" -resize 200x "$ART/p-flag.png"
convert -background '#0d0d0d' -gravity center \
  "$ART/p-logo.png" "$ART/p-name.png" "$ART/p-sub.png" "$ART/p-flag.png" -append \
  "$W/usr/share/plymouth/themes/thakhin/logo.png"
convert -size 14x14 xc:none -fill "$GOLD" -draw 'circle 7,7 7,1' \
  "$W/usr/share/plymouth/themes/thakhin/dot.png"

########################################
# 6. LightDM greeter background
########################################
cp "$W/usr/share/backgrounds/thakhin/thakhin-wall-1.png" \
   "$W/usr/share/backgrounds/thakhin/greeter.png"

echo "ART GENERATION DONE"
ls -la "$ART" "$W/usr/share/backgrounds/thakhin" "$W/etc/calamares/branding/thakhin"
