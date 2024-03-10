import 'package:dartz/dartz.dart';
import 'package:LaithStore/core/data/models/common_response.dart';
import 'package:LaithStore/core/data/network/endpoints/category_endpoint.dart';
import 'package:LaithStore/core/data/network/network_config.dart';
import 'package:LaithStore/core/enums/request_type.dart';
import 'package:LaithStore/core/utilis/network_utilis.dart';

class AllCategoryRepositories {
  static Future<Either<String, List<String>>> allCategory() async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.GET,
          url: CategoryEndpoint.allCategories,
          headers: NetworkConfig.getHeaders(
              needAuth: false, type: RequestType.GET))
          .then((respons) {
        if (respons == null) {
          return Left(respons['message']);
        } else {
          CommonResponse<dynamic> commonResponse =
          CommonResponse.fromJson(respons);
          if (commonResponse.getstatus) {
            List<String> dataCat=<String>[];
            for ( String r in commonResponse.data){
              dataCat.add(r);
            }
            return Right(dataCat);
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
