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
              RotatedListview(nft: nftCollection[0].nft?.sublist(0, 5)),
              RotatedListview(nft: nftCollection[1].nft?.sublist(0, 4)),
              RotatedListview(nft: nftCollection[2].nft?.sublist(0, 5)),
              RotatedListview(nft: nftCollection[3].nft?.sublist(0, 4)),
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
                width: 300,
                child: Text(
                  homeDiscriptionText,
                  textAlign: TextAlign.center,
                  style: smallTextStyle.copyWith(color: kBlackColor),
                ),
              ),
              SlideToContinue(
                backgroundColor: kPinkColor,
                foregroundColor: kWhiteColor,
                text: 'Slide to Continue',
                onConfirm: () => pushExploreScreen(context),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
