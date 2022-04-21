import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jobseekingapp/model/signup_model.dart';

class ApiService {
  Future signupService(String url, Map<String, dynamic> userdata) async {
    try {
      // print(userdata);

      var response = await http
          .post(Uri.parse(url), body: json.encode(userdata), headers: {
        "Content-Type": "application/json",
      });

      if (response.statusCode == 200) {
        print(response.body);
        // return response.body;
        //return Signupmodel.fromMap(jsonDecode(response.body));
        var currentuser= Usermodel.fromjson(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
    }
  }

//signin
  Future signinService(String url, Map<String, dynamic> userdata) async {
    try {
      var response = await http
          .post(Uri.parse(url), body: json.encode(userdata), headers: {
        "Content-Type": "application/json",
      });

      if (response.statusCode == 200) {
        print(response.body);
        return response.body;
        //  return Signinmodel.fromMap(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
    }
  }
}
