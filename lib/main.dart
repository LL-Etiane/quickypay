import 'package:flutter/material.dart';
import 'package:quickypay/screens/about.dart';

import 'screens/home.dart';
import 'screens/settings.dart';
import 'screens/send.dart';
import 'screens/receive.dart';
import 'screens/scanqrcode.dart';

import 'colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: kprimaryColor,
      debugShowCheckedModeBanner: false,
      showSemanticsDebugger: false,
      title: 'QuickyPay',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/settings': (context) => SettingsScreen(),
        '/send': (context) => SendScreen(),
        '/receive': (context) => ReceiveScreen(),
        '/scanqrcode': (context) => const ScanQrCodeScreen(),
        '/about': (context) => const AboutScreen(),
      },
    );
  }
}
