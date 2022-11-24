import 'package:flutter/material.dart';

import '../constants.dart';

class SmallContainer extends StatelessWidget {
  const SmallContainer({
    Key? key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final Color backgroundColor;
  final Color foregroundColor;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: radius10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${title}k',
            style: mediumTextStyle.copyWith(color: foregroundColor),
          ),
          Text(
            subTitle,
            style: smallTextStyle.copyWith(color: foregroundColor),
          )
        ],
      ),
    );
  }
}
