import 'package:flutter/material.dart';
import 'package:nft/constants.dart';
import 'package:nft/widgets/appbar_images.dart';

import '../models.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPinkColor,
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverAppBar(
              pinned: true,
              expandedHeight: 250.0,
              leading: null,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Explore'),
                centerTitle: true,
                background: AppbarImages(),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 10)),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, int index) {
                  return CustomListTile(
                    collection: nftCollection[index],
                  );
                },
                childCount: nftCollection.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final NFTCollection collection;

  const CustomListTile({
    Key? key,
    required this.collection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => pushNFTScreen(context, collection),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: roundWhite,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image(
                image: AssetImage(collection.cover),
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  collection.name,
                  style: mediumTextStyle.copyWith(color: kBlackColor),
                ),
                Text(
                  collection.by,
                  style: smallTextStyle.copyWith(color: kBlackColor),
                ),
              ],
            ),
            const Spacer(),
            Text(
              '${collection.floorPrice.toString().padRight(4, '0')} ETH',
              style: mediumTextStyle.copyWith(color: kBlackColor),
            ),
          ],
        ),
      ),
    );
  }
}
