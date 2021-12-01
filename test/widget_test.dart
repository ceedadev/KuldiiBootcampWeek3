import 'dart:convert';
import 'package:bootcamp_week3/models/user.dart';
import 'package:http/http.dart' as http;

void main() async {
  await getSingleUser(2);
}

Future getSingleUser(int id) async {
  Uri url = Uri.parse('https://reqres.in/api/users/${id}');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    //ada data
    Map<String, dynamic> responseBody = json.decode(response.body);
    var data = User.fromJson(responseBody['data']);
    print(data.firstName);
    print(data.email);
    print(data.avatar);
  } else {
    print('No Data');
  }
}
