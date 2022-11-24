import 'package:flutter/material.dart';
import 'package:nft/constants.dart';
import 'package:nft/models.dart';

import '../widgets/filter_widget.dart';
import '../widgets/nft_card.dart';
import '../widgets/small_container.dart';

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
                    style: bigTextStyle.copyWith(color: kWhiteColor),
                  ),
                  Text(
                    collection.by,
                    style: mediumTextStyle.copyWith(color: kWhiteColor),
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
                          borderRadius: radius10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: kWhiteColor.withOpacity(0.4),
                                borderRadius: radius10,
                              ),
                              child: const Image(
                                image: AssetImage(price),
                              ),
                            ),
                            Text(
                              collection.floorPrice.toString().padRight(4, '0'),
                              style: bigTextStyle,
                            ),
                            const Text(
                              'Floor Price',
                              style: smallTextStyle,
                            )
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SmallContainer(
                            title: collection.owners.toString(),
                            subTitle: 'Owners',
                            backgroundColor: kWhiteColor.withOpacity(0.5),
                            foregroundColor: kBlackColor,
                          ),
                          SmallContainer(
                            title: collection.items.toString(),
                            subTitle: 'Items',
                            backgroundColor: kWhiteColor,
                            foregroundColor: kBlackColor,
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
                        const FilterWidget(),
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
