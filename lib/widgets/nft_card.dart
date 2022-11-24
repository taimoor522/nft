import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../constants.dart';
import '../models.dart';

class NFTCardWidget extends StatelessWidget {
  const NFTCardWidget({
    Key? key,
    required this.nft,
  }) : super(key: key);

  final NFT nft;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => pushBidScreen(context, nft),
      child: Hero(
        tag: nft.price,
        child: Container(
          height: 180,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(nft.image),
              fit: BoxFit.cover,
            ),
            borderRadius: radius10,
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: GlassmorphicContainer(
              width: double.infinity,
              height: 40,
              borderRadius: 10,
              border: 0,
              blur: 5,
              linearGradient: linearGradient,
              borderGradient: borderLinearGradient,
              child: Center(
                child: Text(
                  '${nft.price.toString().padRight(4, '0')} ETH',
                  style: mediumTextStyle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
