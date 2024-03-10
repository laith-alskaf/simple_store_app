import 'package:dartz/dartz.dart';
import 'package:LaithStore/core/data/models/all_products_model.dart';
import 'package:LaithStore/core/data/models/common_response.dart';
import 'package:LaithStore/core/data/network/endpoints/category_endpoint.dart';
import 'package:LaithStore/core/data/network/network_config.dart';
import 'package:LaithStore/core/enums/request_type.dart';
import 'package:LaithStore/core/utilis/network_utilis.dart';

class GetProductsRepositories {
  static Future<Either<String, List<AllProductsModel>>> getProducts(
      {String nameCategory=''}) async {
    try {
      return NetworkUtil.sendRequest(
              type: RequestType.GET,
              url: nameCategory==''
                  ? CategoryEndpoint.allProducts
                  : CategoryEndpoint.productsByCategory+ nameCategory,
              headers: NetworkConfig.getHeaders(
                  needAuth: false, type: RequestType.GET))
          .then((respons) {
        if (respons == null) {
          return Left(respons['message']);
        } else {
          CommonResponse<dynamic> commonResponse =
              CommonResponse.fromJson(respons);
          if (commonResponse.getstatus) {
            List<AllProductsModel> resultList = [];
            commonResponse.data.forEach(
              (element) {
                resultList.add(AllProductsModel.fromJson(element));
              },
            );
            return Right(resultList);
          } else {
            (commonResponse.data.message);
            return Left(commonResponse.data['message'] ?? '');
          }
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
