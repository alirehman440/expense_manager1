import 'dart:io';

import 'package:expensemanager/core/constants/constants_transactions.dart';
import 'package:expensemanager/core/constants/constants_widgets.dart';
import 'package:expensemanager/core/widgets/category_bottomsheet_selector.dart';
import 'package:expensemanager/core/widgets/snackbar_widget.dart';
import 'package:expensemanager/modal/transaction/transaction.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:expensemanager/core/extensions/time_extensions.dart';
import 'package:expensemanager/core/constants/constants_add_record.dart';
import 'package:expensemanager/modal/transaction/Boxes.dart';
import 'package:expensemanager/core/extensions/BuildContextMapping.dart';

class AddRecordPage extends StatefulWidget {
  const AddRecordPage({Key? key}) : super(key: key);

  @override
  State<AddRecordPage> createState() => _AddRecordPageState();
}

class _AddRecordPageState extends State<AddRecordPage>
    with SingleTickerProviderStateMixin {
  @override
  void dispose() {
    Hive.close();
    _accountController.dispose();
    _noteController.dispose();
    _payeeController.dispose();
    _amountController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  var tabTitle = [
    ConstantsTransactions.income,
    ConstantsTransactions.expense,
    ConstantsTransactions.transfer
  ];
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _payeeController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  bool recurrence = false;
  late double screenWidth, screenHeight;

  var now = DateTime.now();
  DateTime? selectedDate;
  int selectedCategoryIndex = 0;
  int selectedTypeItem = 0;
  final ImagePicker _picker = ImagePicker();
  Map<String, IconData> icon_data_expense = {
    'Diet': Icons.no_food,
    'Daily': Icons.calendar_view_day_rounded,
    'Dress': Icons.accessibility_new,
    'Medical': Icons.medical_services_rounded,
    'Residential': Icons.home,
    'Education': Icons.cast_for_education,
    'Gift': Icons.card_giftcard,
    'Diet1': Icons.no_food,
    'Daily1': Icons.calendar_view_day_rounded,
    'Dress1': Icons.accessibility_new,
    'Medical1': Icons.medical_services_rounded,
    'Residential1': Icons.home,
    'Education1': Icons.cast_for_education,
    'Gift1': Icons.card_giftcard
  };

  File? imageFile;

  final GlobalKey<ScaffoldMessengerState> _scaffoldState =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    selectedDate = now;

    //  selectCategory(screenWidth,screenHeight);
    super.initState();
  }

  selectCategoryContainer() {
    return Container(
      color: Colors.red,
      width: screenWidth,
      padding: const EdgeInsets.all(8),
      height: screenHeight,
      child: GridView.count(
        crossAxisCount: 4,
        children: List.generate(icon_data_expense.length, (index) {
          var item = icon_data_expense.entries.elementAt(index);
          return InkWell(
            child: Container(
              color: selectedCategoryIndex == index
                  ? Colors.green
                  : Colors.transparent,
              child: Column(
                children: [Icon(item.value), Text(item.key)],
              ),
            ),
            onTap: () {
              setState(() {
                selectedCategoryIndex = index;
              });
              print("Category Selected : ${index}");
            },
          );
        }),
      ),
    );
  }

  selectCategory(double screenWidth, double screenHeight) {}

  Future addTransaction(DateTime dateTime, double amount, String category,
      String currency, TransactionType transactionType) async {
    final transaction = Transaction(
        dateTime: dateTime,
        amount: amount,
        category: category,
        currency: currency,
        transactionType: transactionType);
    final box = Boxes.getTransactions();
    box.add(transaction);
  }

  Widget incomeTab(
      double screenWidth, double screenHeight, String formattedDate) {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: Container(
        color: Colors.red,
        width: screenWidth,
        height: screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text('One'),
                Text('One'),
                Text('One'),
                Text('One'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text('two'),
                Text('two'),
                Text('two'),
                Text('two'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text('three'),
                Text('three'),
                Text('three'),
                Text('three'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text('four'),
                Text('four'),
                Text('four'),
                Text('four'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text('five'),
                Text('five'),
                Text('five'),
                Text('five'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height * 0.3;

    var selectedIndex = 0;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldState,
        appBar: AppBar(
          title: Text(tabTitle[selectedIndex]),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  print(" SnackBar pressed");
                  if (_amountController.text.isEmpty) {
                    print(" SnackBar amount is empty");
                    //  GetSnackBar(scaffold:_scaffoldState);
                    //ConstantsWidgets.getSnakeBar(scaffold: _scaffoldState,context, "hello");
                    //    ConstantsWidgets.showError(context,'aa',_scaffoldState);
                    context.showMaterialSnackBar(
                      "AppLocalizations.of(context)!.deletedCardLabel",
                      backgroundColor: Colors.lightBlue,
                      color: Colors.red,
                    );

                    // snackBar(context);
                  } else if (_accountController.text.isEmpty) {
                    print(" SnackBar account is empty");
                  }
                  /*else if(_accountController.text.isEmpty){
                    ConstantsWidgets.getSnakeBar(context, 'Account is Empty');
                  }*/
                  else {
                    print(" SnackBar data added");
                    addTransaction(
                        DateTime.now(),
                        double.parse(_amountController.text.toString()),
                        _accountController.text.toString(),
                        'USD',
                        TransactionType.expense);
                  }
                },
                icon: const Icon(Icons.check))
          ],
          /*   bottom: TabBar(
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            tabs: const [
              Tab(icon: Icon(Icons.monetization_on)),
              Tab(icon: Icon(Icons.money_off)),
              Tab(icon: Icon(Icons.currency_exchange)),
            ],
          ),*/
        ),
        body: /*Center(
        */ /*  child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Center(
                  child: incomeTab(screenWidth, screenHeight,
                      selectedDate!.formattedDate)),
              expenseTab(now, screenWidth, screenHeight),
              Center(child: Text(tabTitle[2])),
            ],
          ),*/ /*
          child: expenseTab(now, screenWidth, screenHeight),
        ),*/
            expenseTab(now, screenWidth, screenHeight, _scaffoldState, context),
      ),
    );
  }

  snackBar(BuildContext ctx) {
    ScaffoldMessenger.of(ctx).showSnackBar(
        const SnackBar(content: Text("Hello This is FlutterCampus")));
  }

  imagePicker(context, double? width, double? height, int? quality) async {
    try {
      PickedFile? pickedFile = await ImagePicker().getImage(
        source: ImageSource.camera,
        maxWidth: 400,
        maxHeight: 400,
      );
      if (pickedFile != null) {
        setState(() {
          imageFile = File(pickedFile.path);
        });
      }
    } catch (e) {
      print("Error ${e.toString()}e");
    }
  }

  expenseTab(DateTime now, double screenWidth, double screenHeight,
      GlobalKey<ScaffoldMessengerState> _scaffoldState, BuildContext ctx) {
    // GlobalKey<ScaffoldMessengerState> _scaffoldState;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  child: Icon(icon_data_expense.entries
                      .elementAt(selectedTypeItem)
                      .value),
                  onTap: () async {
                    //selectCategory(screenWidth, screenHeight);
                        int result = await showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return CategoryBottomSheet(
                              selectedCategoryIndex: selectedCategoryIndex);
                        });
                    print("Result from return:$result");
                    setState(() {
                      selectedTypeItem = result;
                    });

                  },
                ),
                const SizedBox(width: 20),
                 Expanded(
                  child: TextField(
                    decoration: (InputDecoration(hintText: 'Enter Amount')),
                    controller: _amountController,
                  ),
                ),
                SizedBox(width: 20),
                Text('PKR')
              ],
            ),
          ),
          const Divider(),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(child: Text(selectedDate!.formattedDate)),
                  const Icon(Icons.calendar_month_outlined)
                ],
              ),
            ),
            onTap: () async {
              final date = await showDatePicker(
                  context: context,
                  initialDate: selectedDate!,
                  firstDate: DateTime(1950),
                  lastDate: now);
              if (date != null) {
                setState(() {
                  selectedDate = date;
                  print("selectedDate $date");
                });
              }
            },
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Add Payer"),
                    controller: _payeeController,
                  ),
                ),
                const Divider(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Account"),
                    controller: _accountController,
                  ),
                ),
                Divider(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Note"),
                    controller: _noteController,
                  ),
                ),
                Divider(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => imagePicker(context, 400, 400, 100),
              child: Row(
                children: const [
                  Expanded(child: Text(ConstantsAddRecord.selectImage)),
                  SizedBox(width: 20),
                  Icon(Icons.ice_skating),
                  Divider(),
                ],
              ),
            ),
          ),
          imageFile == null
              ? const Text('Null')
              : Container(
                  height: 300,
                  width: 300,
                  child: Image.file(imageFile!, fit: BoxFit.cover)),
          const Divider(),
        ],
      ),
    );
  }
}
