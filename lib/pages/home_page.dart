import 'package:flutter/material.dart';

import '../componentes/tasks.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tarefas',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        leading: Container(),
      ),
      body: AnimatedOpacity(
        opacity: (opacidade) ? 1:0,
        duration: const Duration(milliseconds: 1000),
        child: ListView(
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Tasks('Aprender Flutter', 'images/1.png', 3),
            ),
            Tasks('Andar de Bike', 'images/2.jpeg', 2),
            Tasks('Meditar', 'images/3.jpg', 5),
            Tasks('Ler', 'images/4.jpeg', 4),
            Tasks('Jogar', 'images/5.jpg', 1),
            SizedBox(height: 80,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),),
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        child: const Icon(Icons.remove_red_eye, color: Colors.white,),
      ),
    );
  }
}
