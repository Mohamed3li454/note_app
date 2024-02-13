import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/widgets/custom_appbar.dart';

// ignore: camel_case_types
class note_view_body extends StatelessWidget {
  const note_view_body({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          custom_appbar(),
          custom_node_card()
        ],
      ),
    );
  }
}

class custom_node_card extends StatelessWidget {
  const custom_node_card({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: sort_child_properties_last
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text("title",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.black))),
            subtitle: const Text(
              "subtitle",
              style: TextStyle(color: Colors.black),
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete_outline_rounded,
                  color: Colors.black,
                )),
          ),
          Text("date", style: TextStyle(color: Colors.black))
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
