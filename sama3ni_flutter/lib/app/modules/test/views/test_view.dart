import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/test_controller.dart';

class TestView extends GetView<TestController> {
  const TestView({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child:
                            TextField(controller: controller.textController)),
                    IconButton(
                        onPressed: controller.pickFile,
                        icon: const Icon(Icons.add)),
                  ],
                ),
                const SizedBox(height: 20),
                GetBuilder<TestController>(
                    id: "file",
                    builder: (_) {
                      return Column(
                        children: controller.platformFile == null
                            ? []
                            : List.generate([controller.platformFile].length,
                                (i) {
                                return Text([controller.platformFile][i]!.name);
                              }),
                      );
                    }),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: controller.createTask,
                  child: const Text('Create Task'),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                      itemCount: controller.tasks.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(controller.tasks[index].name),
                          subtitle: Text(controller.tasks[index].photo),
                        );
                      }),
                )
              ],
            ),
          );
        }
}
