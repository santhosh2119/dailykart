import 'package:daily_kart/base/apis.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  late String _userId;

  bool get isAuth {
    return token != null;
  }

  String? get token {
    return _userId;
  }

  Future mobileRegistrationOTP(String mobileNumber) async {
    final url = Uri.parse((Api.registerWithOut));
    try {
      final response = await http.post(url, body: {
        'mobile': mobileNumber,
      });
      var _userDetails = json.decode(response.body);

      if (response.statusCode < 400) {
        return [true, _userDetails];
      } else {
        return [false, _userDetails];
      }
    } catch (error) {
      if (error.toString().contains("SocketException")) {
        throw "Could not Verify OTP. Check your internet connection";
      } else {
        rethrow;
      }
    }
  }

  Future loginIn(String phone, String password) async {
    final url = Uri.parse(Api.login);
    try {
      final response = await http.post(url, body: {
        "mobile": phone,
        "password": password,
      });
      final data = json.decode(response.body);
      if (response.statusCode < 400) {
        if (data["status"]) {
          _userId = data["userid"];
          return [true, data];
        } else {
          return [false, data];
        }
      } else {
        return [false, data];
      }
    } catch (error) {
      if (error.toString().contains("SocketException")) {
        throw "Could not Verify OTP. Check your internet connection";
      } else {
        rethrow;
      }
    }
  }

  Future verifyOtp(String mobileNumber, String otp) async {
    try {
      var url = Uri.parse(Api.checkOTP);
      final response =
          await http.post(url, body: {"mobile": mobileNumber, "otp": otp});
      var _userDetails = json.decode(response.body);
      if (response.statusCode < 400) {
        return [true, _userDetails];
      } else {
        return [false, _userDetails];
      }
    } catch (error) {
      rethrow;
    }
  }

  Future userData(name, email, areaid, locality, address, gps, userid, password,
      referid, houseNo, landmark) async {
    final url = Uri.parse((Api.profileUpdate));
    try {
      final response = await http.post(url, body: {
        "name": name,
        "alt_number": "",
        "email": email,
        "city": "0",
        "area": areaid,
        "locality": locality,
        "address": address,
        "gps_loc": gps,
        "userid": userid,
        "password": password,
        "refid": referid,
        "house_no": houseNo,
        "landmark": landmark,
        "areanotlisted": "",
        "latlong": "",
        "firebaseToken": "test",
      });
      var _userDetails = json.decode(response.body);
      if (response.statusCode < 400) {
        _userId = userid;
        return [true, _userDetails];
      } else {
        return [false, _userDetails];
      }
    } catch (error) {
      // print(error);
    }
  }
}
