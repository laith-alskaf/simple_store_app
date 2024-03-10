import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:LaithStore/core/data/models/all_products_model.dart';
import 'package:LaithStore/ui/shared/colors.dart';
import 'package:LaithStore/ui/shared/custom_widgets/custom_text.dart';
import 'package:LaithStore/ui/shared/extenssions/extenssions.dart';
import 'package:LaithStore/ui/shared/utils.dart';
import 'package:LaithStore/ui/views/main_view/product_details_view/product_details_view.dart';

class CustomGrid extends StatelessWidget {
  CustomGrid({super.key, required this.allProducts, required this.index});
  List<AllProductsModel> allProducts = <AllProductsModel>[];
  int index = -1;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: InkWell(
        onTap: () {
          Get.to(()=>ProductdetailsView( product: allProducts[index],));
        },
        child: Container(
          constraints: BoxConstraints(
            minHeight: screenHieght(3),
            maxWidth: screenWidth(2.2),
            minWidth: screenWidth(2.2),
            maxHeight: screenHieght(2.2),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(screenWidth(30))),
              border: Border.all(
                color: AppColors.mainBorder,
                width: screenWidth(150),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: screenWidth(5.23)),
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth(40), vertical: screenWidth(50)),
                decoration: BoxDecoration(
                    color: AppColors.mainBorder,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(screenWidth(40)),
                      topRight: Radius.circular(screenWidth(40)),
                    )),
                child: RatingBar.builder(
                  initialRating: allProducts[index].rating!.rate!.toDouble(),
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: screenWidth(25),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: AppColors.mainblue1,
                  ),
                  ignoreGestures: true,
                  onRatingUpdate: (rating) {
                    (rating);
                  },
                ),
              ),
              (screenWidth(20)).sbh,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth(30)),
                child: Center(
                    child: Image.network(
                  allProducts[index].image.toString(),
                  height: screenWidth(4),
                  fit: BoxFit.contain,
                  width: screenWidth(1),
                )),
              ),
              (screenWidth(20)).sbh,
              CustomText(
                text: allProducts[index].title.toString(),
                textcolor: AppColors.mainBlack,
                isTextAlign: TextAlign.left,
                fontsize: screenWidth(28),
                rightPadding: screenWidth(20),
                leftPadding: screenWidth(30),
                fontWeight: FontWeight.bold,
              ),
              const Spacer(),
              Row(
                children: [
                  CustomText(
                    text: ' :Price',
                    fontWeight: FontWeight.bold,
                    leftPadding: screenWidth(27),
                    textcolor: AppColors.mainblue1,
                    bottomPadding: screenWidth(20),
                    fontsize: screenWidth(24),
                  ),
                  CustomText(
                    text: allProducts[index].price.toString(),
                    textcolor: AppColors.mainBlack,
                    bottomPadding: screenWidth(20),
                    fontsize: screenWidth(24),
                    fontWeight: FontWeight.bold,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
