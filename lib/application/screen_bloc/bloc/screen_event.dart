part of 'screen_bloc.dart';

@immutable
abstract class ScreenEvent {}

// class SalaryInputEvent extends ScreenEvent {
//   final String salaryInput;
//   SalaryInputEvent(this.salaryInput);
// }

// class ItemPriceInputEvent extends ScreenEvent {
//   final String itemPriceInput;
//   ItemPriceInputEvent(this.itemPriceInput);
// }

class AddSaleEvent extends ScreenEvent {
  final String salaryInput, itemPriceInput;

  AddSaleEvent({
    required this.salaryInput,
    required this.itemPriceInput,
  });
}
