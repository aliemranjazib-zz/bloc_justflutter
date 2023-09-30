import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/notes_model.dart';

class NotesState {
  final List<Notes>? notes;
  NotesState({
    this.notes,
  });
}

class AddNotesCubit extends Cubit<NotesState> {
  AddNotesCubit() : super(NotesState());
  TextEditingController titleC = TextEditingController();
  TextEditingController detailC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List<Notes> notes = [];
  void submit() {
    if (formKey.currentState!.validate()) {
      notes.add(Notes(title: titleC.text, detail: detailC.text));
      emit(NotesState(notes: notes));
      titleC.clear();
      detailC.clear();
    }
  }

  void saveEditedNotes(index) {
    // print("444444 ${notes[index].title}");
    notes[index].title = titleC.text;
    notes[index].detail = detailC.text;
    emit(NotesState(notes: notes));
    titleC.clear();
    detailC.clear();
  }

  void delete(int index) {
    notes.removeAt(index);
    emit(NotesState(notes: notes));
  }

  String? titleValidator(String? value) {
    if (value!.isEmpty) {
      return 'please enter title';
    }
    return null;
  }

  String? detailValidator(String? value) {
    if (value!.isEmpty || value.length < 5) {
      return 'please enter valid detail';
    }
    return null;
  }
}
