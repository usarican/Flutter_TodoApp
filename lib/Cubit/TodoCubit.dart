import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit/Model/TodoItem.dart';
import 'package:todo_app_cubit/Repository/TodoItems_dao.dart';

class TodoCubit extends Cubit<List<TodoItem>> {
  TodoCubit() : super(<TodoItem>[]);

  var itemRepository = TodoItemsRepository();

  Future<void> getAllItems() async {
    var allItems = await itemRepository.getAllItems();
    emit(allItems);
  }

  Future<void> updateItem(int todo_id, String new_Todo_work) async {
    await itemRepository.updateItem(todo_id, new_Todo_work);
  }

  Future<void> deleteItem(int todo_id) async {
    await itemRepository.deleteItem(todo_id);
    var allItems = await itemRepository.getAllItems();
    emit(allItems);

  }
  Future<void> addItem(String todo_work) async {
    await itemRepository.addItem(todo_work);
    var allItems = await itemRepository.getAllItems();
    emit(allItems);

  }
}
