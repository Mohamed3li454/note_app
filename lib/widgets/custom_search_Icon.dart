// ignore: file_names
import 'package:flutter/material.dart';

// ignore: camel_case_types
class custom_searchIcon extends StatelessWidget {
  const custom_searchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: sort_child_properties_last
      child: const Center(
        child: Icon(Icons.search),
      ),
      height: 46,
      width: 46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withOpacity(0.05),
      ),
    );
  }
}
