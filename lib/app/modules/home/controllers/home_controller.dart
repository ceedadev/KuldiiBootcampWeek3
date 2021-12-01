import 'dart:convert';
import 'package:bootcamp_week3/models/user.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  // sudah mantap ini logicnya..
  // sebetulnya lebih baik, loading itu jangan dipasang seperti ini
  // kita bisa manfaatin future builder -> connection state = waiting buat render loading
  // jadi gak perlu di pasang di oninit
  late List<User> userData = [];
  // var isLoading = true.obs;

  // @override
  // void onInit() async {
  //   await getUsers();
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {}

  Future getUsers() async {
    Uri url = Uri.parse('https://reqres.in/api/users?page=1');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      print('Found data');
      // isLoading(false);

      var responseBody = json.decode(response.body);
      List data = responseBody['data'];
      userData = data.map((data) => User.fromJson(data)).toList();
    } else {
      print('No Data');
      // isLoading(false);
    }
  }
}
