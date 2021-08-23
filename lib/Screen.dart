// Sales Commission Calculator) A large company pays its salespeople
// on a commission basis.
// The salespeople receive $200 per week plus 9% of their gross
// sales for that week. For example, a
// salesperson who sells $5000 worth of merchandise in a week
// receives $200 plus 9% of $5000, or a
// total of $650. You’ve been supplied with a list of
// the items sold by each salesperson. The values of
// these items are as follows:
// Item Value
// 1 239.99
// 2 129.75
// 3 99.95
// 4 350.89
// Develop a Java application that inputs one salesperson’s items sold for last week and calculates and
// displays that salesperson’s earnings. There’s no limit to the number of items that can be sold.

import 'package:flutter/material.dart';
import 'package:sales_commission_calculator/application/screen_bloc/bloc/screen_bloc.dart';
import 'package:sales_commission_calculator/sales_man.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          AddItemForm(),
          Overview(),
          Expanded(child: SalesListView()),
        ],
      ),
    );
  }
}

class AddItemForm extends StatelessWidget {
  TextEditingController itemPriceController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScreenBloc, ScreenState>(
      builder: (context, state) {
        return Column(
          children: [
            Text('Item Prices Form'),
            TextFormField(
              controller: salaryController,
              decoration: InputDecoration(hintText: 'enter salary'),
            ),
            TextFormField(
              controller: itemPriceController,
              decoration: InputDecoration(hintText: 'enter item price'),
            ),
            MaterialButton(
              child: Text('Add Item'),
              color: Colors.blue,
              onPressed: () {
                context.read<ScreenBloc>().add(
                      AddSaleEvent(
                        itemPriceInput: itemPriceController.text,
                        salaryInput: salaryController.text,
                      ),
                    );
              },
            )
          ],
        );
      },
    );
  }
}

class SalesListView extends StatelessWidget {
  const SalesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScreenBloc, ScreenState>(
      builder: (_, state) {
        return ListView.builder(
          itemCount: state.itemPricesAdded.length,
          itemBuilder: (_, index) {
            return Text('${state.itemPricesAdded[index]}');
          },
        );
      },
    );
  }
}

class Overview extends StatelessWidget {
  const Overview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScreenBloc, ScreenState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Overview'),
            Text(
                'weekly earning: ${SalesMan().weeklyEarning(state.totalSales())}')
          ],
        );
      },
    );
  }
}
