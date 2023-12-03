import 'package:flutter/material.dart';
import 'package:todo_app/data/todo_model.dart';

class EditPage extends StatefulWidget {
  final TodoModel todo;
  const EditPage({Key? key, required this.todo}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _titleController = TextEditingController(text: widget.todo.title);
    final _descriptionController =
        TextEditingController(text: widget.todo.description);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Task',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  prefix: Icon(Icons.title),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  prefix: Icon(Icons.description),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              // Add more fields for date and time
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // Update the other fields of the TodoModel
            widget.todo.title = _titleController.text;
            widget.todo.description = _descriptionController.text;
            // Then, navigate back to the previous page
            Navigator.pop(context, widget.todo);
          }
        },
        icon: const Icon(Icons.save_alt),
        label: const Text("Save"),
      ),
    );
  }
}
