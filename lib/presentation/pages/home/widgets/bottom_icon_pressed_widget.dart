import 'package:flutter/material.dart';

class BottomIconPressedWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback tap;
  const BottomIconPressedWidget({
    Key? key,
    required this.icon,
    required this.tap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: tap,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
