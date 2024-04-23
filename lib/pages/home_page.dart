import 'package:alura_flutter_app_tarefas/componentes/task.dart';
import 'package:alura_flutter_app_tarefas/data/task_dao.dart';
import 'package:alura_flutter_app_tarefas/pages/form_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        leading: const Icon(Icons.task_alt),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 70),
        child: FutureBuilder<List<Task>>(
            //começa aqui
            future: TaskDao().findAll(),
            builder: (context, snapshot) {
              List<Task>? items = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text('Carregando')
                      ],
                    ),
                  );
                  break;
                case ConnectionState.waiting:
                  return const Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text('Carregando')
                      ],
                    ),
                  );
                  break;
                case ConnectionState.active:
                  return const Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text('Carregando')
                      ],
                    ),
                  );
                  break;
                case ConnectionState.done:
                  if (snapshot.hasData && items != null) {
                    if (items.isNotEmpty) {
                      return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, index) {
                            final Task tarefa = items[index];
                            return tarefa;
                          });
                    }
                    return const Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.error_outline, size: 72),
                          Text('Não existem tarefas!',
                              style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    );
                  }
                  return const Text('Erro ao carregar tarefas!');
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (contextNew) => FormScreen(
                        taskContext: context,
                      ))).then((value) => setState(() {
                print('Recarregando a tela inicial');
              }));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
