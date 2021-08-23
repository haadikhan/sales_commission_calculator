part of 'screen_bloc.dart';

class ScreenState {
  final List<int> itemPricesAdded;

  ScreenState({
    required this.itemPricesAdded,
  });

  int totalSales() {
    int totalSales = 0;
    itemPricesAdded.forEach((itemPrice) {
      totalSales += itemPrice;
    });
    return totalSales;
  }
}
