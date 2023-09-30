import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_cubit/cubit/notes_cubit.dart';
import 'package:notes_app_cubit/pages/add_notes_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final notesCubit = BlocProvider.of<AddNotesCubit>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const AddNotesPage()));
          }),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              const Text(
                "SEE YOUR\nNOTES",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40, color: Colors.deepPurple),
              ),
              Expanded(child: BlocBuilder<AddNotesCubit, NotesState>(
                builder: (context, state) {
                  return ListView.separated(
                    itemCount: notesCubit.notes.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        color: Colors.grey.shade200,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(state.notes![index].title!),
                        subtitle: Text(
                          state.notes![index].detail!,
                          style: TextStyle(color: Colors.grey),
                        ),
                        trailing: Container(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          notesCubit.saveEditedNotes(index);
                                          return AlertDialog(
                                            content: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 20,
                                                      vertical: 20),
                                                  child: Form(
                                                    key: notesCubit.formKey,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        const Text(
                                                          "EDIT YOUR\nNOTE",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontSize: 40,
                                                              color: Colors
                                                                  .deepPurple),
                                                        ),
                                                        const SizedBox(
                                                            height: 40),
                                                        TextFormField(
                                                          controller:
                                                              notesCubit.titleC,
                                                          validator: notesCubit
                                                              .titleValidator,
                                                          decoration:
                                                              const InputDecoration(
                                                            hintText:
                                                                'enter title',
                                                            border:
                                                                OutlineInputBorder(),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 10),
                                                        TextFormField(
                                                          controller: notesCubit
                                                              .detailC,
                                                          validator: notesCubit
                                                              .detailValidator,
                                                          maxLines: 4,
                                                          minLines: 4,
                                                          decoration:
                                                              const InputDecoration(
                                                            hintText:
                                                                'enter detail',
                                                            border:
                                                                OutlineInputBorder(),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 10),
                                                        MaterialButton(
                                                          color: Colors.amber,
                                                          onPressed: () {
                                                            notesCubit
                                                                .saveEditedNotes(
                                                                    index);
                                                          },
                                                          minWidth:
                                                              double.infinity,
                                                          child: const Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    18.0),
                                                            child: Text("SAVE"),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                    // notesCubit.delete(index);
                                  },
                                  icon: Icon(Icons.edit)),
                              IconButton(
                                  onPressed: () {
                                    notesCubit.delete(index);
                                  },
                                  icon: Icon(Icons.delete_forever)),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
