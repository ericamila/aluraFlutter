import 'package:alura_flutter_app_tarefas/data/task_dao.dart';
import 'package:flutter/material.dart';
import 'difficulty.dart';

const List<Color> mcores = [
  Colors.blue,
  Colors.red,
  Colors.teal,
  Colors.orange,
  Colors.yellow
];

// ignore: must_be_immutable
class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  Task(this.nome, this.foto, this.dificuldade, {super.key});

  int nivel = 0;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool assetOrNetwork() {
    if (widget.foto.contains('http')) {
      return false;
    }
    return true;
  }

  Color mudaCores() {
    var limite = widget.dificuldade * 10;
    if (widget.nivel <= limite) {
      if (widget.nivel <= 10){
        return mcores[0];
      } else if (widget.nivel <= 20) {
        return mcores[1];
      } else if (widget.nivel <= 30){
        return mcores[2];
      } else if (widget.nivel <= 40) {
        return mcores[3];
      } else if (widget.nivel <= 50) {
        return mcores[4];
      }
    } else {
      setState(() {
        widget.nivel = 0;
      });
    }
    return mcores[0];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: mudaCores(),
              //color: Colors.blue,
            ),
            height: 140,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 72,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: assetOrNetwork()
                            ? Image.asset(widget.foto, fit: BoxFit.cover)
                            : Image.network(widget.foto, fit: BoxFit.cover),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 190,
                          child: Text(
                            widget.nome,
                            style: const TextStyle(
                                fontSize: 22, overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        Difficulty(difficultyLevel: widget.dificuldade),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 8),
                      child: SizedBox(
                        height: 52,
                        width: 62,
                        child: ElevatedButton(
                          onLongPress: () {
                            TaskDao().delete(widget.nome);
                          },
                          onPressed: () {
                            setState(() {
                              widget.nivel++;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_drop_up,
                                color: Colors.white,
                              ),
                              Text(
                                'UP',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                    ),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: (widget.dificuldade > 0)
                            ? (widget.nivel / widget.dificuldade) / 10
                            : 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Nivel: ${widget.nivel}',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
