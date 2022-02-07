import 'package:flutter/material.dart';
import 'package:quickypay/colors.dart';
import 'package:quickypay/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: kprimaryColor,
          elevation: 0,
          title: const Text('QuickyPay'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                },
                icon: const Icon(Icons.settings)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/about');
                },
                icon: const Icon(Icons.contact_mail))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: 210,
                  color: kprimaryColor,
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Column(
                    children: [
                      const Text(
                        "Send and recieve money to your love ones with ease",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconText(
                            text: "Send",
                            icon: Icons.send,
                            action: () {
                              Navigator.pushNamed(context, '/send');
                            },
                          ),
                          const SizedBox(
                            width: 80,
                          ),
                          IconText(
                            text: "Recieve",
                            icon: Icons.takeout_dining,
                            action: () {
                              Navigator.pushNamed(context, '/receive');
                            },
                          ),
                        ],
                      )
                    ],
                  )),
              Container()
            ],
          ),
        ));
  }
}
