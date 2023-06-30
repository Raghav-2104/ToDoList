import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({super.key, required this.controller,required this.onSave,required this.onCancel});


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.cyan[100],
      title: const Text('Add New Task'),
      content: Container(
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              maxLines: 1,
              maxLength: 20,
              controller: controller,
              decoration: InputDecoration(
                
                labelText: 'Task',
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(style: BorderStyle.solid),
                ),
                // errorText: ('Enter a Task')
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                      onSave();
                      Navigator.pop(context);
                    },
                    child: const Text('Save'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple[500],
                      foregroundColor: Colors.white
                    ),
                    ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      onCancel();
                    },
                    child: const Text('Cancel'),
                      style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple[500],
                      foregroundColor: Colors.white
                    ),
                    ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
