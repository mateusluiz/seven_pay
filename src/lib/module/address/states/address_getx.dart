import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:seven_pay/module/address/models/address_via_cep.dart';
import 'package:seven_pay/module/address/states/address_state.dart';

class AddressGetx extends AddressState {
  final RxList<Address> _addressList = RxList<Address>([]);
  final RxList<Address> _originalAddressList = RxList<Address>([]);
  final RxBool _isLoading = false.obs;
  final RxBool _isDialogShow = false.obs;

  @override
  List<Address> get addressList => _addressList;

  @override
  set addressList(List<Address> value) => _addressList.assignAll(value);

  @override
  List<Address> get originalAddressList => _originalAddressList;

  @override
  set originalAddressList(List<Address> value) =>
      _originalAddressList.assignAll(value);

  @override
  bool get isLoading => _isLoading.value;

  @override
  set isLoading(bool value) => _isLoading.value = value;

  @override
  bool get isDialogShow => _isDialogShow.value;

  @override
  set isDialogShow(bool value) => _isDialogShow.value = value;

  @override
  Widget observerState(Widget Function() child) {
    return Obx(child);
  }
}
