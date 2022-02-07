import 'package:flutter/material.dart';
import 'package:quickypay/colors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About developer"),
        centerTitle: true,
        backgroundColor: Colors.white24,
        foregroundColor: kprimaryColor,
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 40),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(  
          color: kprimaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: const Text( 
          """This is an app developed by etiane to help in easily sending and receiving money through mtn cameroon. 
          I am a programmer with knowledge in frontend, backend and apps you can contact me for any of your works.""",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16
          ),
        ),
      ),
    );
  }
}