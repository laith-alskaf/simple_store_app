import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_challenge/core/enums/bottom_navigation.dart';
import '../../../shared/colors.dart';
import '../../../shared/utils.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({
    super.key,
    required this.bottomNavigationEnum,
    required this.onTap,
  });

  final BottomNavigationEnum bottomNavigationEnum;
  final Function(BottomNavigationEnum, int) onTap;

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: width,
          height: screenHieght(15),
          alignment: Alignment.bottomCenter,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: width * 0.025,
              horizontal: width * 0.15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                navItem(
                  imageName: 'products',
                  isSelected: widget.bottomNavigationEnum ==
                      BottomNavigationEnum.ALLPROUDUCTS,
                  onTap: () {
                    widget.onTap(BottomNavigationEnum.ALLPROUDUCTS, 0);
                  },
                ),
                navItem(
                  imageName: 'home',
                  isSelected: widget.bottomNavigationEnum ==
                      BottomNavigationEnum.HOMEVIEW,
                  onTap: () {
                    widget.onTap(BottomNavigationEnum.HOMEVIEW, 1);
                  },
                ),
                navItem(
                  imageName: 'cart',
                  isSelected: widget.bottomNavigationEnum ==
                      BottomNavigationEnum.CARTVIEW,
                  onTap: () {
                    widget.onTap(BottomNavigationEnum.CARTVIEW, 2);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget navItem({
    required String imageName,
    required bool isSelected,
    required Function onTap,
  }) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          SizedBox(
            width: width * 0.1,
            height: height * 0.042,
            child: SvgPicture.asset(
              'assets/images/$imageName.svg',
              color:isSelected?AppColors.mainblue1: AppColors.mainBlack,
              width:screenWidth(1),
            ),
          ),
        ],
      ),
    );
  }
}
