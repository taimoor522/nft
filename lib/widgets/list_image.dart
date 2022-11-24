import 'package:flutter/material.dart';
import 'package:nft/screens/place_bid_screen.dart';

import '../models.dart';

class ListImage extends StatelessWidget {
  final NFT nft;
  const ListImage({super.key, required this.nft});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlaceBidScreen(nft: nft),
          ),
        );
      },
      child: Hero(
        tag: nft.price,
        child: Container(
          width: 100,
          height: 100,
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(nft.image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
