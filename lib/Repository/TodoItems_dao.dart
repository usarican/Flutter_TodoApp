import 'package:todo_app_cubit/Model/TodoItem.dart';
import 'package:todo_app_cubit/Sqlite/DatabaseHelper.dart';

class TodoItemsRepository {

  Future<void> addItem(String todo_work) async {
    var db = await DatabaseHelper.connectionDatabase();
    var newItemInformations = Map<String,dynamic>();
    newItemInformations["todo_work"] = todo_work;
    await db.insert("TodoList", newItemInformations);

  }

  Future<void> updateItem(int todo_id,String todo_work) async{
    var db = await DatabaseHelper.connectionDatabase();
    var updateItemInformations = Map<String,dynamic>();
    updateItemInformations["todo_work"] = todo_work;
    db.update("TodoList", updateItemInformations,where: "todo_id = ?",whereArgs: [todo_id]);
  }

  Future<List<TodoItem>> getAllItems() async {
    var db = await DatabaseHelper.connectionDatabase();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM TodoList ");
    return List.generate(maps.length, (i) {
      var row = maps[i];
      return TodoItem(todo_id: row["todo_id"], todo_work: row["todo_work"]);
    });

  }


  Future<void> deleteItem(int todo_id) async {
    var db = await DatabaseHelper.connectionDatabase();
    db.delete("TodoList",where: "todo_id = ?",whereArgs: [todo_id]);
  }
}