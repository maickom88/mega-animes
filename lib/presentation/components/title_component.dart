import 'package:flutter/material.dart';

class TitleComponent extends StatelessWidget {
  final String title;
  final String titleAction;
  const TitleComponent({
    Key? key,
    required this.title,
    required this.titleAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: Text.rich(
        TextSpan(
          style: Theme.of(context).textTheme.headline1,
          children: [
            TextSpan(text: "$title "),
            TextSpan(
              style: Theme.of(context).textTheme.headline2,
              text: "$titleAction ",
            ),
            WidgetSpan(
              child: SizedBox(
                width: 30,
                height: 20,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 14,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
