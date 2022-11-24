import 'package:flutter/material.dart';

class AppbarImages extends StatelessWidget {
  const AppbarImages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(
          image: const AssetImage('assets/3.png'),
          width: MediaQuery.of(context).size.width / 4,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Image(
          image: const AssetImage('assets/7.png'),
          width: MediaQuery.of(context).size.width / 4,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Image(
          image: const AssetImage('assets/10.png'),
          width: MediaQuery.of(context).size.width / 4,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Image(
          image: const AssetImage('assets/17.png'),
          width: MediaQuery.of(context).size.width / 4,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
