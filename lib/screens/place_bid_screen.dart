import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:nft/Screens/home_screen.dart';
import 'package:nft/constants.dart';
import 'package:nft/models.dart';

class PlaceBidScreen extends StatefulWidget {
  final NFT nft;
  const PlaceBidScreen({super.key, required this.nft});

  @override
  State<PlaceBidScreen> createState() => _PlaceBidScreenState();
}

class _PlaceBidScreenState extends State<PlaceBidScreen> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 1), () {
        showModal(context);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: widget.nft.price,
        child: Container(
          padding: const EdgeInsets.all(10),
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                widget.nft.image,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 90,
              backgroundColor: Colors.transparent,
              leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 60,
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Icon(Icons.arrow_back_ios_rounded, color: kBlackColor),
                ),
              ),
              actions: [
                Container(
                  width: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: kWhiteColor, width: 2),
                    borderRadius: BorderRadius.circular(100),
                    image: const DecorationImage(
                      image: AssetImage('assets/profile.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
    );
  }

  void showModal(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      enableDrag: false,
      transitionAnimationController: AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
        reverseDuration: const Duration(seconds: 0),
      ),
      context: context,
      builder: ((context) {
        return WillPopScope(
          onWillPop: () async {
            Navigator.pop(context);
            Navigator.pop(context);
            return true;
          },
          child: ClipPath(
            clipper: MyClipper(),
            child: GlassmorphicContainer(
              width: double.infinity,
              height: 200,
              borderRadius: 0,
              blur: 10,
              alignment: Alignment.bottomCenter,
              border: 0,
              linearGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [kWhiteColor.withOpacity(0.1), kWhiteColor.withAlpha(45)],
                stops: const [0.3, 1],
              ),
              borderGradient: const LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [kWhiteColor, kWhiteColor],
                  stops: [0.06, 0.95]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text(
                    '${widget.nft.price.toString().padRight(4, '0')} ETH',
                    style: const TextStyle(
                      fontSize: 30,
                      color: kWhiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SlideToContinue(
                    text: 'Place Bid Now',
                    backgroundColor: kBlackColor,
                    foregroundColor: kWhiteColor,
                    onConfirm: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, size.height * 0.1020000);
    path0.quadraticBezierTo(size.width * -0.0060500, size.height * 0.0411000,
        size.width * 0.0986000, size.height * 0.0478000);
    path0.cubicTo(size.width * 0.1736000, size.height * 0.0478000, size.width * 0.2904000,
        size.height * 0.0430500, size.width * 0.3711000, size.height * 0.0478000);
    path0.cubicTo(size.width * 0.4030000, size.height * 0.0505500, size.width * 0.4060000,
        size.height * 0.0766500, size.width * 0.4239500, size.height * 0.0752000);
    path0.cubicTo(size.width * 0.4514500, size.height * 0.0851000, size.width * 0.5657500,
        size.height * 0.0838000, size.width * 0.5776000, size.height * 0.0754500);
    path0.cubicTo(size.width * 0.6067500, size.height * 0.0760500, size.width * 0.6075500,
        size.height * 0.0469000, size.width * 0.6329500, size.height * 0.0473500);
    path0.cubicTo(size.width * 0.7006500, size.height * 0.0464500, size.width * 0.8185500,
        size.height * 0.0484000, size.width * 0.8937500, size.height * 0.0475000);
    path0.quadraticBezierTo(
        size.width * 0.9954000, size.height * 0.0384500, size.width, size.height * 0.0978000);
    path0.lineTo(size.width, size.height);
    path0.lineTo(0, size.height);
    path0.lineTo(0, size.height * 0.1020000);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
