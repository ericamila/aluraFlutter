import 'package:alura_flutter_app_tarefas/componentes/task.dart';
import 'package:flutter/material.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<Task> taskList = [
    Task('Aprender Flutter', 'images/1.png', 3),
    Task('Andar de Bike', 'images/2.jpeg', 2),
    Task('Meditar', 'images/3.jpg', 5),
    Task('Ler', 'images/4.jpeg', 4),
    Task('Jogar', 'images/5.jpg', 1),
  ];

  void newTask(String name, String photo, int difficult){
    taskList.add(Task(name, photo, difficult));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget ) {
    return oldWidget.taskList.length != taskList.length;
  }
}
