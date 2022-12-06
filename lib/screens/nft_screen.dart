import 'package:flutter/material.dart';
import 'package:nft/constants.dart';
import 'package:nft/models.dart';
import 'package:nft/widgets/nft_card_widget.dart';
import 'package:nft/widgets/small_container.dart';

import '../widgets/filter_widget.dart';

class NFTScreen extends StatelessWidget {
  final NFTCollection collection;
  const NFTScreen({super.key, required this.collection});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      style: bigTextStyle,
                    ),
                    Text(
                      collection.by,
                      style: mediumTextStyle,
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
                                collection.floorPrice.toString(),
                                style: bigTextStyle,
                              ),
                              const Text(
                                'Floor Proce',
                                style: smallTextStyle,
                              )
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            SmallContainer(
                              title: collection.owners.toString(),
                              subtitle: 'Owners',
                              backgroundColor: kWhiteColor.withOpacity(0.5),
                              foregroundColor: kBlackColor,
                            ),
                            SmallContainer(
                              title: collection.owners.toString(),
                              subtitle: 'Owners',
                              backgroundColor: kWhiteColor.withOpacity(0.5),
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
                        itemCount: (collection.nft!.length / 2).ceil(),
                        itemBuilder: (_, index) {
                          return NFTCardWidget(nft: collection.nft![index]);
                        },
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const FilterWidget(),
                          Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: (collection.nft!.length / 2).ceil(),
                              itemBuilder: (_, index) {
                                index += (collection.nft!.length / 2).floor();
                                return NFTCardWidget(nft: collection.nft![index]);
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
