
import 'package:expensemanager/core/constants/constants_app.dart';
import 'package:expensemanager/modal/transaction/transaction.dart';
import 'package:expensemanager/presentation/analytics/analytics_fragment.dart';
import 'package:expensemanager/presentation/budget/budget_fragment.dart';
import 'package:expensemanager/presentation/records/records_fragment.dart';
import 'package:expensemanager/presentation/settings/settings_fragment.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionAdapter());
  await Hive.openBox<Transaction>('transaction');
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  final widgetTitle = [
    ConstantsApp.recordsTab,
    ConstantsApp.analyticsTab,
    ConstantsApp.budgetTab,
    ConstantsApp.settingsTab
  ];

  final widgetOptions = [
    RecordsFragment(title: ConstantsApp.recordsTab),
    AnalyticsFragment(title: ConstantsApp.analyticsTab),
    BudgetFragment(title: ConstantsApp.budgetTab),
    SettingsFragment(title: ConstantsApp.settingsTab)
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: const Icon(Icons.list_alt), label: widgetTitle[0]),
          BottomNavigationBarItem(
              icon: const Icon(Icons.analytics), label: widgetTitle[1]),
          BottomNavigationBarItem(
              icon: const Icon(Icons.money), label: widgetTitle[2]),
          BottomNavigationBarItem(
              icon: const Icon(Icons.settings), label: widgetTitle[3]),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        unselectedItemColor: Colors.black54,
        selectedItemColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
      ),
    );
  }
}
