import 'package:flutter/material.dart';

import 'flag.dart';

class Atividade extends StatefulWidget {
  const Atividade({super.key});

  @override
  State<Atividade> createState() => _AtividadeState();
}

class _AtividadeState extends State<Atividade> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text(
          'Flutter: Primeiros Passos',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: const Column(
        children: [
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Flag(cor1: Colors.white, cor2: Colors.pinkAccent, cor3: Colors.lightBlueAccent, altura: 140, largura: 100, icone:Icons.people)
          ),
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Flag(cor1: Colors.pink, cor2: Colors.purple, cor3: Colors.blueAccent, altura: 140, largura: 100, icone:Icons.people)
          ),
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Flag(cor1: Colors.pinkAccent, cor2: Colors.amber, cor3: Colors.lightBlue, altura: 140, largura: 100, icone:Icons.people)
          ),
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Flag(cor1: Colors.purpleAccent, cor2: Colors.white, cor3: Colors.green, altura: 140, largura: 100, icone:Icons.people)
          ),
        ],
      ),
    );
  }
}