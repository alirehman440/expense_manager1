
import 'package:expensemanager/core/constants/constants_settings.dart';
import 'package:expensemanager/core/countyCode/model_country.dart';
import 'package:expensemanager/core/countyCode/page_country_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SettingsFragment extends StatefulWidget {
  String title;
   SettingsFragment({Key? key,required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsFragmentState();
}

class _SettingsFragmentState extends State<SettingsFragment> {
  String selectCurrency =ConstantsSettings.currencySymbol;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(widget.title)),
    body: ListView(
      padding: const EdgeInsets.all(8),

      children: [
        ListTile(
          onTap:_currencySelector,
          title: Text(ConstantsSettings.currencySymbol),
        ),
        const Divider()
      ],
    ),);
  }

  Future<void> _currencySelector() async{
    ModelCountry modalCountry = await Navigator.push(context, MaterialPageRoute(builder: (builder)=>
        PageCountryList()));

    setState(() {
      ConstantsSettings.currencySymbol =modalCountry.currency_symbol;
    });

    print('modalCountry ${modalCountry.currency_symbol}');
  }
}
