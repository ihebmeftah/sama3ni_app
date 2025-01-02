import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sama3ni_flutter/app/components/appinput.dart';
import 'package:sama3ni_flutter/app/modules/authentification/controllers/verifcation_controller.dart';

class VerifcationView extends GetView<VerifcationController> {
  const VerifcationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: GetPlatform.isWeb
                    ? MediaQuery.sizeOf(context).width * 0.25
                    : MediaQuery.sizeOf(context).width * 0.1),
            child: Form(
              key: controller.validationformKey,
              child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppInput(
                    name: "Validation Code",
                    hint: "Enter your validation code",
                    isRequired: true,
                    ctr: controller.validationCode,
                  ),
                  ElevatedButton(
                      onPressed: controller.onVerifi,
                      child: const Text("Send Verifcation Code")),
                ],
              ),
            ),
          ),
        ));
  }
}
