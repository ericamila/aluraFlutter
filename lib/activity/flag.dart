import 'package:flutter/material.dart';

class Flag extends StatelessWidget {
  final Color cor1;
  final Color cor2;
  final Color cor3;
  final double altura;
  final double largura;
  final IconData icone;

  const Flag(
      {super.key,
        required this.cor1,
        required this.cor2,
        required this.cor3,
        required this.altura,
        required this.largura,
        required this.icone});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: altura,
          width: largura,
          decoration: BoxDecoration(
              color: cor1,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 2)),
        ),
        Container(
          height: altura,
          width: largura,
          decoration: BoxDecoration(
            color: cor2,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: Icon(
            icone,
          ),
        ),
        Container(
          height: altura,
          width: largura,
          decoration: BoxDecoration(
              color: cor3,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 2)),
        ),
      ],
    );
  }
}
