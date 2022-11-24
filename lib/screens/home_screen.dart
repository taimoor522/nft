import 'package:flutter/material.dart';
import 'package:nft/Screens/explore_screen.dart';
import 'package:nft/constants.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';

import '../widgets/rotated_listview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        child: Scaffold(
          body: Column(
            children: [
              RotatedListview(nfts: nftCollection[0].nft?.sublist(0, 5)),
              RotatedListview(nfts: nftCollection[1].nft?.sublist(0, 4)),
              RotatedListview(nfts: nftCollection[2].nft?.sublist(0, 5)),
              RotatedListview(nfts: nftCollection[3].nft?.sublist(0, 4)),
              const Spacer(),
              const SizedBox(
                width: 250,
                child: Text(
                  'Discover NFT Collection',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const SizedBox(
                width: 280,
                child: Text(
                  home_discription_text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              SlideToContinue(
                text: 'Start Exploring',
                backgroundColor: kPinkColor,
                foregroundColor: kWhiteColor,
                onConfirm: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const ExploreScreen())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SlideToContinue extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final String text;
  final Function()? onConfirm;
  const SlideToContinue({
    Key? key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.text,
    this.onConfirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ConfirmationSlider(
        onConfirmation: () => onConfirm?.call(),
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        sliderButtonContent: const Icon(Icons.arrow_forward_ios_rounded, color: kPinkColor),
        text: text,
        textStyle: const TextStyle(
          color: kWhiteColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
