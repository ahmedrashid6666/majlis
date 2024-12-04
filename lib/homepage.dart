import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:majlis/Splash.dart';
import 'package:majlis/drawer.dart';
import 'package:majlis/scndpgdzyn.dart';
import 'package:share_plus/share_plus.dart';
import 'pdfcache.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'assets.dart';

class HomePage extends StatefulWidget {
  const HomePage();
  @override
  State<HomePage> createState() => _HomePageState();
}

bool darkMode = false;
IconData _iconLight = Icons.wb_sunny;
IconData _iconDark = Icons.nights_stay;
ThemeData _lightTheme = ThemeData(
  brightness: Brightness.light,
);
ThemeData _darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  brightness: Brightness.dark,
);

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      textDirection: TextDirection.rtl,
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isDarkMode = true;
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        _prefs = prefs;
        darkMode = _prefs.getBool("darkMode") ?? true;
      });
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEdgeDragWidth: 0,
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: transparent,
      ),
      endDrawer: Container(
        color: mainColor,
        width: 270,
        child: CustomDrawer(
          darkMode: true,
          appIcon: appIcon,
          shareTxt: shareTxt,
        ),
      ),
      body: Container(
        color: white,
        child: CustomScrollView(slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: CustomSliverPersistentHeaderDelegate(
              minHeight: 305.0,
              maxHeight: 305.0,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Container(
                    color: Colors.white,
                    child: Image.asset(
                      appbarimg,
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          ),
          SliverPadding(padding: EdgeInsets.all(10)),
          SliverList(
              delegate: SliverChildListDelegate([
            Detailed1('സിൽസില', () {
              Get.to(
                () => Scndpgdzyn(
                  appbartitle: 'സിൽസില',
                  btn1title: 'ഖാദിരിയ്യ സിൽസില',
                  btn1action: () {
                    Get.to(() => PdfViewer(
                          pdfbartitle: 'ഖാദിരിയ്യ സിൽസില',
                          pdfAssetPath: kadiri,
                        ));
                  },
                  btn2title: 'അക്ബരിയ്യ സിൽസില',
                  btn2action: () {
                    Get.to(() => PdfViewer(
                          pdfbartitle: 'അക്ബരിയ്യ സിൽസില',
                          pdfAssetPath: akbariyya,
                        ));
                  },
                ),
              );
            }),
            Detailed1('റാത്തീബ്', () {
              Get.to(() => Scndpgdzyn(
                    btn3: true,
                    appbartitle: 'റാത്തീബ്',
                    btn1title: 'റാത്തീബുല്ലാഹ്',
                    btn1action: () {
                      Get.to(() => PdfViewer(
                            pdfbartitle: 'റാത്തീബുല്ലാഹ്',
                            pdfAssetPath: ratheebullah,
                          ));
                    },
                    btn2title: 'റാത്തിബത്തുന്നൂരിയ്യ',
                    btn2action: () {
                      Get.to(() => PdfViewer(
                            pdfbartitle: 'റാത്തിബത്തുന്നൂരിയ്യ',
                            pdfAssetPath: nooriya,
                          ));
                    },
                    btn3title: 'ചെറിയ റാത്തീബ്',
                    btn3action: () {
                      Get.to(() => PdfViewer(
                            pdfbartitle: 'ചെറിയ റാത്തീബ്',
                            pdfAssetPath: smallrathib,
                          ));
                    },
                  ));
            }),
            Detailed1('ഔറാദുൽ ഉസ്ബൂഅ്', () {
              Get.to(() => Scndpgdzyn(
                    btn3: true,
                    btn4: true,
                    btn5: true,
                    btn6: true,
                    btn7: true,
                    appbartitle: 'ഔറാദുൽ ഉസ്ബൂഅ്',
                    btn1title: 'ഞായർ',
                    btn1action: () {
                      Get.to(() => PdfViewer(
                            pdfbartitle: 'ഞായർ',
                            pdfAssetPath: sunday,
                          ));
                    },
                    btn2title: 'തിങ്കൾ',
                    btn2action: () {
                      Get.to(() => PdfViewer(
                            pdfbartitle: 'തിങ്കൾ',
                            pdfAssetPath: monday,
                          ));
                    },
                    btn3title: 'ചൊവ്വാ',
                    btn3action: () {
                      Get.to(() => PdfViewer(
                            pdfbartitle: 'ചൊവ്വാ',
                            pdfAssetPath: tuesday,
                          ));
                    },
                    btn4title: 'ബുധൻ',
                    btn4action: () {
                      Get.to(() => PdfViewer(
                            pdfbartitle: 'ബുധൻ',
                            pdfAssetPath: wednesday,
                          ));
                    },
                    btn5title: 'വ്യാഴം',
                    btn5action: () {
                      Get.to(() => PdfViewer(
                            pdfbartitle: 'വ്യാഴം',
                            pdfAssetPath: thursday,
                          ));
                    },
                    btn6title: 'വെള്ളി',
                    btn6action: () {
                      Get.to(() => PdfViewer(
                            pdfbartitle: 'വെള്ളി',
                            pdfAssetPath: wirdujuma,
                          ));
                    },
                    btn7title: 'ശനി',
                    btn7action: () {
                      Get.to(() => PdfViewer(
                            pdfbartitle: 'ശനി',
                            pdfAssetPath: saturday,
                          ));
                    },
                  ));
            }),
            Detailed1('ഔറാദ്', () {
              Get.to(() => Scndpgdzyn(
                    appbartitle: 'ഔറാദ്',
                    btn3: true,
                    btn1title: 'വിർദുന്നൂർ',
                    btn1action: () {
                      Get.to(() => PdfViewer(
                            pdfbartitle: 'വിർദുന്നൂർ',
                            pdfAssetPath: wirdunnoor,
                          ));
                    },
                    btn2title: 'ദുആഉന്നൂർ',
                    btn2action: () {
                      Get.to(() => PdfViewer(
                            pdfbartitle: 'ദുആഉന്നൂർ',
                            pdfAssetPath: duaunnoor,
                          ));
                    },
                    btn3title:
                        'അഞ്ച് വക്കത്ത് നിസ്കാര ശേഷം ചൊല്ലാൻ നിർദേശിച്ചത്',
                    btn3action: () {
                      Get.to(() => PdfViewer(
                            pdfbartitle:
                                'അഞ്ച് വക്കത്ത് നിസ്കാര ശേഷം ചൊല്ലാൻ നിർദേശിച്ചത്',
                            pdfAssetPath: afterswalath,
                          ));
                    },
                  ));
            }),
            Detailed1('മുനാജാത്ത്', () {
              Get.to(() => Scndpgdzyn(
                    btn2: false,
                    appbartitle: 'മുനാജാത്ത്',
                    btn1title: 'അറബി മലയാളം',
                    btn1action: () {
                      Get.to(() => PdfViewer(
                            pdfbartitle: 'അറബി മലയാളം',
                            pdfAssetPath: munajathunnooriya,
                          ));
                    },
                  ));
            }),
            Detailed1('ബൈത്ത്', () {
              Get.to(() => Scndpgdzyn(
                    appbartitle: 'ബൈത്ത്',
                    btn1title: 'ഷിഫാ ബൈത്ത്',
                    btn1action: () {
                      Get.to(() => PdfViewer(
                            pdfbartitle: 'ഷിഫാ ബൈത്ത്',
                            pdfAssetPath: shifa,
                          ));
                    },
                    btn2title: 'ബഷാഹിറുൽ ഹൈറാത്ത്',
                    btn2action: () {
                      Get.to(() => PdfViewer(
                            pdfbartitle: 'ബഷാഹിറുൽ ഹൈറാത്ത്',
                            pdfAssetPath: bashaerulkhairath,
                          ));
                    },
                  ));
            }),
          ]))
        ]),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Padding Detailed1(
    // String img,
    String title,
    void Function() buttonAction,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListTile(
        title: InkWell(
          onTap: buttonAction,
          child: Container(
            width: 20,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset: Offset(0, 3),
                  blurRadius: 5.0,
                  spreadRadius: 2.0,
                )
              ],
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: mainColor,
                  fontSize: 25,
                  fontFamily: 'mlm',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSliverPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  CustomSliverPersistentHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(CustomSliverPersistentHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

Widget _buildPopupDialog(BuildContext context) {
  return new AlertDialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15))),
    title: const Text(
      'Majlisu ahlu noorullah',
      style: TextStyle(color: blk, fontSize: 23),
    ),
    content: Scrollbar(
      thumbVisibility: true,
      thickness: 6,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                aboutTxt,
                style: TextStyle(color: blk, fontSize: 21),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    ),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ),
    ],
  );
}
