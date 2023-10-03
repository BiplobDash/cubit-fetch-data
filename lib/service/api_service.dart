import 'dart:convert';

import '../model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Users>> getData() async {
    List<Users> userData = [];
    try {
      var request = http.Request(
          'GET', Uri.parse('https://jsonplaceholder.typicode.com/users'));
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var rawData = response.stream.bytesToString();
        List<dynamic> data = jsonDecode(rawData.toString());
        data.forEach((element) {
          Users users = Users.fromJson(element);
          userData.add(users);
        });
        return userData;
      } else {
        return [];
      }
      // var response = await http
      //     .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      // if (response.statusCode == 200) {
      //   List<dynamic> data = jsonDecode(response.body);
      //   for (var element in data) {
      //     Users users = Users.fromJson(element);
      //     userData.add(users);
      //   }
      //   return userData;
      // } else {
      //   return [];
      // }
    } catch (e) {
      throw e.toString();
    }
  }
}
