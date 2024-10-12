import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Simple Firebase Todo App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
        backgroundColor: Colors.blue,
      ),
      body: const TodoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTodoDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseService().getTodos(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return const CircularProgressIndicator();

        return ListView(
          children: snapshot.data!.docs.map((doc) {
            bool isCompleted = doc['is_completed'];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: Dismissible(
                key: Key(doc.id),
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (direction) {
                  FirebaseService().deleteTodo(doc.id);
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Todo deleted")));
                },
                child: ListTile(
                  leading: Checkbox(
                    value: isCompleted,
                    onChanged: (value) {
                      FirebaseService().updateTodoStatus(doc.id, value!);
                    },
                  ),
                  title: Text(
                    doc['title'],
                    style: TextStyle(
                      decoration: isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

void _addTodoDialog(BuildContext context) {
  TextEditingController controller = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Add Todo"),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: "Enter your todo"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              FirebaseService().addTodo(controller.text);
              Navigator.of(context).pop();
            },
            child: const Text("Add"),
          ),
        ],
      );
    },
  );
}
