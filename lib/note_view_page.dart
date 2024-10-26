import 'package:flutter/material.dart';
import 'Home_page.dart';
import 'add_page.dart';
import 'models/note_model.dart';
import 'package:flutter/services.dart';

class NoteViewPage extends StatefulWidget {
  final int index;
  NoteViewPage({
    super.key,
    required this.index,
  });

  @override
  State<NoteViewPage> createState() => _NoteReadPageState();
}

class _NoteReadPageState extends State<NoteViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEDEB),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              PopupMenuButton(
                onSelected: (value) {
                  // your logic
                },
                itemBuilder: (BuildContext bc) {
                  return [
                    PopupMenuItem(
                      child: Text("Edit"),
                      value: '/edite',
                      onTap: () {
                        Navigator.of(context)
                            .push(new MaterialPageRoute<NoteViewPage>(
                          builder: (BuildContext context) {
                            return AddEditPage(index: widget.index);
                          },
                        ));
                      },
                    ),
                    PopupMenuItem(
                      child: Text("Delete"),
                      value: '/delete',
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  title: Text("Alert "),
                                  content: Text("Are you sure to Delete this"),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'Cancel'),
                                      child: Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        notes.removeAt(widget.index);
                                        Navigator.of(context).push(
                                            MaterialPageRoute<NoteViewPage>(
                                          builder: (BuildContext context) {
                                            return HomePage();
                                          },
                                        ));
                                      },
                                      child: Text('ok'),
                                    ),
                                  ]);
                            });
                      },
                    ),
                  ];
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              notes[widget.index].title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              overflow: TextOverflow.visible,
              notes[widget.index].discription,
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
