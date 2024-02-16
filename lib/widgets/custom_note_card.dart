import 'package:flutter/material.dart';
import 'package:note_app/views/edit_note_view.dart';

// ignore: camel_case_types
class custom_node_card extends StatelessWidget {
  const custom_node_card({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const EditNoteView(),
          ),
        );
      },
      child: Container(
        padding:
            const EdgeInsets.only(top: 16, bottom: 16, left: 20, right: 17),
        // ignore: sort_child_properties_last
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: const Text(
                "title",
                style: TextStyle(color: Colors.black, fontSize: 26),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 7),
                child: Text(
                  "subtitlesdfdsdfadsfsdafadsvdvddsavdsadsvadv dfadsfsfadfadf adsfadf",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7), fontSize: 16),
                ),
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete_outline_rounded,
                    color: Colors.black,
                    size: 32,
                  )),
            ),
            Text(
              "date",
              style:
                  TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 16),
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
