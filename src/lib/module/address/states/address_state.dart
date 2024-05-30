import 'package:flutter/widgets.dart';
import 'package:seven_pay/module/address/models/address_via_cep.dart';

abstract class AddressState {
  List<Address> get addressList;
  set addressList(List<Address> value);

  List<Address> get originalAddressList;
  set originalAddressList(List<Address> value);

  bool get isLoading;
  set isLoading(bool value);

  bool get isDialogShow;
  set isDialogShow(bool value);

  Widget observerState(Widget Function() child);
}
