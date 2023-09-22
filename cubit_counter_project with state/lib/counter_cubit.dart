import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit(CounterState initailState) : super(initailState);

  increament() {
    emit(CounterState(state.counter + 1));
  }

  decreament() {
    if (state.counter > 5) {
      emit(CounterState(state.counter - 1));
    }
  }
}
