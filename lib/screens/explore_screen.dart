import 'package:flutter/material.dart';
import 'package:nft/constants.dart';
import 'package:nft/widgets/custom_list_litle.dart';

import '../widgets/appbar_images.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPinkColor,
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              pinned: true,
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Explore'),
                centerTitle: true,
                background: AppbarImages(),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 10)),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, index) {
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
