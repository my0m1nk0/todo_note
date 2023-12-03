import 'package:flutter/material.dart';

import '../config/todo_list.dart';
import '../data/todo_model.dart';
import '../widgets/task_card.dart';

class TasksPage extends StatelessWidget {
  TasksPage({
    super.key,
    required this.todoList,
    required this.onTodoDone,
    required this.editTodo,
    required this.deleteTodo,
  });
  final List<TodoModel> todoList;
  final Function(TodoModel) onTodoDone;
  final Function(TodoModel) editTodo;
  final Function(TodoModel) deleteTodo;
  @override
  Widget build(BuildContext context) {
    /// if [TodoList.todos] list is empty, show a text
    if (TodoList.todos.isEmpty) {
      return const Scaffold(
        body: Center(
          child: Text('Create a Todo Task 📃!'),
        ),
      );
    }
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(6),
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
            todoList.length,
            (index) {
              return GestureDetector(
                onLongPress: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Delete Task'),
                      content: const Text(
                          'Are you sure you want to delete this task?'),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text('Delete'),
                          onPressed: () {
                            deleteTodo(todoList[index]);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  );
                },
                child: TaskCard(
                  todo: todoList[index],
                  onDone: () => onTodoDone(todoList[index]),
                  editTodo: editTodo,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
