import 'package:flutter/material.dart';
import 'package:seven_pay/module/address/data/via_cep_repository.dart';
import 'package:seven_pay/module/address/models/address_via_cep.dart';
import 'package:seven_pay/module/address/states/address_getx.dart';
import 'package:seven_pay/module/address/states/address_mobx.dart';
import 'package:seven_pay/module/address/states/address_state.dart';
import 'package:seven_pay/shared/show_snack_bar.dart';

class AddressController {
  late final AddressState addressState;

  final _viaCepRepository = ViaCepRepository();

  final controllerFu = TextEditingController();
  final controllerCity = TextEditingController();
  final controllerPublicPlace = TextEditingController();

  final controllerNeighborhoodFilter = TextEditingController();
  final controllerFuFilter = TextEditingController();

  AddressController() {
    _setTypeState();
  }

  void _setTypeState() {
    const typeState = String.fromEnvironment('TYPE_STATE');

    if (typeState.contains('getx')) {
      addressState = AddressGetx();
    } else {
      addressState = AddressMobx();
    }
  }

  Future<void> searchAddress({
    required String fu,
    required String city,
    required String publicPlace,
    required BuildContext context,
  }) async {
    try {
      addressState.isLoading = true;

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
      addressState.isLoading = false;
    }
  }

  void filterAddress({
    required String neighborhood,
    required String fu,
    required BuildContext context,
  }) async {
    addressState.isLoading = true;

    final isFilled = neighborhood.isNotEmpty || fu.isNotEmpty;

    if (isFilled) {
      final filteredAddresses =
          addressState.originalAddressList.where((address) {
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

      addressState.addressList.clear();
      addressState.addressList.addAll(filteredAddresses);
    }

    addressState.isLoading = false;
  }

  void _setAddress(List<Address> adresses) {
    addressState.addressList.clear();
    addressState.originalAddressList.clear();

    addressState.addressList.addAll(adresses);
    addressState.originalAddressList.addAll(adresses);
  }

  void clearFields() {
    controllerFu.clear();
    controllerCity.clear();
    controllerPublicPlace.clear();

    controllerNeighborhoodFilter.clear();
    controllerFuFilter.clear();
  }
}
