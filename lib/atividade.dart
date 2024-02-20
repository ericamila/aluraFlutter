import 'package:flutter/material.dart';

import 'Task.dart';

class Atividade extends StatefulWidget {
  const Atividade({super.key});

  @override
  State<Atividade> createState() => _AtividadeState();
}

class _AtividadeState extends State<Atividade> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text("Tarefas", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,//Theme.of(context).colorScheme.primary,
      ),
      body: ListView(
        children: const [
          Task('Aprender Flutter Aprender Flutter Aprender Flutter Aprender Flutter Aprender Flutter Aprender Flutter'),
          Task('Andar de Bike'),
          Task('Meditar'),
          Task('Meditar'),
          Task('Meditar'),
          Task('Meditar'),
          Task('Meditar'),
          Task('Meditar'),
          Task('Meditar'),
          Task('Meditar'),
          Task('Meditar'),
          Task('Meditar'),
        ],
      ),
    );
  }
}
