import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.cyan[100],
      content: Container(
        height: 165,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('1)To add new task use the Add Task Button.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.purple
              ),
            ),
            Text('\n2)To delete a task slide the task tile from right.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.purple
              ),
            ),
            Row(
              mainAxisAlignment:MainAxisAlignment.end ,
              children: [
                ElevatedButton(onPressed:()=>Navigator.pop(context), child:Text('Back'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple[400]
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
