

import 'package:expensemanager/presentation/records/add_record_page.dart';
import 'package:flutter/material.dart';


class RecordsFragment extends StatefulWidget {
  String title;
   RecordsFragment({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _RecordsFragmentState();

}

  class _RecordsFragmentState extends State<RecordsFragment>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text(widget.title),),
     body: const Center(child: ( Text('Records Fragment'))),
   floatingActionButton: FloatingActionButton(
       onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AddRecordPage())),
    backgroundColor: Colors.blue,
    child: const Icon(Icons.add),

   ),);
  }



}




