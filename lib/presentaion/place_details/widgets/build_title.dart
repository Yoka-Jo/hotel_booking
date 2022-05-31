import 'package:flutter/material.dart';

class BuildTitle extends StatelessWidget {
  const BuildTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.displayLarge,
    );
  }
}
