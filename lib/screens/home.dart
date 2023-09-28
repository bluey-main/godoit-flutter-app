import 'package:flutter/material.dart';
import 'package:godoit/model/godoit_model.dart';
import '../widgets/todo_tile_widget.dart';
import '../constants/colors.dart';
import '../controller/godoit_controller.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final gdController = Get.put(GodoitController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GoDoIt"),
        backgroundColor: const Color(0xFFE36255),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Task"),
                actions: [
                  Column(
                    children: [
                      Obx(
                         
                        () => Form(
                         
                          key: gdController.validateForm.value,
                          child: TextFormField(
                            onChanged: (value) {
                              gdController.updateText(value);
                            },
                            controller: gdController.textController.value,
                            decoration: const InputDecoration(
                                label: Text("Task To Do"),
                                border: OutlineInputBorder()),
                          ),
                        ),
                      ),
                      Obx(() => Text("The text is ${gdController.text.value}")),
                      ElevatedButton(
                          onPressed: addTodo,
                          child: const Text("Submit"))
                    ],
                  )
                ],
              );
            },
          );
        },
        backgroundColor: mySecondaryColor,
        child: const Icon(Icons.add),
      ),
      body: TodoTile(),
    );
  }

  void addTodo() {
                if (gdController.validateForm.value.currentState!
                    .validate()) {
                  gdController.tasks.add(GodoitModel(
                      isCompleted: false.obs,
                      task:
                          gdController.textController.value.text));
                }
                gdController.clearTextField();
              }
}
