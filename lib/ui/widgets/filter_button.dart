import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String text;
  const FilterButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(text, style: TextStyle(fontSize: 20)),
      onPressed: () {},
    );
  }
}
