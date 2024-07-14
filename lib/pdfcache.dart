import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'assets.dart';

enum BlendModes {
  difference,
  darken,
}

class PdfViewer extends StatefulWidget {
  PdfViewer({Key? key, required this.pdfbartitle, required this.pdfAssetPath})
      : super(key: key);

  final String pdfAssetPath;
  BlendModes blendMode = BlendModes.darken;
  String pdfbartitle;

  @override
  State<PdfViewer> createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  final Completer<PDFViewController> _pdfViewController =
      Completer<PDFViewController>();
  final StreamController<String> _pageCountController =
      StreamController<String>();

  @override
  void initState() {
    super.initState();
    // Allow auto-rotation in both portrait and landscape modes
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    _pageCountController.close();
    // Reset the orientation when the viewer is closed
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          widget.pdfbartitle,
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'mlm',
            fontWeight: FontWeight.w800,
            color: white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              widget.blendMode == BlendModes.difference
                  ? Icons.light_mode
                  : Icons.nightlight_round,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                widget.blendMode = widget.blendMode == BlendModes.difference
                    ? BlendModes.darken
                    : BlendModes.difference;
              });
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.white,
                widget.blendMode == BlendModes.difference
                    ? BlendMode.difference
                    : BlendMode.darken,
              ),
              child: PDF(
                swipeHorizontal: false,
                enableSwipe: true,
                autoSpacing: false,
                pageSnap: false,
                pageFling: false,
                onPageChanged: (int? current, int? total) {
                  if (current != null && total != null) {
                    _pageCountController.add('${current + 1} - $total');
                  }
                },
                onViewCreated: (PDFViewController pdfViewController) async {
                  _pdfViewController.complete(pdfViewController);
                  final int? currentPage =
                      await pdfViewController.getCurrentPage();
                  final int? pageCount = await pdfViewController.getPageCount();
                  if (currentPage != null && pageCount != null) {
                    _pageCountController.add('${currentPage + 1} - $pageCount');
                  }
                },
              ).fromAsset(
                widget.pdfAssetPath,
                errorWidget: (dynamic error) =>
                    Center(child: Text(error.toString())),
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: StreamBuilder<String>(
              stream: _pageCountController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Center(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                      decoration: BoxDecoration(
                        color: mainColor.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Text(
                        snapshot.data!,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
