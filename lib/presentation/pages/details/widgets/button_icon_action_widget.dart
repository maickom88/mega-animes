import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';

class ButtonIconActionWidget extends StatelessWidget {
  final VoidCallback onLike;
  final VoidCallback hideInformation;
  final VoidCallback playTap;
  final bool isFavorite;
  final String anime;
  const ButtonIconActionWidget({
    Key? key,
    required this.anime,
    this.isFavorite = false,
    required this.playTap,
    required this.hideInformation,
    required this.onLike,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Share.share(
              'Faça o download do app MEGA ANIMES TV https://play.google.com/store/apps/details?id=com.mega_animes assista: $anime',
            );
          },
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 2,
                color: Colors.red,
              ),
            ),
            child: Icon(
              FontAwesomeIcons.share,
              color: Colors.white,
              size: 15,
            ),
          ),
        ),
        InkWell(
          onTap: hideInformation,
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 2,
                color: Colors.red,
              ),
            ),
            child: Icon(
              FontAwesomeIcons.info,
              color: Colors.white,
              size: 15,
            ),
          ),
        ),
        InkWell(
          onTap: playTap,
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 2,
                color: Colors.red,
              ),
            ),
            child: Icon(
              FontAwesomeIcons.play,
              color: Colors.white,
              size: 15,
            ),
          ),
        ),
        InkWell(
          onTap: onLike,
          child: AnimatedContainer(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: isFavorite ? Colors.red : Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                width: 2,
                color: Colors.red,
              ),
            ),
            duration: Duration(milliseconds: 300),
            child: Icon(
              isFavorite ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
              color: Colors.white,
              size: 15,
            ),
          ),
        ),
      ],
    );
  }
}
