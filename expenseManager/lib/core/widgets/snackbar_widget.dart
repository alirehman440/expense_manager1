

 import 'package:expensemanager/core/widgets/snackbar_widget.dart';
import 'package:flutter/material.dart';

class GetSnackBar extends StatefulWidget {
  final GlobalKey<ScaffoldMessengerState>? scaffold;

  const GetSnackBar({Key? key, this.scaffold}) : super(key: key);

  @override
  _GetSnackBar createState() => _GetSnackBar();
}
class _GetSnackBar extends State<GetSnackBar>{
  final snackBar = SnackBar(
    content: const Text('Yay! A SnackBar!'),
    backgroundColor: Colors.amber,
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );

  @override
  void initState() {
    super.initState();
    showInSnackBar("Some text");
  }
   @override
   Widget build(BuildContext context) {
     return Padding(
         key: widget.scaffold,
         padding: const EdgeInsets.all(16.0),
         child: new Text("Simple Text")
     );


   }

   showInSnackBar(String message){
     widget.scaffold?.currentState?.showSnackBar(
         SnackBar(
           content: Text(message),
           duration: Duration(seconds: 3),
         )
     );
   }
 }
