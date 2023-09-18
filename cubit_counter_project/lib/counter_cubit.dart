import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit(int initailState) : super(initailState);

  increament() {
    emit(state + 1);
  }

  decreament() {
    if (state > 5) {
      emit(state - 1);
    }
  }
}
