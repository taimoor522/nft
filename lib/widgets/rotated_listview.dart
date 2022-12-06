import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nft/widgets/list_image.dart';

import '../models.dart';

class RotatedListview extends StatefulWidget {
  final List<NFT>? nft;
  const RotatedListview({super.key, required this.nft});

  @override
  State<RotatedListview> createState() => _RotatedListviewState();
}

class _RotatedListviewState extends State<RotatedListview> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    for (var element in widget.nft!) {
      debugPrint('LOG : ${element.price}');
    }
    debugPrint('\n');
    _scrollController = ScrollController(initialScrollOffset: 2);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
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
          clipBehavior: Clip.none,
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          children: widget.nft!.map((nft) {
            return ListImage(nft: nft);
          }).toList(),
        ),
      ),
    );
  }
}
