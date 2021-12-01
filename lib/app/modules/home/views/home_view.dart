import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List User'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: controller.userData.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 2,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ID : ${controller.userData[index].id}'),
                          Text('Name : ${controller.userData[index].firstName} ${controller.userData[index].lastName}'),
                          Text('Email : ${controller.userData[index].email}'),
                        ],
                      ),
                      CircleAvatar(
                        radius: 32,
                        backgroundColor: Colors.grey,
                        foregroundImage: NetworkImage('${controller.userData[index].avatar}'),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
