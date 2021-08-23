class SalesMan {
  int salaryPerWeek = 1;

  double weeklyEarning(int totalSales) {
    return salaryPerWeek + (totalSales * (0.09));
  }
}
