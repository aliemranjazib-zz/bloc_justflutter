import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_cubit/cubit/notes_cubit.dart';
import 'package:notes_app_cubit/pages/add_notes_page.dart';
import 'package:notes_app_cubit/pages/edit_notes_page.dart';

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
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => EditNotesPage(
                                                  index: index,
                                                )));
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
