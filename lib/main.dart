import 'package:flutter/material.dart';

void main() => runApp(const TodoApp());

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'TODO LIST',
      home: SafeArea(
        child: TodoList()),
    );
  }
}

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  createState() => TodoListState();

}
class TodoListState extends State<TodoList> {
  final List<String> _todoItems = [];
  // ignore: unused_element
  void  _addTodoItem() {
    setState(() {
      int index = _todoItems.length;
      _todoItems.add('Item $index');
    });
  }

   // Build the whole list of todo items
  Widget _buildTodoList() {
    return ListView.builder(
      itemBuilder: (context, index) {
        // itemBuilder will be automatically be called as many times as it takes for the
        // list to fill up its available space, which is most likely more than the
        // number of todo items we have. So, we need to check the index is OK.
        if(index < _todoItems.length) {
          return _buildTodoItem(_todoItems[index]);
        }
        return null;
      },
    );
  }

  Widget _buildTodoItem(String todoText) {
    return ListTile(
      title: Text(todoText),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('Todo List'),
          ),
          body: _buildTodoList(),
          floatingActionButton: FloatingActionButton(onPressed: _addTodoItem,
          tooltip: 'Add task',
          child: const Icon(Icons.add)),
        ),
      ],
    );
  }
}