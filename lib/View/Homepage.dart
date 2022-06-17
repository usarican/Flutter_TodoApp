import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit/Cubit/TodoCubit.dart';
import 'package:todo_app_cubit/Model/TodoItem.dart';
import 'package:todo_app_cubit/View/Registerpage.dart';
import 'package:todo_app_cubit/View/Updatepage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();
    context.read<TodoCubit>().getAllItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MY TODO LIST",
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF006978),
      ),
      body: BlocBuilder<TodoCubit, List<TodoItem>>(
        builder: (context, itemsList) {
          if (itemsList.isNotEmpty) {
            return ListView.builder(
              itemCount: itemsList.length,
              itemBuilder: (context, indeks) {
                var item = itemsList[indeks];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Text(
                            "${item.todo_id} -",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Text("${item.todo_work}",
                            style: TextStyle(fontSize: 20)),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UpdatePage(todoItem: item)))
                                  .then((_) {
                                context.read<TodoCubit>().getAllItems();
                              });
                            },
                            icon: const Icon(
                              Icons.update_outlined,
                              color: Colors.blue,
                            )),
                        IconButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("${item.todo_work} silinsin mi?"),
                              action: SnackBarAction(
                                label: "Evet",
                                onPressed: () {
                                  context
                                      .read<TodoCubit>()
                                      .deleteItem(item.todo_id);
                                },
                              ),
                            ));
                          },
                          icon: const Icon(
                            Icons.cancel_outlined,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center();
          }
        },
      ),
      floatingActionButton: SizedBox(
        width: 80,
        height: 80,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterPage()))
                .then((_) {
              context.read<TodoCubit>().getAllItems();
            });
          },
          backgroundColor: const Color(0xFF56c7d6),
          child: const Icon(
            Icons.add_task_outlined,
            size: 40,
          ),
        ),
      ),
    );
  }
}
