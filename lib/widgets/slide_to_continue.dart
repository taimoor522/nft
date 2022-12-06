import 'package:flutter/material.dart';
import 'package:nft/constants.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';

class SlideToContinue extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final String text;
  final Function()? onConfirm;

  const SlideToContinue(
      {super.key,
      required this.backgroundColor,
      required this.foregroundColor,
      required this.text,
      this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ConfirmationSlider(
        onConfirmation: () => onConfirm?.call(),
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        sliderButtonContent: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: kPinkColor,
        ),
        text: text,
        textStyle: mediumTextStyle,
      ),
    );
  }
}
