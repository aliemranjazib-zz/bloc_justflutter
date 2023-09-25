import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CalenderCubit extends Cubit<DateTime?> {
  DateRangePickerController? controller;
  CalenderCubit() : super(null);
}
