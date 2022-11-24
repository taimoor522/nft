import 'package:flutter/material.dart';
import 'package:nft/screens/nft_screen.dart';
import 'package:nft/screens/place_bid_screen.dart';

import 'Screens/explore_screen.dart';
import 'models.dart';

// colors
const kPinkColor = Color(0xFFF4B7A8);
const kWhiteColor = Color(0xFFFFFFFF);
const kBlackColor = Color(0xFF000000);
const kTransparent = Colors.transparent;

// string
const homeDiscriptionText =
    'Explore the top collection of NFTs and buy and sell your NFTs as well.';
const price = 'assets/price.png';

// data source
const List<NFTCollection> nftCollection = [
  NFTCollection(
    name: 'Hyperbeast',
    by: 'Matt Sypien',
    cover: 'assets/19.png',
    floorPrice: 0.53,
    owners: 5.6,
    items: 9.9,
    nft: [
      NFT(
        price: 0.3,
        image: 'assets/5.png',
      ),
      NFT(
        price: 0.6,
        image: 'assets/6.png',
      ),
      NFT(
        price: 0.19,
        image: 'assets/7.png',
      ),
      NFT(
        price: 0.99,
        image: 'assets/8.png',
      ),
      NFT(
        price: 0.78,
        image: 'assets/19.png',
      ),
      NFT(
        price: 0.43,
        image: 'assets/7.png',
      ),
      NFT(
        price: 0.59,
        image: 'assets/6.png',
      ),
      NFT(
        price: 0.75,
        image: 'assets/5.png',
      ),
    ],
  ),
  NFTCollection(
    name: 'Marble',
    by: 'Amanda',
    items: 2.7,
    owners: 1.3,
    cover: 'assets/4.png',
    floorPrice: 0.60,
    nft: [
      NFT(
        price: 0.31,
        image: 'assets/1.png',
      ),
      NFT(
        price: 0.62,
        image: 'assets/2.png',
      ),
      NFT(
        price: 0.13,
        image: 'assets/3.png',
      ),
      NFT(
        price: 0.94,
        image: 'assets/4.png',
      ),
      NFT(
        price: 0.75,
        image: 'assets/4.png',
      ),
      NFT(
        price: 0.46,
        image: 'assets/3.png',
      ),
      NFT(
        price: 0.57,
        image: 'assets/2.png',
      ),
      NFT(
        price: 0.78,
        image: 'assets/1.png',
      ),
    ],
  ),
  NFTCollection(
    name: 'Tarot',
    by: 'Oscar',
    cover: 'assets/13.png',
    items: 3.7,
    owners: 2.3,
    floorPrice: 0.34,
    nft: [
      NFT(
        price: 0.39,
        image: 'assets/9.png',
      ),
      NFT(
        price: 0.68,
        image: 'assets/10.png',
      ),
      NFT(
        price: 0.17,
        image: 'assets/11.png',
      ),
      NFT(
        price: 0.94,
        image: 'assets/12.png',
      ),
      NFT(
        price: 0.76,
        image: 'assets/13.png',
      ),
      NFT(
        price: 0.45,
        image: 'assets/12.png',
      ),
      NFT(
        price: 0.54,
        image: 'assets/11.png',
      ),
      NFT(
        price: 0.71,
        image: 'assets/10.png',
      ),
      NFT(
        price: 0.73,
        image: 'assets/9.png',
      ),
    ],
  ),
  NFTCollection(
    name: 'Qrystal',
    by: 'Ricky',
    cover: 'assets/15.png',
    floorPrice: 0.40,
    items: 7.7,
    owners: 8.3,
    nft: [
      NFT(
        price: 0.5,
        image: 'assets/14.png',
      ),
      NFT(
        price: 0.63,
        image: 'assets/15.png',
      ),
      NFT(
        price: 0.49,
        image: 'assets/16.png',
      ),
      NFT(
        price: 0.91,
        image: 'assets/17.png',
      ),
      NFT(
        price: 0.72,
        image: 'assets/16.png',
      ),
      NFT(
        price: 0.46,
        image: 'assets/15.png',
      ),
      NFT(
        price: 0.57,
        image: 'assets/14.png',
      ),
    ],
  ),
  NFTCollection(
    name: 'Hyperbeast 2',
    by: 'Matt Sypien',
    cover: 'assets/7.png',
    floorPrice: 0.53,
    owners: 5.6,
    items: 9.9,
    nft: [
      NFT(
        price: 0.32,
        image: 'assets/5.png',
      ),
      NFT(
        price: 0.63,
        image: 'assets/6.png',
      ),
      NFT(
        price: 0.16,
        image: 'assets/7.png',
      ),
      NFT(
        price: 0.79,
        image: 'assets/8.png',
      ),
      NFT(
        price: 0.68,
        image: 'assets/19.png',
      ),
      NFT(
        price: 0.46,
        image: 'assets/7.png',
      ),
      NFT(
        price: 0.52,
        image: 'assets/6.png',
      ),
      NFT(
        price: 0.70,
        image: 'assets/5.png',
      ),
    ],
  ),
  NFTCollection(
    name: 'Marble 2',
    by: 'Amanda',
    cover: 'assets/1.png',
    floorPrice: 0.60,
  ),
  NFTCollection(
    name: 'Tarot 2',
    by: 'Oscar',
    cover: 'assets/12.png',
    floorPrice: 0.34,
  ),
  NFTCollection(
    name: 'Qrystal 2',
    by: 'Ricky',
    cover: 'assets/16.png',
    floorPrice: 0.40,
  ),
  NFTCollection(
    name: 'Hyperbeast 3',
    by: 'Matt Sypien',
    cover: 'assets/19.png',
    floorPrice: 0.53,
    owners: 5.6,
    items: 9.9,
    nft: [
      NFT(price: 0.5, image: 'assets/5.png'),
    ],
  ),
  NFTCollection(
    name: 'Marble 3',
    by: 'Amanda',
    cover: 'assets/2.png',
    floorPrice: 0.60,
  ),
  NFTCollection(
    name: 'Tarot 3',
    by: 'Oscar',
    cover: 'assets/11.png',
    floorPrice: 0.34,
  ),
];

// functions
void pushExploreScreen(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => const ExploreScreen()));
}

void pushBidScreen(BuildContext context, NFT nft) {
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => PlaceBidScreen(nft: nft),
      transitionDuration: const Duration(seconds: 1),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
  );
}

void pushNFTScreen(BuildContext context, NFTCollection collection) {
  Navigator.push(
    context,
    PageRouteBuilder(
      transitionDuration: const Duration(seconds: 1),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        animation = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      pageBuilder: (_, __, ___) => NFTScreen(
        collection: collection,
      ),
    ),
  );
}

// styles
const bigTextStyle = TextStyle(
  fontSize: 35,
  color: kWhiteColor,
  fontWeight: FontWeight.bold,
);
const mediumTextStyle = TextStyle(
  fontSize: 20,
  color: kWhiteColor,
  fontWeight: FontWeight.bold,
);
const smallTextStyle = TextStyle(fontSize: 14, color: kWhiteColor);
final roundWhite = BoxDecoration(
  color: kWhiteColor,
  borderRadius: radius10,
);
final radius10 = BorderRadius.circular(10);
final radius100 = BorderRadius.circular(100);
final linearGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [kWhiteColor.withOpacity(0.1), kWhiteColor.withAlpha(45)],
  stops: const [0.3, 1],
);
const borderLinearGradient = LinearGradient(
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
    colors: [kWhiteColor, kWhiteColor],
    stops: [0.06, 0.95]);
