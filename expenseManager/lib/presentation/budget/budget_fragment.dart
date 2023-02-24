
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BudgetFragment extends StatefulWidget{
String title;
   BudgetFragment({super.key,required this.title});
  @override
  State<StatefulWidget> createState() => _BudgetFragmentState();
}

class _BudgetFragmentState extends State<BudgetFragment>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
    );
  }
}