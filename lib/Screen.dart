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
  var itemList = [];
  var items;
  double totalAmountOfItems = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sales commission  calculator'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          TextField(
            controller: sallaryController,
            decoration: InputDecoration(hintText: 'enter sallary'),
          ),
          TextField(
            controller: itemPriceController,
            decoration: InputDecoration(hintText: 'enter items sold'),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              salesMan.itemPrice = double.parse(itemPriceController.text);
              salesMan.sallaryPerWeek = double.parse(sallaryController.text);
              itemList.add(salesMan.itemPrice);
              totalAmountCalculator();
              _calculateTotalEarning();

              setState(() {});
            },
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text("add entry"),
            ),
          ),
          Container(
              padding: EdgeInsets.all(20),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Text(
                '9% commission on total sale',
                style: TextStyle(fontSize: 15),
              )),
          Container(
              padding: EdgeInsets.all(20),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Text(
                'items price=' + itemList.toString(),
                style: TextStyle(fontSize: 20),
              )),
          Container(
              padding: EdgeInsets.all(20),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Text(
                'Total= ' + totalAmountOfItems.toString(),
                // + totalAmountCalculator().toString(),
                style: TextStyle(fontSize: 20),
              )),
          const SizedBox(height: 20),
          // InkWell(
          //   onTap: () {
          //                  setState(() {});
          //   },
          //   child: Container(
          //     padding: EdgeInsets.all(20),
          //     decoration: BoxDecoration(
          //       color: Colors.green,
          //     ),
          //     child: Text(
          //       'total earning of seller',
          //       style:
          //           TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          //     ),
          //   ),
          // ),
          Container(
              padding: EdgeInsets.all(20),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Text(
                'Total Earning= ' + _calculateTotalEarning().toString(),
                style: TextStyle(fontSize: 20),
              )),
        ],
      ),
    );
  }

  double _calculateTotalEarning() {
    salesMan.totalEarning =
        salesMan.sallaryPerWeek + (totalAmountOfItems * (0.09));

    return salesMan.totalEarning;
  }

  double totalAmountCalculator() {
    totalAmountOfItems = itemList.reduce((value, element) => value + element);
    return totalAmountOfItems;
  }
}
