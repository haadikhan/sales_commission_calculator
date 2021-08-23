import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'screen_event.dart';
part 'screen_state.dart';

class ScreenBloc extends Bloc<ScreenEvent, ScreenState> {
  ScreenBloc()
      : super(
          ScreenState(
            itemPricesAdded: [],
          ),
        );

  @override
  Stream<ScreenState> mapEventToState(
    ScreenEvent event,
  ) async* {
    List<int> itemPrices = state.itemPricesAdded;

    itemPrices.add(int.parse((event as AddSaleEvent).itemPriceInput));
    yield ScreenState(
      itemPricesAdded: itemPrices,
    );
  }
}
