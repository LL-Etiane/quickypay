import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quickypay/colors.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanQrCodeScreen extends StatefulWidget {
  const ScanQrCodeScreen({Key? key}) : super(key: key);

  @override
  State<ScanQrCodeScreen> createState() => _ScanQrCodeScreenState();
}

class _ScanQrCodeScreenState extends State<ScanQrCodeScreen> {
  String _scanData = '';

  // Future<void> scanQrCode() async {
  //   String scannedRes;
  //   try {
  //     scannedRes = await FlutterBarcodeScanner.scanBarcode(
  //         '#ff6666', 'Cancel', true, ScanMode.QR);
  //   } on PlatformException {
  //     scannedRes = "Failed to get platform version";
  //   }

  //   if (!mounted) {
  //     return;
  //   }

  //   setState(() {
  //     _scanData = scannedRes;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Receive money"),
        centerTitle: true,
        backgroundColor: Colors.white24,
        foregroundColor: kprimaryColor,
        elevation: 0,
      ),
      body: Center(child: Text("Okay")),
    );
  }
}
