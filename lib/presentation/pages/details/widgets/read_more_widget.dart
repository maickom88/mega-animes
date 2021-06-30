import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ReadMoreWidget extends StatelessWidget {
  final String description;
  const ReadMoreWidget({
    required this.description,
  });
  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      description,
      trimLines: 5,
      colorClickableText: Colors.pink,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Mostrar mais',
      trimExpandedText: 'Mostrar menos',
      moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    );
  }
}
