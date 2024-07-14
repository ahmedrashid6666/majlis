// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'dart:async';
// import 'dart:io';
// import 'package:path_provider/path_provider.dart';

// class AutoScrollPdfViewer extends StatefulWidget {
//   final String pdfAssetPath;

//   AutoScrollPdfViewer({required this.pdfAssetPath});

//   @override
//   _AutoScrollPdfViewerState createState() => _AutoScrollPdfViewerState();
// }

// class _AutoScrollPdfViewerState extends State<AutoScrollPdfViewer> {
//   PDFViewController? _pdfViewController;  // Use PDFViewController? instead of late
//   int _totalPages = 0;
//   int _currentPage = 0;
//   bool _isScrolling = false;
//   Timer? _scrollTimer;
//   double _scrollSpeed = 1.0;

//   @override
//   void initState() {
//     super.initState();
//     _loadPdf();
//   }

//   @override
//   void dispose() {
//     _scrollTimer?.cancel();
//     super.dispose();
//   }

//   Future<void> _loadPdf() async {
//     final ByteData data = await rootBundle.load(widget.pdfAssetPath);
//     final Directory tempDir = await getTemporaryDirectory();
//     final File tempFile = File('${tempDir.path}/temp.pdf');
//     await tempFile.writeAsBytes(data.buffer.asUint8List(), flush: true);

//     setState(() {
//       _totalPages = 0;  // Initialize total pages to zero initially
//     });
//   }

//   void _startAutoScroll() {
//     _isScrolling = true;
//     _scrollTimer = Timer.periodic(Duration(milliseconds: (2000 / _scrollSpeed).toInt()), (timer) async {
//       if (_currentPage < _totalPages - 1 && _isScrolling) {
//         _currentPage++;
//         await _pdfViewController?.setPage(_currentPage);
//       } else {
//         timer.cancel();
//       }
//     });
//   }

//   void _stopAutoScroll() {
//     _isScrolling = false;
//     _scrollTimer?.cancel();
//   }

//   void _updateScrollSpeed(double speed) {
//     setState(() {
//       _scrollSpeed = speed;
//     });
//     if (_isScrolling) {
//       _stopAutoScroll();
//       _startAutoScroll();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Auto-Scroll Viewer'),
//       ),
//       body: _totalPages == 0
//           ? Center(child: CircularProgressIndicator())
//           : Row(
//               children: [
//                 Expanded(
//                   child: Stack(
//                     children: [
//                       PDFView(
//                         filePath: 'assets/sample.pdf',
//                         onViewCreated: (controller) {
//                           setState(() {
//                             _pdfViewController = controller;
//                           });
//                         },
//                         onRender: (_pages) {
//                           setState(() {
//                             _totalPages = _pages!;
//                           });
//                         },
//                         onPageChanged: (page, total) {
//                           setState(() {
//                             _currentPage = page!;
//                           });
//                         },
//                       ),
//                       Positioned(
//                         right: 10,
//                         top: 0,
//                         bottom: 0,
//                         child: Container(
//                           width: 40,
//                           color: Colors.black.withOpacity(0.5),
//                           child: RotatedBox(
//                             quarterTurns: -1,
//                             child: Slider(
//                               value: _scrollSpeed,
//                               min: 0.5,
//                               max: 5.0,
//                               divisions: 9,
//                               label: _scrollSpeed.toStringAsFixed(1),
//                               onChanged: _updateScrollSpeed,
//                               activeColor: Colors.white,
//                               inactiveColor: Colors.white54,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   width: 60,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       ElevatedButton(
//                         onPressed: _isScrolling ? _stopAutoScroll : _startAutoScroll,
//                         child: Text(_isScrolling ? 'Stop' : 'Start'),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }
