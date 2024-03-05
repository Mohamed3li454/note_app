import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custom_appbar.dart';
import 'package:note_app/widgets/custom_note_card.dart';
import 'package:note_app/widgets/notes_list_view.dart';

// ignore: camel_case_types
class note_view_body extends StatefulWidget {
  const note_view_body({super.key});

  @override
  State<note_view_body> createState() => _note_view_bodyState();
}

// ignore: camel_case_types
class _note_view_bodyState extends State<note_view_body> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).ReadNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          custom_appbar(
            title: "Notes",
            icon: Icons.search_rounded,
            onpressed: () {
              showSearch(
                  context: context,
                  delegate: Search(
                      notes: BlocProvider.of<NotesCubit>(context).Notes!));
            },
          ),
          const Expanded(
            child: NotesListView(),
          )
        ],
      ),
    );
  }
}

class Search extends SearchDelegate {
  final List<NoteModel> notes;

  Search({required this.notes});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // Close the keyboard
          FocusScope.of(context).unfocus();
        },
        child: filter(
            notes: notes,
            query:
                query) // Replace YourSearchResultsWidget with your actual search results widget
        );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return filter(notes: notes, query: query);
  }
}

// ignore: camel_case_types
class filter extends StatelessWidget {
  const filter({
    super.key,
    required this.notes,
    required this.query,
  });

  final List<NoteModel> notes;
  final String query;

  @override
  Widget build(BuildContext context) {
    List<NoteModel> filter = notes
        .where((note) => note.subtitle.toLowerCase().contains(query))
        .toList();
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: custom_node_card(notes: filter[index]),
        );
      },
      itemCount: query == "" ? notes.length : filter.length,
    );
  }
}
