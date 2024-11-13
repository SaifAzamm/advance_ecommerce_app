import 'package:ass_ecommerce_app/core/api/dio_client.dart';
import 'package:ass_ecommerce_app/core/api/list_api.dart';
import 'package:ass_ecommerce_app/core/error/failure.dart';
import 'package:ass_ecommerce_app/features/home/data/response/get_product_response.dart';
import 'package:dartz/dartz.dart';

class HomeRepo {
  final DioClient _client = DioClient();

  ///Get Categorires
  Future<Either<Failure, List<String>>> getCategorires() async {
    final response = await _client.getRequest(
      ListAPI.getCategories,
      converter: (response) => List<String>.from(response.map((x) => x)),
    );
    return response;
  }

  ///Get Products
 Future<Either<Failure, List<GetProductResponse>>> getProducts() async {
  final response = await _client.getRequest(
    ListAPI.getProducts,
    converter: (response) {
      return List<GetProductResponse>.from(
          response.map((x) => GetProductResponse.fromJson(x)));
    },
  );
  return response;
}

}
