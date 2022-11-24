import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:nft/constants.dart';
import 'package:nft/models.dart';
import 'package:nft/screens/place_bid_screen.dart';

class NFTScreen extends StatelessWidget {
  final NFTCollection collection;
  const NFTScreen({super.key, required this.collection});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 300,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(collection.cover),
                fit: BoxFit.cover,
                alignment: Alignment.centerRight,
              ),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    collection.name,
                    style: const TextStyle(
                      color: kWhiteColor,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    collection.by,
                    style: const TextStyle(
                      color: kWhiteColor,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 100,
                        height: 120,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: kBlackColor.withOpacity(0.6),
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: kWhiteColor.withOpacity(0.4),
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: const Image(
                                image: AssetImage('assets/price.png'),
                              ),
                            ),
                            Text(
                              collection.floorPrice.toString().padRight(4, '0'),
                              style: const TextStyle(
                                color: kWhiteColor,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'Floor Price',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 75,
                            height: 75,
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: kWhiteColor.withOpacity(0.3),
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${collection.owners}k',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  'Owners',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 75,
                            height: 75,
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: kWhiteColor,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${collection.items}k',
                                  style: const TextStyle(
                                    color: kBlackColor,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Items',
                                  style: TextStyle(
                                    color: kBlackColor.withOpacity(0.5),
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return NFTCardWidget(nft: collection.nft![index]);
                      },
                      itemCount: (collection.nft!.length / 2).floor(),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 150,
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: const BoxDecoration(
                            color: kBlackColor,
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Spacer(),
                              const Text(
                                'Filter',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
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
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              index += (collection.nft!.length / 2).floor();
                              return NFTCardWidget(nft: collection.nft![index]);
                            },
                            itemCount: (collection.nft!.length / 2).ceil(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NFTCardWidget extends StatelessWidget {
  const NFTCardWidget({
    Key? key,
    required this.nft,
  }) : super(key: key);

  final NFT nft;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
      },
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
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: GlassmorphicContainer(
              width: double.infinity,
              height: 40,
              borderRadius: 20,
              border: 0,
              blur: 5,
              linearGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [kWhiteColor.withOpacity(0.1), kWhiteColor.withAlpha(45)],
                stops: const [0.3, 1],
              ),
              borderGradient: const LinearGradient(colors: [
                kWhiteColor,
                kWhiteColor,
              ]),
              child: Center(
                child: Text(
                  '${nft.price.toString().padRight(4, '0')} ETH',
                  style: const TextStyle(
                    color: kWhiteColor,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
