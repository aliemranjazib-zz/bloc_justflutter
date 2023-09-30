import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/notes_cubit.dart';

class AddNotesPage extends StatelessWidget {
  const AddNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final addNotesCubit = BlocProvider.of<AddNotesCubit>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: addNotesCubit.formKey,
            child: Column(
              children: [
                const Text(
                  "ENTER YOUR\nNOTE",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40, color: Colors.deepPurple),
                ),
                const SizedBox(height: 40),
                TextFormField(
                  controller: addNotesCubit.titleC,
                  validator: addNotesCubit.titleValidator,
                  decoration: const InputDecoration(
                    hintText: 'enter title',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: addNotesCubit.detailC,
                  validator: addNotesCubit.detailValidator,
                  maxLines: 4,
                  minLines: 4,
                  decoration: const InputDecoration(
                    hintText: 'enter detail',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 40),
                MaterialButton(
                  color: Colors.amber,
                  onPressed: () {
                    addNotesCubit.submit();
                  },
                  minWidth: double.infinity,
                  child: const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text("SAVE"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
