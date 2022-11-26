import 'package:flutter/material.dart';
import 'package:nft/constants.dart';

import '../widgets/rotated_listview.dart';
import '../widgets/slide_to_continue.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        child: Scaffold(
          body: Column(
            children: [
              RotatedListview(nfts: nftCollection[0].nft),
              RotatedListview(nfts: nftCollection[1].nft),
              RotatedListview(nfts: nftCollection[2].nft),
              RotatedListview(nfts: nftCollection[3].nft),
              const Spacer(),
              SizedBox(
                width: 250,
                child: Text(
                  'Discover NFT Collection',
                  textAlign: TextAlign.center,
                  style: bigTextStyle.copyWith(color: kBlackColor),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 280,
                child: Text(
                  homeDiscriptionText,
                  textAlign: TextAlign.center,
                  style: smallTextStyle.copyWith(color: kBlackColor),
                ),
              ),
              SlideToContinue(
                text: 'Start Exploring',
                backgroundColor: kPinkColor,
                foregroundColor: kWhiteColor,
                onConfirm: () => pushExploreScreen(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
