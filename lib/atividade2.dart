import 'package:flutter/material.dart';

class Atividade2 extends StatefulWidget {
  const Atividade2({super.key});

  @override
  State<Atividade2> createState() => _Atividade2State();
}

class _Atividade2State extends State<Atividade2> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Flag(
              Colors.white, Colors.pinkAccent, Colors.lightBlueAccent, 100),
        ),
        Flag(Colors.pink, Colors.purple, Colors.blueAccent, 100),
        Flag(Colors.pinkAccent, Colors.amber, Colors.lightBlue, 100),
        Flag(Colors.purpleAccent, Colors.white, Colors.green, 100),
        SizedBox(
          height: 100,
        ),
      ],
    );
  }
}

class Flag extends StatelessWidget {
  final Color cor1;
  final Color cor2;
  final Color cor3;
  final double largura;

  const Flag(this.cor1, this.cor2, this.cor3, this.largura, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 140,
        child: Row(
          children: [
            Container(
              height: 140,
              width: largura,
              color: cor1,
            ),
            Container(
              height: 140,
              width: largura,
              color: cor2,
            ),
            Container(
              height: 140,
              width: largura,
              color: cor3,
            ),
          ],
        ),
      ),
    );
  }
}
