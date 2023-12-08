import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/notes_cubit.dart';

class EditNotesPage extends StatelessWidget {
  final int index;
  const EditNotesPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final editNotesCubit = BlocProvider.of<AddNotesCubit>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: editNotesCubit.formKey,
            child: Column(
              children: [
                const Text(
                  "EDIT YOUR\nNOTE",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40, color: Colors.deepPurple),
                ),
                const SizedBox(height: 40),
                TextFormField(
                  controller: editNotesCubit.titleC,
                  validator: editNotesCubit.titleValidator,
                  decoration: InputDecoration(
                    hintText: editNotesCubit.notes[index].title,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: editNotesCubit.detailC,
                  validator: editNotesCubit.detailValidator,
                  maxLines: 4,
                  minLines: 4,
                  decoration: InputDecoration(
                    hintText: editNotesCubit.notes[index].detail,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 40),
                MaterialButton(
                  color: Colors.amber,
                  onPressed: () {
                    editNotesCubit.saveEditedNotes(index);
                    Navigator.pop(context);
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
