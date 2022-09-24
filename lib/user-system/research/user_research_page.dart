import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserResearchPage extends StatelessWidget {
  const UserResearchPage({Key? key}) : super(key: key);

  static const route = '/user-research';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(),
    );
  }
}
