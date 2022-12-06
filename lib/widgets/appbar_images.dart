import 'package:flutter/material.dart';

class AppbarImages extends StatelessWidget {
  const AppbarImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        AppbarImage(image: 'assets/3.png'),
        AppbarImage(image: 'assets/7.png'),
        AppbarImage(image: 'assets/10.png'),
        AppbarImage(image: 'assets/17.png'),
      
      ],
    );
  }
}

class AppbarImage extends StatelessWidget {
  final String image;
  const AppbarImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(image),
      width: MediaQuery.of(context).size.width / 4,
      height:  double.infinity,
      fit: BoxFit.cover,
    );
  }
}
