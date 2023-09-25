import 'package:cubit_calender_app/calender_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CalenderView extends StatelessWidget {
  const CalenderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            BlocBuilder<CalenderCubit, DateTime?>(
              builder: (context, state) {
                return Column(
                  children: [
                    Text(
                      "SELECTED DATE ${state} ",
                      style: const TextStyle(
                          fontSize: 40, color: Colors.deepPurple),
                    ),
                    SfDateRangePicker(
                      controller:
                          BlocProvider.of<CalenderCubit>(context).controller,
                      selectionMode: DateRangePickerSelectionMode.single,
                      onSelectionChanged:
                          (dateRangePickerSelectionChangedArgs) {
                        print(BlocProvider.of<CalenderCubit>(context)
                            .controller!
                            .selectedDate);
                      },
                    ),
                  ],
                );
              },
            ),
            ElevatedButton(
                onPressed: () {},
                child: Text(
                  "CALCUATE",
                  style:
                      const TextStyle(fontSize: 40, color: Colors.deepPurple),
                ))
          ],
        ),
      ),
    );
  }
}
