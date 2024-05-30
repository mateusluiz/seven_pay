// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddressMobx on _AddressMobx, Store {
  late final _$addressListAtom =
      Atom(name: '_AddressMobx.addressList', context: context);

  @override
  List<Address> get addressList {
    _$addressListAtom.reportRead();
    return super.addressList;
  }

  @override
  set addressList(List<Address> value) {
    _$addressListAtom.reportWrite(value, super.addressList, () {
      super.addressList = value;
    });
  }

  late final _$originalAddressListAtom =
      Atom(name: '_AddressMobx.originalAddressList', context: context);

  @override
  List<Address> get originalAddressList {
    _$originalAddressListAtom.reportRead();
    return super.originalAddressList;
  }

  @override
  set originalAddressList(List<Address> value) {
    _$originalAddressListAtom.reportWrite(value, super.originalAddressList, () {
      super.originalAddressList = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_AddressMobx.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isDialogShowAtom =
      Atom(name: '_AddressMobx.isDialogShow', context: context);

  @override
  bool get isDialogShow {
    _$isDialogShowAtom.reportRead();
    return super.isDialogShow;
  }

  @override
  set isDialogShow(bool value) {
    _$isDialogShowAtom.reportWrite(value, super.isDialogShow, () {
      super.isDialogShow = value;
    });
  }

  @override
  String toString() {
    return '''
addressList: ${addressList},
originalAddressList: ${originalAddressList},
isLoading: ${isLoading},
isDialogShow: ${isDialogShow}
    ''';
  }
}
