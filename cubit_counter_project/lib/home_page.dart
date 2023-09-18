import 'package:cubit_counter_project/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).increament();
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).decreament();
            },
            child: const Icon(Icons.minimize_outlined),
          ),
        ],
      ),
      body: Center(child: BlocBuilder<CounterCubit, int>(
        builder: (context, state) {
          return Text(
            "$state",
            style: TextStyle(fontSize: 40, color: Colors.deepPurple),
          );
        },
      )),
    );
  }
}
