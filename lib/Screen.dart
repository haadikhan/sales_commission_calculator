// Sales Commission Calculator) A large company pays its salespeople on a commission basis.
// The salespeople receive $200 per week plus 9% of their gross sales for that week. For example, a
// salesperson who sells $5000 worth of merchandise in a week receives $200 plus 9% of $5000, or a
// total of $650. You’ve been supplied with a list of the items sold by each salesperson. The values of
// these items are as follows:
// Item Value
// 1 239.99
// 2 129.75
// 3 99.95
// 4 350.89
// Develop a Java application that inputs one salesperson’s items sold for last week and calculates and
// displays that salesperson’s earnings. There’s no limit to the number of items that can be sold.

import 'package:flutter/material.dart   ';
import 'package:sales_commission_calculator/sales_man.dart';

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  SalesMan salesMan = SalesMan();
  TextEditingController sallaryController = TextEditingController();
  TextEditingController itemPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sales commission  calculator'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          _enterSalaryTextField(),
          _enterItemSoldTextField(),
          const SizedBox(height: 20),
          _addEntryButton(),
          _commissionText(),
          // _showItemPrices(),
          _totalAmountOfItems(),
          const SizedBox(height: 20),
          _totalEaringText(),
        ],
      ),
    );
  }

  Widget _enterSalaryTextField() {
    return TextField(
      controller: sallaryController,
      decoration: InputDecoration(hintText: 'enter sallary'),
    );
  }

  Widget _enterItemSoldTextField() {
    return TextField(
      controller: itemPriceController,
      decoration: InputDecoration(hintText: 'enter sallary'),
    );
  }

  Widget _addEntryButton() {
    return InkWell(
      onTap: () {
        salesMan.itemPrice = double.parse(itemPriceController.text);

        salesMan.addItemsInList(double.parse(sallaryController.text),
            double.parse(itemPriceController.text));
        salesMan.totalAmountOfItemsCalculated();
        salesMan.calculateTotalEarning();

        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.green,
        ),
        child: Text(
          "add entry",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  // Widget _showItemPrices() {
  //   return Container(
  //       padding: EdgeInsets.all(20),
  //       decoration: BoxDecoration(border: Border.all(color: Colors.black)),
  //       child: Text(
  //         'items price=' + salesMan.itemList.toString(),
  //         style: TextStyle(fontSize: 20),
  //       ));
  // }

  Widget _commissionText() {
    return Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Text(
          '9% commission on total sale',
          style: TextStyle(fontSize: 15),
        ));
  }

  Widget _totalAmountOfItems() {
    return Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Text(
          'Total= ' + salesMan.totalAmountOfItemsCalculated().toString(),
          style: TextStyle(fontSize: 20),
        ));
  }

  Widget _totalEaringText() {
    return Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Text(
          'Total Earning= ' + salesMan.calculateTotalEarning().toString(),
          style: TextStyle(fontSize: 20),
        ));
  }
}
