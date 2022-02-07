import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quickypay/colors.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:ussd_advanced/ussd_advanced.dart';
import 'dart:convert';

class SendScreen extends StatefulWidget {
  SendScreen({Key? key}) : super(key: key);

  @override
  State<SendScreen> createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {
  final TextEditingController amount = TextEditingController();

  final TextEditingController number = TextEditingController();

  String _errorMessage = "";
  String _scanData = '';
  String _ussdData = "";

  Future<void> scanQrCode() async {
    String scannedRes;
    try {
      scannedRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      Map<String, String> scanData = jsonDecode(scannedRes);
      setState(() {
        _ussdData = "*126*1*1*${scanData['number']}*${scanData['amount']}#";
      });
    } on PlatformException {
      scannedRes = "Failed to get platform version";
    }

    if (!mounted) {
      return;
    }

    setState(() {
      _scanData = scannedRes;
    });
  }

  makeMyRequest() async {
    UssdAdvanced.sendUssd(code: _ussdData, subscriptionId: 1);
  }

  @override
  void dispose() {
    amount.dispose();
    number.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Send money"),
        centerTitle: true,
        backgroundColor: Colors.white24,
        foregroundColor: kprimaryColor,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            TextButton(
                onPressed: () async {
                  scanQrCode();
                  // Navigator.pushNamed(context, '/scanqrcode');
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: kprimaryColor,
                  ),
                  child: const Text(
                    "Scan Qrcode",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
            const SizedBox(
              height: 40,
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter amount",
              ),
              controller: amount,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter number to send to",
              ),
              controller: number,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              _errorMessage,
              style: const TextStyle(color: Colors.red),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  if (amount.text != '' || number.text != '') {
                    setState(() {
                      _errorMessage = '';
                      _ussdData = "*126*1*1*${number.text}*${amount.text}#";
                    });
                    makeMyRequest();
                    amount.clear();
                    number.clear();
                  } else {
                    setState(() {
                      _errorMessage = "Amount cannot be empty";
                    });
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: kprimaryColor,
                  ),
                  child: const Text(
                    "Send",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
