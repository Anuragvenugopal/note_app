import 'package:flutter/material.dart';
import 'package:note_app/Home_page.dart';
import 'package:note_app/widget/build_text_form_widget.dart';
import 'models/note_model.dart';


class AddEditPage extends StatefulWidget {
  final int? index;
  const AddEditPage({super.key, this.index});

  @override
  State<AddEditPage> createState() => _AddEditPageState();
}

class _AddEditPageState extends State<AddEditPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      titleController.text = notes[widget.index!].title;
      descriptionController.text = notes[widget.index!].discription;
    }
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              widget.index == null ? "Add Note" : "Edit Note",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: BuildTextFormFieldWidget(
              controller: titleController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Title',
                labelStyle: TextStyle(color: Colors.white),
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: BuildTextFormFieldWidget(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                labelStyle: TextStyle(color: Colors.white),
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
          Spacer(),
          Padding(
            padding:  EdgeInsets.all(20.0),
            child: Column(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    if (widget.index == null) {
                      notes.add(NoteModel(
                        title: titleController.text,
                        discription: descriptionController.text,
                      ));
                    } else {
                      notes[widget.index!] = NoteModel(
                        title: titleController.text,
                        discription: descriptionController.text,
                      );
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => HomePage(),
                      ),
                    );
                  },
                  label: Text(widget.index == null ? 'Save' : 'Update'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
