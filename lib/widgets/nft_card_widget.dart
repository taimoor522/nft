import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:nft/constants.dart';

import '../models.dart';

class NFTCardWidget extends StatelessWidget {
  final NFT nft;
  const NFTCardWidget({super.key, required this.nft});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => pushBidScreen(context, nft),
      child: Hero(
        tag: nft.price,
        child: Container(
          height: 180,
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(10),
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
                  nft.price.toString(),
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
