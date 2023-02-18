// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ExpenseTile extends StatelessWidget {
  final String name;
  final String amount;
  final DateTime dateTime;
  void Function(BuildContext)? deleteTapped;

  ExpenseTile(
      {required this.name,
      required this.amount,
      required this.dateTime,
      required this.deleteTapped});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: StretchMotion(),
        children: [
          SlidableAction(
            onPressed: deleteTapped,
            icon: Icons.remove_circle_outline,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(10),
          )
        ],
      ),
      child: ListTile(
        title: Text(
          name,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          dateTime.day.toString() +
              ' / ' +
              dateTime.month.toString() +
              ' / ' +
              dateTime.year.toString(),
        ),
        trailing: Text(
          '₹ $amount',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
