import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit/Cubit/TodoCubit.dart';
import 'package:todo_app_cubit/Model/TodoItem.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var tfTodoWork = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ADDING NEW TO-DO ITEM",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF006978),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 350,
              height: 150,
              child: TextField(
                style: TextStyle(color: Colors.white, fontSize: 20),
                controller: tfTodoWork,
                decoration: InputDecoration(
                  hintText: "Write your today's work",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fillColor: const Color(0xFF56c7d6),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            SizedBox(
              width: 175,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  context.read<TodoCubit>().addItem(tfTodoWork.text);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(color: Color(0xFF006978),width: 2.5)
                      ),
                  ),
                ),
                child: const Text(
                  "ADD",
                  style: TextStyle(color: Color(0xFF006978), fontSize: 40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
