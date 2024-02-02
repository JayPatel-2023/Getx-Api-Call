import 'dart:convert';

import 'package:api_call/models/user_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiController extends GetxController {
  final String baseUrl = "https://api.github.com/users";

  RxList<UserModel> usersList = RxList<UserModel>();
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    // executes when app start or restart
    super.onInit();
    getApi();
  }

  void getApi() async {
    isLoading.value = true;
    var response = await http.get(Uri.parse(baseUrl));
    // print(response.body);
    // print(response.statusCode);

    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (var user in data) {
        usersList.add(UserModel.fromJson(user));
      }
      //print(usersList);
      isLoading.value = false;
    } else {
      print("❌ Somthing went wrong.");
      isLoading.value = false;
    }
  }
}
