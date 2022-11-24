import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nft/models.dart';
import 'package:nft/widgets/list_image.dart';

class RotatedListview extends StatefulWidget {
  final List<NFT>? nfts;
  const RotatedListview({
    Key? key,
    required this.nfts,
  }) : super(key: key);

  @override
  State<RotatedListview> createState() => _RotatedListviewState();
}

class _RotatedListviewState extends State<RotatedListview> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(initialScrollOffset: 2);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(seconds: Random().nextInt(5) + 5),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Transform.rotate(
        angle: -0.2,
        child: ListView(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          itemExtent: 100,
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          children: widget.nfts!
              .map((nft) => ListImage(
                    nft: nft,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
