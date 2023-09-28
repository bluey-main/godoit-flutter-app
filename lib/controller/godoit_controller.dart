import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/godoit_model.dart';

class GodoitController extends GetxController {
  static GodoitController get find => Get.find();
  List<GodoitModel> tasks = [
    GodoitModel(isCompleted: false.obs, task: "task 1"),
    GodoitModel(isCompleted: false.obs, task: "task 2"),
    GodoitModel(isCompleted: false.obs, task: "task 3"),
  ].obs;
  RxString text = "".obs;
  final textController = TextEditingController().obs;
  final validateForm = GlobalKey<FormState>().obs;
  void handelClick(int index) {
    tasks[index].isCompleted.value = !tasks[index].isCompleted.value;
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
  }

  void updateText(value) {
    text.value = value;
  }

  void clearTextField() {
    textController.value.clear();
  }

  // void validation() {
  //   if (validateForm.currentState!.validate()) {
  //     tasks.add(GodoitModel(isCompleted: false.obs, task: textController.text));
  //   }
  // }
}
