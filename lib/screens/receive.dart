import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quickypay/colors.dart';
import 'dart:convert';

import '../utils/operations.dart';

class ReceiveScreen extends StatefulWidget {
  ReceiveScreen({Key? key}) : super(key: key);

  @override
  State<ReceiveScreen> createState() => _ReceiveScreenState();
}

class _ReceiveScreenState extends State<ReceiveScreen> {
  final TextEditingController amount = TextEditingController();
  final String _errorMessage = '';

  String _config = "";

  var userinfo = Map<String, String>();

  final QuickyPay user = QuickyPay();

  @override
  void initState() {
    user.userInfo();
    user.userInfo().then((value) {
      setState(() {});
    });
    amount.addListener(() {
      setState(() {
        _config = jsonEncode(
            {"name": user.name, "number": user.number, "amount": amount.text});
      });
      print(_config);
    });
    super.initState();
  }

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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            BarcodeWidget(data: _config, barcode: Barcode.qrCode()),
            const SizedBox(
              height: 40,
            ),
            TextField(
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "Enter amount to recieve on ${user.number}"),
              controller: amount,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              _errorMessage,
              style: const TextStyle(color: Colors.red),
            )
          ],
        ),
      ),
    );
  }
}
