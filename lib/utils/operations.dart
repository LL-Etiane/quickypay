import 'package:shared_preferences/shared_preferences.dart';

class QuickyPay {
  String name = "";
  String number = "";

  Future<Map<String,String>> userInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.reload();
    name = prefs.getString('name') ?? "";
    number = prefs.getString('number') ?? "";
    return {"name": name, "number": number};
  }

  static Future<void> setInfo(String sname, String snumber) async {
    SharedPreferences sprefs = await SharedPreferences.getInstance();
    await sprefs.setString("name", sname);
    await sprefs.setString("number", snumber);
  }

  bool infoExist() {
    if (name.isEmpty || number.isEmpty) {
      return true;
    } else {
      return true;
    }
  }
}
