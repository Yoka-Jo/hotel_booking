import 'package:flutter/material.dart';

class BuildBodyText extends StatelessWidget {
  const BuildBodyText({
    Key? key,
    required this.bodyText,
  }) : super(key: key);

  final String bodyText;

  @override
  Widget build(BuildContext context) {
    return Text(
      bodyText,
      style: Theme.of(context).textTheme.displayMedium,
    );
  }
}
