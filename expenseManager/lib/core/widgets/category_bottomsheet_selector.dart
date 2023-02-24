import 'package:flutter/material.dart';

class CategoryBottomSheet extends StatefulWidget {
  int selectedCategoryIndex = 0;

  CategoryBottomSheet({Key? key, required this.selectedCategoryIndex})
      : super(key: key);

  @override
  State<CategoryBottomSheet> createState() => _CategoryBottomSheetState();
}

class _CategoryBottomSheetState extends State<CategoryBottomSheet> {
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

  Map<String, IconData> icon_data_income = {
    'Wage': Icons.people,
    'Bonus': Icons.shopping_bag,
    'Investment': Icons.dashboard,
    'PartTime': Icons.medical_services_rounded,
    'Salary': Icons.laptop
  };

  late Map<String,IconData> selectedTabValue;
  @override
  void initState() {
    super.initState();
    selectedTabValue =icon_data_income;
  }

  MaterialColor selectedTextColor = Colors.lightBlue;
  MaterialColor unSelectedTextColor = Colors.grey;

  Widget selectedTab(Map<String, IconData> list) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 4,
        children: List.generate(list.length, (index) {
          var item = list.entries.elementAt(index);
          return InkWell(
            child: Container(
              color: widget.selectedCategoryIndex == index
                  ? Colors.green
                  : Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(item.value), Text(item.key)],
              ),
            ),
            onTap: () {
              setState(() {
                widget.selectedCategoryIndex = index;
                // Navigator.of(context).pop(index);
              });
              //  print("Category Selected : $index");
            },
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height * 0.35;

    return Container(
      color: Colors.red,
      width: screenWidth,
      height: screenHeight,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedTabValue = icon_data_income;
                      });
                    },
                    child: Text('Income',
                        style: TextStyle(color: selectedTextColor))),
              ),
              Expanded(
                child: InkWell(
                    onTap: () {
                      print("Category Selected expense");
                      setState(() {
                        selectedTabValue = icon_data_expense;
                      });
                    },
                    child: Text('Expense',
                        style: TextStyle(color: unSelectedTextColor))),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                    onTap: () => selectedTab(icon_data_income),
                    child: Text('Transfer',
                        style: TextStyle(color: unSelectedTextColor))),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop(widget.selectedCategoryIndex);
                    },
                    child: Icon(Icons.check)),
              ),
              const SizedBox(height: 50),
            ],
          ),
          selectedTab(selectedTabValue)
        ],
      )
      ,
    );
  }

}
