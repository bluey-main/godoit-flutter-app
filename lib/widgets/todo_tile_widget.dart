import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../controller/godoit_controller.dart';
import 'package:get/get.dart';

class TodoTile extends StatelessWidget {
  TodoTile({Key? key}) : super(key: key);

  final gdController = Get.put(GodoitController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: gdController.tasks.length,
        itemBuilder: (context, index) {
          return Obx(
            () => Slidable(
              endActionPane: ActionPane(motion: StretchMotion(), children: [
                SlidableAction(
                  onPressed: (context) => gdController.deleteTask(index),
                  icon: Icons.delete,
                  backgroundColor: Colors.red,
                )
              ]),
              child: ListTile(
                leading: Checkbox(
                  value: gdController.tasks[index].isCompleted.value,
                  onChanged: (bool? value) {
                    gdController.handelClick(index);
                  },
                ),
                title: Text(
                  gdController.tasks[index].task,
                  style: TextStyle(
                    decoration: gdController.tasks[index].isCompleted.value
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                // trailing: GestureDetector(
                //   child: Icon(Icons.delete),
                //   onTap: () {
                //     gdController.deleteTask(index);
                //   },
                // ),
              ),
            ),
          );
        },
      ),
    );
  }
}
