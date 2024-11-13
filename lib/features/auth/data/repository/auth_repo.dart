import 'package:ass_ecommerce_app/core/api/dio_client.dart';
import 'package:ass_ecommerce_app/core/api/list_api.dart';
import 'package:ass_ecommerce_app/core/error/failure.dart';
import 'package:ass_ecommerce_app/features/auth/data/response/login_response.dart';
import 'package:dartz/dartz.dart';

class AuthRepo {
  final DioClient _client = DioClient();

  Future<Either<Failure, LoginResponse>> login(
      final String userName, final String password) async {
    final response = await _client.postRequest(
      ListAPI.login,
      data: {"username": userName, "password": password},
      converter: (response) {
        // Here, the response is expected to be a single JSON object, not a list
        final data = response as Map<String, dynamic>;
        return LoginResponse.fromJson(data);
      },
    );
    return response;
  }
}
