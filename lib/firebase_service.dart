import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final CollectionReference todosRef = FirebaseFirestore.instance.collection('todos');

  Future<void> addTodo(String title) {
    return todosRef.add({'title': title, 'is_completed': false});
  }

  Stream<QuerySnapshot> getTodos() {
    return todosRef.snapshots();
  }

  Future<void> updateTodoStatus(String id, bool isCompleted) {
    return todosRef.doc(id).update({'is_completed': isCompleted});
  }

  Future<void> deleteTodo(String id) {
    return todosRef.doc(id).delete();
  }
}
