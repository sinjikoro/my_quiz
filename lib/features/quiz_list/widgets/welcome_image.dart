import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/img/un.svg');
  }
}