import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/screens/sign_in_screen.dart';
import 'package:todo_app/utils/authentication.dart';
import 'package:todo_app/utils/font_style.dart';

final List<String?> entries = <String>[
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
];
List todos = [
  "Ayam",
  "Kuda",
  "Kucing",
  "Kura",
];
String input = "";

class Task extends StatefulWidget {
  Task({Key? key}) : super(key: key);

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyText2!,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(16),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      DateFormat("EEE, MMM dd yyyy").format(DateTime.now()),
                      style: tanggal,
                    ),
                  ),
                  Container(
                      alignment: Alignment.center,
                      height: 120,
                      color: Colors.red,
                      child: ListView.builder(
                          itemCount: entries.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Card(
                                  child: ListTile(
                                title: Text(
                                  entries.toString(),
                                  style: TextStyle(),
                                ),
                              )))),
                  Container(
                    margin: EdgeInsets.all(16),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Todo List",
                      style: tanggal,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(16),
                    height: 280,
                    alignment: Alignment.center,
                    child: ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                            key: Key(todos[index]),
                            child: Card(
                              elevation: 4,
                              child: ListTile(
                                title: Text(todos[index]),
                                trailing: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        todos.removeAt(index);
                                      });
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    )),
                              ),
                            ));
                      },
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                title: Text("Add ToDo List"),
                                content: TextField(
                                  onChanged: (String value) {
                                    input = value;
                                  },
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        todos.add(input);
                                      });
                                    },
                                    child: Text("Add"),
                                  )
                                ]);
                          });
                    },
                    child: Icon(Icons.add, color: Colors.blue),
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
            ),
          );
        },
      ),
    );
   
  }
}

