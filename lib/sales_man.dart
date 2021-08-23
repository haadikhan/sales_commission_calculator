class SalesMan {
  double salaryPerWeek = 1;
  double itemPrice = 1;
  double totalEarning = 1;
  double totalAmountOfItems = 1;
  double commissionPerWeek = 1;
  List<double> itemList = [2, 2];
  void addItemsInList(salaryPerWeek, itemPrice) {
    itemList.add(itemPrice);
  }

  double totalAmountOfItemsCalculated() {
    totalAmountOfItems = itemList.reduce((value, element) => value + element);

    return totalAmountOfItems;
  }

  double calculateTotalEarning() {
    totalEarning = salaryPerWeek + (totalAmountOfItems * (0.09));

    return totalEarning;
  }
}
