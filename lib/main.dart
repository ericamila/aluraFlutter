import 'package:alura_flutter_app_tarefas/componentes/theme.dart';
import 'package:alura_flutter_app_tarefas/data/task_inherited.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atividades',
      theme: tema,
      home: TaskInherited(child: const Home()),
    );
  }
}
