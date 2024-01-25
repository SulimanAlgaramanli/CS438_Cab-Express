import 'package:cab_express/global/assets.dart';
import 'package:cab_express/global/cab_colors.dart';
import 'package:flutter/material.dart';

class CabLogo extends StatelessWidget {
  const CabLogo({super.key,this.iconSize=55,this.borderRadiusValue = 55/2});
  final double iconSize;
  final double borderRadiusValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: iconSize,
      height: iconSize,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: CabColors.primary,
        borderRadius: BorderRadius.circular(iconSize),
      ),
      child: Image.asset(
        AppAssets.cabLogo,
        color: Colors.white,
        width: iconSize / 1.3,
        height: iconSize / 1.3,
      ),
    );
  }
}
