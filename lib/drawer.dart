import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Assuming you're using GetX for navigation and state management.
import 'package:majlis/assets.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart'; // For launching URLs.

class CustomDrawer extends StatelessWidget {
  final bool darkMode;
  final String appIcon;
  final String shareTxt;

  const CustomDrawer({
    Key? key,
    required this.darkMode,
    required this.appIcon,
    required this.shareTxt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: darkMode ? Colors.white : Colors.brown,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 240,
            child: DrawerHeader(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: darkMode ? gradmainlt : gradmaindrk,
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                ),
              ),
              child: Image.asset(
                appIcon,
                height: 45,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: Divider(
              height: 6,
              thickness: 0.2,
              color: Colors.white,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.input,
              color: darkMode ? mainColor : Colors.white,
            ),
            title: Text(
              'Share App',
              style: TextStyle(
                color: darkMode ? mainColor : Colors.white,
                fontSize: 20,
                fontFamily: 'amiri',
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              Share.share(shareTxt);
              Get.back(); // Assuming you're using GetX navigation to close the drawer.
            },
          ),
          ListTile(
            leading: Icon(
              Icons.system_update,
              color: darkMode ? mainColor : Colors.white,
            ),
            title: Text(
              'Check For Update',
              style: TextStyle(
                color: darkMode ? mainColor : Colors.white,
                fontSize: 20,
                fontFamily: 'amiri',
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              launch(
                  'https://play.google.com/store/apps/details?id=com.noorullah.majlis1');
              Get.back(); // Assuming you're using GetX navigation to close the drawer.
            },
          ),
          ListTile(
            leading: Icon(
              Icons.message,
              color: darkMode ? mainColor : Colors.white,
            ),
            title: Text(
              'Feedback',
              style: TextStyle(
                color: darkMode ? mainColor : Colors.white,
                fontSize: 20,
                fontFamily: 'amiri',
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              launch(
                  'https://wa.me/+919895207397/?text=Majlisu%20ahlu%20noorullah%20feedback%20');
              Get.back(); // Assuming you're using GetX navigation to close the drawer.
            },
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: darkMode
                  ? mainColor
                  : Colors.white, // Assuming mainColor is defined somewhere.
            ),
            title: Text(
              'About',
              style: TextStyle(
                color: darkMode
                    ? mainColor
                    : Colors.white, // Assuming mainColor is defined somewhere.
                fontSize: 20,
                fontFamily: 'amiri',
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => _buildPopupDialog(context),
              );
            },
          ),
          Divider(
            thickness: 0.3,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      title: Text('About', style: TextStyle(color: mainColor)),
      content: Text(
        aboutTxt,
        style: TextStyle(color: blk, fontSize: 18),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close', style: TextStyle(color: mainColor)),
        )
      ],
    );
  }
}
