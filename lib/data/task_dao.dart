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

    final Database db = await getDatabase();
    var itemExists = await find(tarefa.nome);
    Map<String,dynamic> taskMap = toMap(tarefa);
    if(itemExists.isEmpty){
      return await db.insert(
          _tableName,
          taskMap);
    }else{
      return await db.update(
          _tableName,
          taskMap,
          where: '$_name = ?',
          whereArgs: [tarefa.nome]);
    }
  }

  Map<String,dynamic> toMap(Task tarefa) {

    Map<String, dynamic> mapaDeTarefas = {};
    mapaDeTarefas[_name] = tarefa.nome;
    mapaDeTarefas[_image] = tarefa.foto;
    mapaDeTarefas[_difficult] = tarefa.dificuldade;

    return mapaDeTarefas;
  }

  Future<List<Task>> findAll() async{

    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas){

    final List<Task> tarefas = [];
    for(Map<String, dynamic> linha in mapaDeTarefas){
      final Task tarefa = Task(linha[_name], linha[_image], linha[_difficult]);
      tarefas.add(tarefa);
    }
    return tarefas;
  }

  Future<List<Task>> find(String nomeDaTarefa) async{

    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      _tableName,
      where: '$_name = ?',
      whereArgs: [nomeDaTarefa]
    );

    return toList(result);
  }

  delete(String nomeDaTarefa) async{

    final Database db = await getDatabase();
    return db.delete(_tableName, where: '$_name = ?',whereArgs: [nomeDaTarefa]);
  }

}