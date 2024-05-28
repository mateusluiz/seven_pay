import 'dart:developer' as dev;

import 'package:dio/dio.dart';
import 'package:seven_pay/module/address/models/address_via_cep.dart';

class ViaCepRepository {
  late final Dio _dio;
  late final String _baseUrl;

  ViaCepRepository() {
    _dio = Dio();
    _baseUrl = 'https://viacep.com.br/ws';
  }

  Future<List<Address>> searchAddress({
    required String fu,
    required String city,
    required String publicPlace,
  }) async {
    try {
      final String url = '$_baseUrl/$fu/$city/$publicPlace/json';

      Response response = await _dio.get(url);

      if (response.statusCode == 200) {
        return (response.data as List)
            .map(
              (address) => Address.fromJson(address),
            )
            .toList();
      } else {
        throw Exception(
          'Error in searchAddress (status code: ${response.statusCode})',
        );
      }
    } catch (e) {
      dev.log('Error in searchAddress: ${e.toString()}');

      rethrow;
    }
  }
}
