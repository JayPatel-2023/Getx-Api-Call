import 'package:api_call/controllers/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ApiController controller = Get.put(ApiController());

    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: controller.getApi,
              child: const Text("Get Data"),
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => controller.isLoading.value
                ? const SizedBox(
                    height: 100,
                    width: 100,
                    child: Center(child: CircularProgressIndicator()),
                  )
                : Column(
                    children: controller.usersList
                        .map(
                          (e) => Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.network(e.avatarUrl.toString(),
                                      width: 50),
                                ),
                                const SizedBox(width: 20),
                                Text(
                                  e.login.toString(),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
          ),
        ],
      ),
    );
  }
}
