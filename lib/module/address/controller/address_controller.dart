import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:seven_pay/module/address/data/via_cep_repository.dart';
import 'package:seven_pay/module/address/models/address_via_cep.dart';
import 'package:seven_pay/shared/show_snack_bar.dart';

class AddressController {
  final _viaCepRepository = ViaCepRepository();
  final addressList = RxList<Address>([]);

  final isLoading = false.obs;

  final textControllerCity = TextEditingController();
  final textControllerFu = TextEditingController();

  Future<void> searchAddress({
    required String fu,
    required String city,
    required String publicPlace,
    required BuildContext context,
  }) async {
    try {
      isLoading.value = true;

      addressList.clear();

      final adresses = await _viaCepRepository.searchAddress(
        fu: fu,
        city: city,
        publicPlace: _isValidCharacter(publicPlace),
      );

      addressList.addAll(adresses);
    } catch (e) {
      showSnackBar(
        context: context,
        text: 'Ocorreu um erro ao buscar o endereço',
        backgroundColor: Colors.red,
      );
    } finally {
      isLoading.value = false;
    }
  }

  String _isValidCharacter(String value) {
    return value.length > 3 ? value : '    ';
  }
}
