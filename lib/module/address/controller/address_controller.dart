import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:seven_pay/module/address/data/via_cep_repository.dart';
import 'package:seven_pay/module/address/models/address_via_cep.dart';
import 'package:seven_pay/shared/show_snack_bar.dart';

class AddressController {
  final _viaCepRepository = ViaCepRepository();
  final addressList = RxList<Address>([]);
  final originalAddressList = RxList<Address>([]);

  final isLoading = false.obs;

  final controllerFu = TextEditingController();
  final controllerCity = TextEditingController();
  final controllerPublicPlace = TextEditingController();

  final controllerNeighborhoodFilter = TextEditingController();
  final controllerFuFilter = TextEditingController();

  Future<void> searchAddress({
    required String fu,
    required String city,
    required String publicPlace,
    required BuildContext context,
  }) async {
    try {
      isLoading.value = true;

      final adresses = await _viaCepRepository.searchAddress(
        fu: fu,
        city: city,
        publicPlace: publicPlace,
      );

      _setAddress(adresses);
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

  void filterAddress({
    required String neighborhood,
    required String fu,
    required BuildContext context,
  }) async {
    isLoading.value = true;

    final isFilled = neighborhood.isNotEmpty || fu.isNotEmpty;

    if (isFilled) {
      final filteredAddresses = originalAddressList.where((address) {
        final bairro = address.bairro.toLowerCase().trim();
        final estado = address.uf.toLowerCase().trim();
        final searchNeighborhood = neighborhood.toLowerCase().trim();
        final searchFu = fu.toLowerCase().trim();

        if (searchNeighborhood.isNotEmpty) {
          return bairro.contains(searchNeighborhood);
        } else if (searchFu.isNotEmpty) {
          return estado.contains(searchFu);
        }

        return false;
      }).toList();

      addressList.clear();
      addressList.addAll(filteredAddresses);
    }

    isLoading.value = false;
  }

  void _setAddress(List<Address> adresses) {
    addressList.clear();
    originalAddressList.clear();

    addressList.addAll(adresses);
    originalAddressList.addAll(adresses);
  }
}
