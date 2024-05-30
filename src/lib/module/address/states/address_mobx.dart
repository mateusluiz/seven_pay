import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:seven_pay/module/address/models/address_via_cep.dart';
import 'package:seven_pay/module/address/states/address_state.dart';

part 'address_mobx.g.dart';

class AddressMobx = _AddressMobx with _$AddressMobx;

abstract class _AddressMobx extends AddressState with Store {
  @override
  @observable
  List<Address> addressList = [];

  @override
  @observable
  List<Address> originalAddressList = [];

  @override
  @observable
  bool isLoading = false;

  @override
  @observable
  bool isDialogShow = false;

  @override
  @override
  Widget observerState(Widget Function() child) {
    return Observer(
      builder: (context) {
        return child();
      },
    );
  }
}
