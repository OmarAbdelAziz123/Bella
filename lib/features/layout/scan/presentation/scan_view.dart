import 'package:bella/features/layout/my_brands/managers/my_brands_cubit.dart';
import 'package:bella/features/layout/scan/managers/scan_cubit.dart';
import 'package:bella/features/layout/scan/presentation/widgets/terms_and_conditions_view_in_scan_body.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScanView extends StatefulWidget {
  const ScanView({Key? key}) : super(key: key);

  final Color overlayColor = AppColors.black2Color;

  @override
  State<ScanView> createState() => _ScanViewState();
}

class _ScanViewState extends State<ScanView> {
  // var getResult = 'QR Code Result';

  @override
  void initState() {
    super.initState();
    // BlocProvider.of<ScanCubit>(context).getScanFunction(context);
  }

  @override
  Widget build(BuildContext context) {
    // double scanArea = (MediaQuery.of(context).size.width < 400 ||
    //         MediaQuery.of(context).size.height < 400)
    //     ? 200
    //     : 330;

    return BlocConsumer<ScanCubit, ScanState>(
      listener: (context, state) {
        if (state is San2SuccessState) {
          print('Success');
          BlocProvider.of<ScanCubit>(context).getScanFunction(context);
        } else if (state is ScanErrorState) {
          print('error');
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          // body: Center(
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         ElevatedButton(
          //           onPressed: () {
          //             scanQRCode();
          //           },
          //           child: const Text('Scan QR'),
          //         ),
          //         const SizedBox(
          //           height: 20.0,
          //         ),
          //         Text(
          //           getResult,
          //           style: const TextStyle(color: Colors.white,),
          //         ),
          //       ],
          //     )),
        );
      },
    );

    // return Stack(
    //   children: [
    //     MobileScanner(
    //       controller: mobileScannerController,
    //       onDetect: (barcode) {
    //         debugPrint('Barcode Found! ${barcode.raw}');
    //       },
    //     ),
    //     ColorFiltered(
    //       colorFilter: ColorFilter.mode(
    //         widget.overlayColor,
    //         BlendMode.srcOut,
    //       ),
    //       child: Stack(
    //         children: [
    //           Container(
    //             decoration: const BoxDecoration(
    //               color: Colors.red,
    //               backgroundBlendMode: BlendMode.dstOut,
    //             ),
    //           ),
    //           Align(
    //             alignment: Alignment.center,
    //             child: Container(
    //               height: scanArea,
    //               width: scanArea,
    //               decoration: BoxDecoration(
    //                 color: Colors.red,
    //                 borderRadius: BorderRadius.circular(20),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //     Align(
    //       alignment: Alignment.center,
    //       child: CustomPaint(
    //         foregroundPainter: BorderPainter(),
    //         child: SizedBox(
    //           height: scanArea + 25,
    //           width: scanArea + 25,
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }

// void scanQRCode() async {
//   try {
//     final qrCode = await FlutterBarcodeScanner.scanBarcode(
//         '#ff6666', 'Cancel', true, ScanMode.QR);
//
//     if (!mounted) return;
//
//     setState(() {
//       getResult = qrCode;
//     });
//     print("QRCode_Result:--");
//     print(qrCode);
//   } on PlatformException {
//     getResult = 'Failed to scan QR Code.';
//   }
// }
  ///
//
// class BorderPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     const width = 4.0;
//     const radius = 20.0;
//     const tRadius = 3 * radius;
//     final rect = Rect.fromLTWH(
//       width,
//       width,
//       size.width - 2 * width,
//       size.height - 2 * width,
//     );
//     final rrect = RRect.fromRectAndRadius(rect, const Radius.circular(radius));
//     const clippingRect0 = Rect.fromLTWH(
//       0,
//       0,
//       tRadius,
//       tRadius,
//     );
//     final clippingRect1 = Rect.fromLTWH(
//       size.width - tRadius,
//       0,
//       tRadius,
//       tRadius,
//     );
//     final clippingRect2 = Rect.fromLTWH(
//       0,
//       size.height - tRadius,
//       tRadius,
//       tRadius,
//     );
//     final clippingRect3 = Rect.fromLTWH(
//       size.width - tRadius,
//       size.height - tRadius,
//       tRadius,
//       tRadius,
//     );
//
//     final path = Path()
//       ..addRect(clippingRect0)
//       ..addRect(clippingRect1)
//       ..addRect(clippingRect2)
//       ..addRect(clippingRect3);
//
//     canvas.clipPath(path);
//     canvas.drawRRect(
//       rrect,
//       Paint()
//         ..color = Colors.white
//         ..style = PaintingStyle.stroke
//         ..strokeWidth = width,
//     );
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }
//
// class BarReaderSize {
//   static double width = 200;
//   static double height = 200;
// }
//
// class OverlayWithHolePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()..color = Colors.black54;
//     canvas.drawPath(
//         Path.combine(
//           PathOperation.difference,
//           Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
//           Path()
//             ..addOval(Rect.fromCircle(
//                 center: Offset(size.width - 44, size.height - 44), radius: 40))
//             ..close(),
//         ),
//         paint);
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }
//
// @override
// bool shouldRepaint(CustomPainter oldDelegate) {
//   return false;
// }
}
