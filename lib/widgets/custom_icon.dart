import 'package:flutter/material.dart';

// ignore: camel_case_types
class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, this.icon, this.onpressed});
  final IconData? icon;
  final void Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: sort_child_properties_last
      child: Center(
        child: IconButton(
          onPressed: onpressed,
          icon: Icon(icon),
        ),
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
