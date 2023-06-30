import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class CardsWidget extends StatelessWidget {
  String title;
  bool checked;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;
  CardsWidget({required this.title,required this.checked,required this.onChanged,required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25,right: 25,top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(onPressed: (deleteTask),
              icon: (Icons.delete),
              foregroundColor: Colors.black,
              borderRadius: BorderRadius.circular(15),
              backgroundColor: Colors.red,
            ),
          ],
        ),
        child: Container(
          
          height: 80,
          child: Row(
            children: [
              Checkbox(
                  value: checked,
                  onChanged: onChanged,
                  activeColor: Colors.black,
                  checkColor: Colors.white,
                  
                ),
              Text(
                title,
                style:  TextStyle(
                    fontSize: 20,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w600,
                    decoration: checked==false?TextDecoration.none:TextDecoration.lineThrough,
                    ),
              ),
              
            ],
          ),
          decoration: BoxDecoration(
            border: Border.all(width: 1.0),
            borderRadius: BorderRadius.circular(15),
            color: Colors.yellow[200],
          ),
        ),
      ),
    );
  }
}
