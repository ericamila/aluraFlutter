import 'package:alura_flutter_app_tarefas/componentes/task.dart';
import 'package:alura_flutter_app_tarefas/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao{

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_name TEXT, '
      '$_difficult INTEGER, '
      '$_image TEXT )';

  static const String _tableName = 'taskTable2';
  static const String _name = 'name';
  static const String _difficult = 'difficulty';
  static const String _image = 'image';

  save(Task tarefa) async{
    print('Acessando o save');

    final Database db = await getDatabase();
    var itemExists = await find(tarefa.nome);
    Map<String,dynamic> taskMap = toMap(tarefa);
    if(itemExists.isEmpty){
      print('a tarefa não existia');
      return await db.insert(
          _tableName,
          taskMap);
    }else{
      print('a tarefa já existe');
      return await db.update(
          _tableName,
          taskMap,
          where: '$_name = ?',
          whereArgs: [tarefa.nome]);
    }
  }

  Map<String,dynamic> toMap(Task tarefa) {
    print('convertendo tarefa em map');

    Map<String, dynamic?> mapaDeTarefas = Map();
    mapaDeTarefas[_name] = tarefa.nome;
    mapaDeTarefas[_image] = tarefa.foto;
    mapaDeTarefas[_difficult] = tarefa.dificuldade;

    print('mapa de tarefas: $mapaDeTarefas');
    return mapaDeTarefas;
  }

  Future<List<Task>> findAll() async{
    print('Acessando o findAll');

    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    print('Procurando dados... encontrado $result');
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas){
    print('Convertendo to List: ');

    final List<Task> tarefas = [];
    for(Map<String, dynamic> linha in mapaDeTarefas){
      final Task tarefa = Task(linha[_name], linha[_image], linha[_difficult]);
      tarefas.add(tarefa);
    }
    print('Lista de Tarefas: $tarefas');
    return tarefas;
  }

  Future<List<Task>> find(String nomeDaTarefa) async{
    print('Acessando o find');

    final Database db = await getDatabase();
    final List<Map<String, dynamic?>> result = await db.query(
      _tableName,
      where: '$_name = ?',
      whereArgs: [nomeDaTarefa]
    );

    print('Tarefa encontrada ${toList(result)}');
    return toList(result);
  }

  delete(String nomeDaTarefa) async{
    print('Deletando tarefa: $nomeDaTarefa');

    final Database db = await getDatabase();
    return db.delete(_tableName, where: '$_name = ?',whereArgs: [nomeDaTarefa]);
  }

}