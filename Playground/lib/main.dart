import 'package:flutter/material.dart';
import 'package:playground/modal_student.dart';
import 'package:playground/screen_add_record.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    ModalStudent aa = ModalStudent(id: 1, name: "hamza");
    ModalStudent ms = ModalStudent.ModalObjectFromMap(aa.toMap());
    print("this is sparta ${ms.name}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          color: Colors.teal,
          child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ScreenAddRecord()));
              },
              child: Text("Ali")),
        ));
  }

  Widget MyButton(String title) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(2),
      color: Colors.deepOrangeAccent,
      child: Text(
        title,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }
}
