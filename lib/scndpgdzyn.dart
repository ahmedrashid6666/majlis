import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majlis/assets.dart';
import 'package:majlis/pdfcache.dart';

class Scndpgdzyn extends StatelessWidget {
  late bool btn2;
  late bool btn3;
  late bool btn4;
  late bool btn5;
  late bool btn6;
  late bool btn7;
  late String? appbartitle;

  late String? btn1title;
  late String? btn2title;
  late String? btn3title;
  late String? btn4title;
  late String? btn5title;
  late String? btn6title;
  late String? btn7title;
  late VoidCallback? btn1action;
  late VoidCallback? btn2action;
  late VoidCallback? btn3action;
  late VoidCallback? btn4action;
  late VoidCallback? btn5action;
  late VoidCallback? btn6action;
  late VoidCallback? btn7action;

  Scndpgdzyn(
      {this.btn2 = true,
      this.btn3 = false,
      this.btn4 = false,
      this.btn5 = false,
      this.btn6 = false,
      this.btn7 = false,
      this.appbartitle,
      this.btn1title,
      this.btn2title,
      this.btn3title,
      this.btn4title,
      this.btn5title,
      this.btn6title,
      this.btn7title,
      this.btn1action,
      this.btn2action,
      this.btn3action,
      this.btn4action,
      this.btn5action,
      this.btn6action,
      this.btn7action});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: mainColor.withOpacity(0.2),
        title: Text(
          appbartitle!,
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'mlm',
            fontWeight: FontWeight.w800,
            color: white,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 4,
      ),
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(scndpgbg),
              fit: BoxFit.cover,
            ),
          ),
        ),
        ListView(
          padding: EdgeInsets.all(10),
          children: <Widget>[
            Container(
              color: transparent,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15, // Space between columns
                  mainAxisSpacing: 15, // Space between rows
                  padding: EdgeInsets.zero, // No padding around the grid
                  childAspectRatio:
                      2, // Ensures items are square; adjust if needed
                  children: <Widget>[
                    Detailed1(btn1title!, btn1action!),
                    btn2
                        ? Detailed1(btn2title!, btn2action!)
                        : const SizedBox(),
                    btn3
                        ? Detailed1(btn3title!, btn3action!)
                        : const SizedBox(),
                    btn4
                        ? Detailed1(btn4title!, btn4action!)
                        : const SizedBox(),
                    btn5
                        ? Detailed1(btn5title!, btn5action!)
                        : const SizedBox(),
                    btn6
                        ? Detailed1(btn6title!, btn6action!)
                        : const SizedBox(),
                    btn7
                        ? Detailed1(btn7title!, btn7action!)
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

class Detailed1 extends StatelessWidget {
  final String title;
  final VoidCallback buttonAction;

  Detailed1(this.title, this.buttonAction);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: buttonAction,
      child: Container(
        // Ensure no extra margins
        padding: EdgeInsets.all(10), // Ensure no extra padding
        width: 50,
        height: 5, // Make it fill the grid cell
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
            textAlign: TextAlign.center, // Center text
            style: TextStyle(
              color: mainColor,
              fontSize: 24,
              fontFamily: 'mlm',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
