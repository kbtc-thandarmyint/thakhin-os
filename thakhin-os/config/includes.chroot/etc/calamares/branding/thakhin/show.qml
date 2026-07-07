/* Thakhin OS installer slideshow v2 — animated edition
 * Bouncy slide transitions, spinning dhamma wheel (same vibe as the
 * winkokolatt.me preloader), Buddhist-flag banner, MTC seal, quiz deck.
 * All facts sourced from winkokolatt.me
 */
import QtQuick 2.5;
import calamares.slideshow 1.0;

Presentation {
    id: presentation

    Slide {
        anchors.fill: parent

        Rectangle {
            id: root
            anchors.fill: parent
            color: "#0d0d0d"

            property int idx: 0
            property var deck: [
                { img: "slide1.jpg", tag: "☸ ကြိုဆိုပါ၏",
                  head: "သခင် OS ၁.၀ သို့ ကြိုဆိုပါသည်",
                  body: "Thakhin OS ကို သင့်စက်အတွင်း တပ်ဆင်နေပါပြီ။ တပ်ဆင်မှုတစ်လျှောက်လုံး ဥက္ကဋ္ဌကြီး ဝင်းကိုကိုလတ် (AnonyLatt ဌာနကြီး) မှ ကိုယ်တိုင် ကြီးကြပ်ပေးနေပါသည်။\n\nအမျိုးကိုစောင့်၊ ဘာသာကိုစောင့်၊ သာသနာကိုစောင့် — Data ကိုလည်း စောင့်ပါ။" },

                { img: "slide2.jpg", tag: "📜 သိကောင်းစရာ #၁",
                  head: "ဥက္ကဋ္ဌကြီး၏ ဇာတိ",
                  body: "ဥက္ကဋ္ဌကြီး ဝင်းကိုကိုလတ်ကို ၁၉၈၂ ခုနှစ် ဇွန်လ ၁၆ ရက်နေ့တွင် ရန်ကုန်တိုင်း ထန်းတပင်မြို့နယ်၌ မွေးဖွားခဲ့သည်။ ရန်ကုန်အဝေးသင်တက္ကသိုလ်မှ ဥပဒေဘွဲ့ (LL.B) ရရှိထားသဖြင့် တာဇံမှန်သမျှကို တရားဥပဒေဘောင်အတွင်းမှသာ နှိမ်နင်းသည်။" },

                { img: "slide3.jpg", tag: "📜 သိကောင်းစရာ #၂",
                  head: "စာရေးဆရာ ဖိုးလောင်တီး",
                  body: "\"လောင်တီး\" ဆိုသည်မှာ ထင်းရှူးတိုင် — အမှောင်ထဲတွင် အလင်းပေးသူဟု အဓိပ္ပာယ်ရသည်။ စာအုပ်ပေါင်း ၂၀ ကျော် ရေးသားခဲ့ပြီး \"တောသားနှိမ်နင်းရေး လက်စွဲ\" မှာ လက်ရာမြောက်ဆုံးဟု ဆိုကြသည်။" },

                { img: "slide3.jpg", tag: "❓ အသိစစ်ဆေးရေး မေးခွန်း #၁",
                  head: "ဥက္ကဋ္ဌကြီး၏ ကလောင်အမည်အသစ်မှာ?",
                  body: "(က) ဖိုးလောင်တီး\n\n(ခ) ဖိုးလောင်ထူး\n\n(ဂ) AnonyLatt\n\n… အဖြေကို နောက်ဆလိုက်တွင် ကြည့်ပါ …" },

                { img: "slide4.jpg", tag: "✅ အဖြေ",
                  head: "(ခ) ဖိုးလောင်ထူး",
                  body: "ဝီရသူ၏ လမ်းညွှန်မှုဖြင့် ကလောင်အမည်ကို \"ဖိုးလောင်တီး\" မှ \"ဖိုးလောင်ထူး\" သို့ ပြောင်းလဲကာ အမျိုးသားရေးစာပေများကို စတင်ရေးသားခဲ့သည်။ (AnonyLatt မှာ hacker လောကအတွက်သာ)" },

                { img: "slide5.jpg", tag: "📜 သိကောင်းစရာ #၃",
                  head: "နိုင်ငံရေးခရီးစဉ်",
                  body: "၂၀၁၅ ရွေးကောက်ပွဲတွင် ပန်းတနော်မြို့နယ် ပြည်သူ့လွှတ်တော်ကိုယ်စားလှယ်လောင်းအဖြစ် ဝင်ရောက်ယှဉ်ပြိုင်ခဲ့သည်။ ၂၀၁၆ တွင် မြန်မာအမျိုးသားကွန်ရက် ဥက္ကဋ္ဌ ဖြစ်လာပြီး အမေရိကန်သံရုံးရှေ့ ဆန္ဒပြပွဲကိုလည်း ဦးဆောင်ခဲ့သည်။" },

                { img: "slide6.jpg", tag: "❓ အသိစစ်ဆေးရေး မေးခွန်း #၂",
                  head: "၂၀၁၇ တွင် ဥက္ကဋ္ဌကြီး ခြောက်လကြာ ဘယ်မှာ အပန်းဖြေခဲ့သလဲ?",
                  body: "(က) ငပလီကမ်းခြေ\n\n(ခ) အင်းစိန်ထောင်\n\n(ဂ) စင်္ကာပူ\n\n… အဖြေကို နောက်ဆလိုက်တွင် ကြည့်ပါ …" },

                { img: "slide6.jpg", tag: "✅ အဖြေ",
                  head: "(ခ) အင်းစိန်ထောင်",
                  body: "ဗဟန်းမြို့နယ်တရားရုံးမှ ခြောက်လထောင်ဒဏ် ချမှတ်ခံရသည်။ ထောင်ထဲရောက်နေစဉ်မှာပင် သပိတ်ပွဲစပွန်ဆာကြေး ဝေစုများ ဆက်လက်ရရှိခဲ့သည်ဟု မှတ်တမ်းများက ဆိုသည်။" },

                { img: "slide7.jpg", tag: "📜 သိကောင်းစရာ #၄",
                  head: "မျိုးစောင့်ဥပဒေ ထောက်ခံသူကြီး",
                  body: "တစ်လင်တစ်ယားစနစ် မျိုးစောင့်ဥပဒေကို အားကြိုးမာန်တက် ထောက်ခံခဲ့သူ ဖြစ်သော်လည်း ကိုယ်တိုင်မှာမူ ဇနီး ၄ ဦး ရှိခဲ့ဖူးသည်။ ဥပဒေပညာရှင်ဆိုတော့ ကွက်လပ်များကို ကောင်းစွာ သိသည်ဟု ယူဆရသည်။" },

                { img: "slide8.jpg", tag: "📜 သိကောင်းစရာ #၅",
                  head: "တောသားနှိမ်နင်းရေးအသင်း",
                  body: "၂၀၂၁ တွင် တည်ထောင်ခဲ့သော Anti-Tarzan Association သည် ထောက်ခံသူ ၁၀၀,၀၀၀ ကျော်၊ ဆန္ဒပြပွဲ ၅၀ ကျော် စွမ်းဆောင်ပြီးဖြစ်သည်။ ရည်ရွယ်ချက် — ပညာပေးခြင်း၊ တရားဥပဒေစိုးမိုးရေး၊ အကူအညီပေးခြင်း၊ အသိပညာဖြန့်ဝေခြင်း။" },

                { img: "slide9.jpg", tag: "❓ အသိစစ်ဆေးရေး မေးခွန်း #၃",
                  head: "\"တာဇံ\" ဆိုသည်မှာ?",
                  body: "(က) သစ်ပင်ပေါ်နေထိုင်သူ\n\n(ခ) လူမှုကျင့်ဝတ် မလိုက်နာသော တောသား\n\n(ဂ) ရုပ်ရှင်ဇာတ်ကောင်\n\n… အဖြေကို နောက်ဆလိုက်တွင် ကြည့်ပါ …" },

                { img: "slide10.jpg", tag: "✅ အဖြေ",
                  head: "(ခ) လူမှုကျင့်ဝတ် မလိုက်နာသော တောသား",
                  body: "လူမှုကျင့်ဝတ်များကို မလိုက်နာသော၊ အများပြည်သူကို အနှောင့်အယှက်ပေးသော သူများကို ရည်ညွှန်းသည်။ Thakhin OS တပ်ဆင်ပြီးသူတိုင်း မြို့သားသခင်အဖြစ် အလိုအလျောက် အသိအမှတ်ပြုခံရမည်။" },

                { img: "slide11.jpg", tag: "📜 သိကောင်းစရာ #၆",
                  head: "မြန်မာနိုင်ငံတောသားကောင်စီ (MTC)",
                  body: "တောသားရေးရာကိစ္စများကို စနစ်တကျ ကိုင်တွယ်နိုင်ရန် မြန်မာနိုင်ငံတောသားကောင်စီ (MTC) ကို ဖွဲ့စည်းထားသည်။ ဂီယာပုံသဏ္ဌာန် တံဆိပ်တော်ကြီး၏ အလယ်တွင် ဥက္ကဋ္ဌကြီး၏ မျက်နှာတော်ပုံ ပါဝင်သည် — Thakhin OS သည် MTC တရားဝင် အသိအမှတ်ပြု OS ဖြစ်သည်။" },

                { img: "slide11.jpg", tag: "❓ အသိစစ်ဆေးရေး မေးခွန်း #၄",
                  head: "MTC ၏ အဓိပ္ပာယ်အပြည့်အစုံမှာ?",
                  body: "(က) Myanmar Tech Community\n\n(ခ) မြန်မာနိုင်ငံတောသားကောင်စီ\n\n(ဂ) Myanmar Tarzan Cinema\n\n… အဖြေကို နောက်ဆလိုက်တွင် ကြည့်ပါ …" },

                { img: "slide11.jpg", tag: "✅ အဖြေ",
                  head: "(ခ) မြန်မာနိုင်ငံတောသားကောင်စီ",
                  body: "ပြည်ထောင်စုသမ္မတမြန်မာနိုင်ငံတော် — မြန်မာနိုင်ငံတောသားကောင်စီ။ တောသားကိစ္စ အားလုံးအတွက် တစ်ခုတည်းသော တရားဝင် ကောင်စီကြီး ဖြစ်သည်။" },

                { img: "slide12.jpg", tag: "📜 သိကောင်းစရာ #၇",
                  head: "ရှေ့တန်းအမှတ် (၁) တပ်ဖွဲ့ခွဲ",
                  body: "တောနက်ကြီးများအတွင်း စခန်းချထားသော \"ရှေ့တန်းအမှတ် (၁) တောသားထိန်းသိမ်းရေးတပ်ဖွဲ့ခွဲ\" သည် တောသားများကို လူမှုကျင့်ဝတ် ပြန်လည်သင်ကြားပေးရေး ရှေ့တန်းစခန်းကြီး ဖြစ်သည်။ ကုလသမဂ္ဂအလံလည်း လွှင့်ထူထားသည် (တရားဝင်မှု အပြည့်)။" },

                { img: "slide12.jpg", tag: "❓ အသိစစ်ဆေးရေး မေးခွန်း #၅",
                  head: "ရှေ့တန်းအမှတ် (၁) တပ်ဖွဲ့ခွဲ၏ တာဝန်မှာ?",
                  body: "(က) သစ်တောစိုက်ပျိုးရေး\n\n(ခ) ခရီးသွားလုပ်ငန်း\n\n(ဂ) တောသားထိန်းသိမ်းရေး\n\n… အဖြေကို နောက်ဆလိုက်တွင် ကြည့်ပါ …" },

                { img: "slide12.jpg", tag: "✅ အဖြေ",
                  head: "(ဂ) တောသားထိန်းသိမ်းရေး",
                  body: "တာဇံများကို ဖမ်းဆီးခြင်းမဟုတ် — \"ထိန်းသိမ်းစောင့်ရှောက်ခြင်း\" ဖြစ်သည်။ ခြားနားချက်မှာ ဥပဒေအရ အလွန်အရေးကြီးသည်ဟု ဥက္ကဋ္ဌကြီး (LL.B) က ရှင်းပြသည်။" },

                { img: "slide7.jpg", tag: "❓ အသိစစ်ဆေးရေး မေးခွန်း #၆",
                  head: "ဥက္ကဋ္ဌကြီး ဦးဆောင်ခဲ့သော ဆန္ဒပြပွဲ စုစုပေါင်း?",
                  body: "(က) ၅ ပွဲ\n\n(ခ) ၅၀ ကျော်\n\n(ဂ) ၅၀၀,၀၀၀ ပွဲ\n\n… အဖြေကို နောက်ဆလိုက်တွင် ကြည့်ပါ …" },

                { img: "slide8.jpg", tag: "✅ အဖြေ",
                  head: "(ခ) ၅၀ ကျော်",
                  body: "ဆန္ဒပြပွဲ ၅၀ ကျော်၊ စာအုပ် ၂၀ ကျော်၊ ထောက်ခံသူ ၁၀၀,၀၀၀ ကျော်၊ လှုပ်ရှားမှုနှစ်ပေါင်း ၁၅ နှစ်။ တက်သည်ဖြစ်စေ မတက်သည်ဖြစ်စေ ဝေစုမှာ ပုံမှန်ရသည်ဟု သမိုင်းမှတ်တမ်းများက ဆိုသည်။" },

                { img: "slide2.jpg", tag: "🖥 စက်မရွေး တပ်ဆင်နိုင်",
                  head: "Laptop / PC ဟောင်းသစ်မရွေး",
                  body: "Thakhin OS သည် BIOS နှင့် UEFI နှစ်မျိုးလုံး ထောက်ပံ့သော hybrid ISO ဖြစ်သဖြင့် Windows laptop များ၊ Linux PC များ၊ Intel Mac များပေါ်တွင် USB မှတစ်ဆင့် တိုက်ရိုက် တပ်ဆင်နိုင်သည်။ VirtualBox / VMware / UTM တို့တွင်လည်း အဆင်ပြေသည်။" },

                { img: "slide11.jpg", tag: "😄 Tech သိကောင်းစရာ #၁",
                  head: "sudo → thakhin",
                  body: "Thakhin OS တွင် root အခွင့်အာဏာ တောင်းရန် sudo အစား thakhin ကို သုံးသည်။ ဝင်ရောက်တိုက်ခိုက်လာသော hacker တာဇံများ command မှတ်မိမှု ရှုပ်ထွေးသွားစေရန် ဥက္ကဋ္ဌကြီး ကိုယ်တိုင် ဒီဇိုင်းဆွဲထားခြင်း ဖြစ်သည် (မူရင်း sudo ကိုလည်း ဆက်သုံးနိုင်)။" },

                { img: "slide2.jpg", tag: "😄 Tech သိကောင်းစရာ #၂",
                  head: "Production ပေါ် တိုက်ရိုက် edit = တာဇံ",
                  body: "ဥက္ကဋ္ဌကြီး၏ အဆိုအရ — staging မစမ်းဘဲ production ပေါ်တွင် တိုက်ရိုက် edit လုပ်ခြင်း၊ commit message ကို 'asdf' ဟု ရေးခြင်းတို့သည် 'digital တာဇံ' လုပ်ရပ်များ ဖြစ်သည်။ မြို့သားသခင်တစ်ယောက်သည် အမြဲ git branch ခွဲပြီးမှ commit လုပ်သည်။" },

                { img: "slide1.jpg", tag: "🛠 ဆော့ဖ်ဝဲအစုံ",
                  head: "မြို့သားသခင် Developer Edition",
                  body: "VS Code, Git, Docker, Python, Node.js, Go, Java, PHP, Rust, C/C++, clang, ripgrep, fzf — အားလုံး ကြိုတင်တပ်ဆင်ပြီးသား။ Terminal ထဲတွင် \"thakhin-facts\" နှင့် \"tarzan-check\" ကို စမ်းကြည့်ပါ။\n\nBrowser homepage မှာ winkokolatt.me (offline မိတ္တူ) ဖြစ်သည်။" }
            ]

            function advance() {
                idx = (idx + 1) % deck.length;
                bounceAnim.restart();
            }

            Timer {
                interval: 8000
                running: true
                repeat: true
                onTriggered: root.advance()
            }

            /* ---- top banner: Buddhist flag | title | MTC seal ---- */
            Rectangle {
                id: topbar
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                height: 54
                color: "#141414"
                border.color: "#D4AF37"
                border.width: 1

                Image {
                    id: flag
                    source: "flag.png"
                    height: 36
                    fillMode: Image.PreserveAspectFit
                    anchors.left: parent.left
                    anchors.leftMargin: 14
                    anchors.verticalCenter: parent.verticalCenter
                }
                Text {
                    id: wheel
                    text: "☸"
                    color: "#D4AF37"
                    font.pixelSize: 30
                    anchors.left: flag.right
                    anchors.leftMargin: 14
                    anchors.verticalCenter: parent.verticalCenter
                    RotationAnimation on rotation {
                        from: 0; to: 360
                        duration: 6000
                        loops: Animation.Infinite
                        running: true
                    }
                }
                Text {
                    anchors.centerIn: parent
                    text: "သခင် OS ၁.၀ — Anti-Tarzan Community Edition"
                    font.family: "Padauk"
                    font.bold: true
                    font.pixelSize: 20
                    color: "#D4AF37"
                }
                Image {
                    source: "mtc.png"
                    height: 44
                    fillMode: Image.PreserveAspectFit
                    anchors.right: parent.right
                    anchors.rightMargin: 12
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            /* ---- photo card (bouncy) ---- */
            Image {
                id: photo
                source: root.deck[root.idx].img
                width: parent.width * 0.40
                fillMode: Image.PreserveAspectFit
                anchors.left: parent.left
                anchors.leftMargin: parent.width * 0.04
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: 6
            }

            /* ---- text column (slides in) ---- */
            Item {
                id: contentWrap
                anchors.left: photo.right
                anchors.leftMargin: 24
                anchors.right: parent.right
                anchors.rightMargin: parent.width * 0.04
                anchors.top: topbar.bottom
                anchors.bottom: dotsRow.top

                Column {
                    id: content
                    spacing: 12
                    width: parent.width
                    anchors.verticalCenter: parent.verticalCenter

                    Rectangle {
                        id: tagChip
                        radius: 14
                        color: "#1f1a08"
                        border.color: "#FF9933"
                        border.width: 1
                        width: tagText.width + 26
                        height: tagText.height + 10
                        Text {
                            id: tagText
                            anchors.centerIn: parent
                            text: root.deck[root.idx].tag
                            font.family: "Padauk"
                            font.pixelSize: 17
                            color: "#FF9933"
                        }
                        SequentialAnimation on border.width {
                            loops: Animation.Infinite
                            NumberAnimation { from: 1; to: 3; duration: 900; easing.type: Easing.InOutQuad }
                            NumberAnimation { from: 3; to: 1; duration: 900; easing.type: Easing.InOutQuad }
                        }
                    }
                    Text {
                        width: parent.width
                        text: root.deck[root.idx].head
                        font.family: "Padauk"
                        font.bold: true
                        font.pixelSize: 29
                        color: "#D4AF37"
                        wrapMode: Text.Wrap
                    }
                    Text {
                        width: parent.width
                        text: root.deck[root.idx].body
                        font.family: "Padauk"
                        font.pixelSize: 18
                        color: "#FAFAFA"
                        wrapMode: Text.Wrap
                        lineHeight: 1.25
                    }
                }
            }

            /* ---- slide-change animation: photo bounce + text fade/slide ---- */
            ParallelAnimation {
                id: bounceAnim
                NumberAnimation {
                    target: photo; property: "scale"
                    from: 0.72; to: 1.0; duration: 750
                    easing.type: Easing.OutBack; easing.overshoot: 2.2
                }
                NumberAnimation {
                    target: content; property: "opacity"
                    from: 0.0; to: 1.0; duration: 650
                }
                NumberAnimation {
                    target: content; property: "x"
                    from: 60; to: 0; duration: 650
                    easing.type: Easing.OutCubic
                }
            }

            /* ---- progress dots ---- */
            Row {
                id: dotsRow
                spacing: 9
                anchors.bottom: footer.top
                anchors.bottomMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                Repeater {
                    model: root.deck.length
                    Rectangle {
                        width: index === root.idx ? 14 : 9
                        height: width
                        radius: width / 2
                        color: index === root.idx ? "#D4AF37" : "#3a3a3a"
                        anchors.verticalCenter: parent.verticalCenter
                        Behavior on width { NumberAnimation { duration: 300; easing.type: Easing.OutBack } }
                        Behavior on color { ColorAnimation { duration: 300 } }
                    }
                }
            }

            Text {
                id: footer
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                text: "တောသားနှိမ်နင်းရေးအသင်း | မြန်မာနိုင်ငံတောသားကောင်စီ (MTC) အသိအမှတ်ပြု | winkokolatt.me"
                font.family: "Padauk"
                font.pixelSize: 13
                color: "#888888"
            }
        }
    }
}
