import 'package:flutter/material.dart';
import 'package:quickypay/colors.dart';

import 'package:quickypay/utils/operations.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final userNameController = TextEditingController();

  final mobileNumberController = TextEditingController();

  String successText = '';
  String errorText = '';
  QuickyPay user = QuickyPay();

  @mustCallSuper
  void dispose() {
    userNameController.dispose();
    mobileNumberController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    user.userInfo();
    user.userInfo().then((value) {
      setState((){});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
        backgroundColor: Colors.white24,
        foregroundColor: kprimaryColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Text(
                  "Fill all the inputs correctly",
                  style: TextStyle(
                    fontSize: 24,
                    color: kprimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                SettingsInputForm(
                  hintText: "Enter your name",
                  inputController: userNameController,
                ),
                const SizedBox(
                  height: 10,
                ),
                SettingsInputForm(
                  hintText: "Mobile number (MTN cameroon only)",
                  inputController: mobileNumberController,
                ),
                const SizedBox(
                  height: 40,
                ),
                TextButton(
                    onPressed: () async {
                      await QuickyPay.setInfo(
                          userNameController.text, mobileNumberController.text);
                      setState(() {
                        successText = "Information successfully saved";
                      });
                      userNameController.clear();
                      mobileNumberController.clear();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: kprimaryColor,
                      ),
                      child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  successText,
                  style: TextStyle(color: kprimaryColor, fontSize: 16),
                ),
                Text(
                  errorText,
                  style: const TextStyle(color: Colors.red),
                ),
                Text(
                  "Current name: ${user.name}",
                  style: TextStyle(color: kprimaryColor, fontSize: 16),
                ),
                Text(
                  "Current number: ${user.number}",
                  style: TextStyle(color: kprimaryColor, fontSize: 16),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SettingsInputForm extends StatelessWidget {
  final String hintText;
  final TextEditingController inputController;
  const SettingsInputForm(
      {Key? key, required this.hintText, required this.inputController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          border: const OutlineInputBorder(), hintText: hintText),
      controller: inputController,
    );
  }
}
