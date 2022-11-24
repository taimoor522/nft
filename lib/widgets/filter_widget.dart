import 'package:flutter/material.dart';

import '../constants.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 150,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(color: kBlackColor, borderRadius: BorderRadius.circular(100)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
          const Text(
            'Filter',
            style: mediumTextStyle,
          ),
          const Spacer(),
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              color: kWhiteColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.tune_rounded, color: kBlackColor),
          ),
        ],
      ),
    );
  }
}
