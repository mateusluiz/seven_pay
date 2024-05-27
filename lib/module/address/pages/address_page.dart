import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:seven_pay/module/address/controller/address_controller.dart';
import 'package:seven_pay/shared/menu/menu.dart';
import 'package:seven_pay/theme/app_theme.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = AddressController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showDialog(
        context: context,
        controller: controller,
      );
    });

    return Scaffold(
      body: Menu(
        title: 'Olá João',
        description: 'SEJA BEM VINDO AO PORTAL 7PAY',
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
              right: 20,
              top: 20,
            ),
            child: Row(
              children: const [
                Icon(
                  Icons.arrow_back_ios,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 65,
              vertical: 30,
            ),
            child: Row(
              children: const [
                Text(
                  'Endereços',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          _BoxSpacing(
            children: [
              Row(
                children: [
                  _InputText(
                    labelText: 'BAIRRO',
                    controller: controller.controllerNeighborhoodFilter,
                    onChanged: (value) {
                      controller.filterAddress(
                        neighborhood:
                            controller.controllerNeighborhoodFilter.text,
                        fu: controller.controllerFuFilter.text,
                        context: context,
                      );
                    },
                  ),
                  const SizedBox(width: 30),
                  _InputText(
                    labelText: 'UF',
                    controller: controller.controllerFuFilter,
                    onChanged: (value) {
                      controller.filterAddress(
                        neighborhood:
                            controller.controllerNeighborhoodFilter.text,
                        fu: controller.controllerFuFilter.text,
                        context: context,
                      );
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  _Button(
                    text: 'FILTRAR',
                    onTap: () {
                      controller.filterAddress(
                        neighborhood:
                            controller.controllerNeighborhoodFilter.text,
                        fu: controller.controllerFuFilter.text,
                        context: context,
                      );
                    },
                  ),
                  const SizedBox(width: 12),
                  _Button(
                    text: 'ATUALIZAR',
                    paddingHorizontal: 14,
                    onTap: () {
                      _showDialog(
                        context: context,
                        controller: controller,
                      );
                    },
                  ),
                  const SizedBox(width: 12),
                  _Button(
                    text: 'CADASTRAR',
                    paddingHorizontal: 10,
                    onTap: () {},
                    icon: const Icon(
                      Icons.add_circle,
                      size: 22,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 40),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.download),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          _BoxSpacing(
            paddingHorizontal: 14,
            children: [
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Obx(() {
                    return controller.isLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : ListView(
                            children: [
                              Table(
                                border: TableBorder.symmetric(
                                  inside: BorderSide.none,
                                  outside: BorderSide.none,
                                ),
                                columnWidths: const {
                                  0: FixedColumnWidth(100.0),
                                  1: FlexColumnWidth(),
                                  2: FlexColumnWidth(),
                                  3: FixedColumnWidth(100.0),
                                  4: FixedColumnWidth(100.0),
                                  5: FixedColumnWidth(50.0),
                                  6: FixedColumnWidth(100.0),
                                  7: FixedColumnWidth(100.0),
                                },
                                children: [
                                  TableRow(
                                    children: [
                                      _titleAddress(title: 'CEP'),
                                      _titleAddress(title: 'Logradouro'),
                                      _titleAddress(title: 'Complemento'),
                                      _titleAddress(title: 'Bairro'),
                                      _titleAddress(title: 'Localidade'),
                                      _titleAddress(title: 'UF'),
                                      _titleAddress(title: 'IBGE'),
                                      _titleAddress(title: 'Opções'),
                                    ],
                                  ),
                                ],
                              ),
                              ...controller.addressList
                                  .asMap()
                                  .entries
                                  .map((addressMap) {
                                final addressIndex = addressMap.key;
                                final address = addressMap.value;

                                return Column(
                                  children: [
                                    Table(
                                      columnWidths: const {
                                        0: FixedColumnWidth(100.0),
                                        1: FlexColumnWidth(),
                                        2: FlexColumnWidth(),
                                        3: FixedColumnWidth(100.0),
                                        4: FixedColumnWidth(100.0),
                                        5: FixedColumnWidth(50.0),
                                        6: FixedColumnWidth(100.0),
                                        7: FixedColumnWidth(100.0),
                                      },
                                      children: [
                                        TableRow(
                                          children: [
                                            _cellText(text: address.cep),
                                            _cellText(text: address.logradouro),
                                            _cellText(
                                                text: address.complemento),
                                            _cellText(text: address.bairro),
                                            _cellText(text: address.localidade),
                                            _cellText(text: address.uf),
                                            _cellText(text: address.ibge),
                                            const Icon(
                                              Icons.menu,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    if (addressIndex !=
                                        controller.addressList.length - 1) ...[
                                      const Divider(
                                        color: AppTheme.darkGreyOpacity,
                                        thickness: 2,
                                      ),
                                    ],
                                  ],
                                );
                              }).toList(),
                            ],
                          );
                  }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _titleAddress({
    required String title,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _cellText({
    required String? text,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text ?? '',
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _InputText extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final TextEditingController controller;
  final double inputHeight;

  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String) onChanged;

  const _InputText({
    Key? key,
    required this.labelText,
    this.hintText,
    required this.controller,
    this.inputHeight = 28,
    this.inputFormatters,
    this.keyboardType,
    this.validator,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: inputHeight,
      width: 180,
      child: TextFormField(
        controller: controller,
        inputFormatters: inputFormatters,
        validator: validator,
        onChanged: onChanged,
        keyboardType: keyboardType,
        style: const TextStyle(
          fontSize: 14,
        ),
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          labelStyle: const TextStyle(
            fontSize: 12,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 1.2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 1.2,
            ),
          ),
          errorStyle: const TextStyle(
            fontSize: 10,
            color: Colors.red,
            height: 1.5,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Icon? icon;
  final double paddingHorizontal;
  final Color backgroundColor;

  const _Button({
    Key? key,
    required this.text,
    required this.onTap,
    this.icon,
    this.paddingHorizontal = 30,
    this.backgroundColor = AppTheme.darkGrey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          backgroundColor,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.zero,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal,
        ),
        child: SizedBox(
          height: 32,
          child: Row(
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
              if (icon != null) ...[
                const SizedBox(width: 10),
                icon!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _BoxSpacing extends StatelessWidget {
  final double paddingHorizontal;
  final List<Widget> children;

  const _BoxSpacing({
    Key? key,
    required this.children,
    this.paddingHorizontal = 25,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 55,
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 1),
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.1),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: paddingHorizontal,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: children,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _showDialog({
  required BuildContext context,
  required AddressController controller,
}) {
  final formKey = GlobalKey<FormState>();

  final RegExp regexLettersAccent = RegExp(r'[a-zA-ZáàâãéèêẽíìîĩóòôõúùûũçÇ]');
  final Map<String, RegExp> filter = {'#': regexLettersAccent};

  const double inputHeight = 60;

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Center(
          child: Text(
            'Encontre um endereço',
          ),
        ),
        content: SizedBox(
          height: 200,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _InputText(
                        labelText: 'UF',
                        hintText: 'GO',
                        controller: controller.controllerFu,
                        keyboardType: TextInputType.text,
                        inputHeight: inputHeight,
                        inputFormatters: [
                          MaskTextInputFormatter(
                            mask: '##',
                            filter: filter,
                          ),
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'UF é obrigatório';
                          }

                          return null;
                        },
                        onChanged: (_) {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: _InputText(
                        labelText: 'Cidade',
                        hintText: 'Goiânia',
                        controller: controller.controllerCity,
                        keyboardType: TextInputType.text,
                        inputHeight: inputHeight,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            regexLettersAccent,
                          ),
                          LengthLimitingTextInputFormatter(30),
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Cidade é obrigatório';
                          }

                          return null;
                        },
                        onChanged: (_) {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: _InputText(
                        labelText: 'Logradouro',
                        controller: controller.controllerPublicPlace,
                        hintText: 'Domingos',
                        keyboardType: TextInputType.text,
                        inputHeight: inputHeight,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            regexLettersAccent,
                          ),
                          LengthLimitingTextInputFormatter(30),
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Logradouro é obrigatório';
                          } else if (value.length <= 2) {
                            return 'Deve ter pelo menos 3 caracteres';
                          }

                          return null;
                        },
                        onChanged: (_) {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: _Button(
                  text: 'Fechar',
                  paddingHorizontal: 40,
                  backgroundColor: Colors.redAccent.shade100,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: _Button(
                  text: 'Buscar',
                  paddingHorizontal: 40,
                  onTap: () async {
                    if (formKey.currentState?.validate() ?? false) {
                      Navigator.of(context).pop();

                      await controller.searchAddress(
                        fu: controller.controllerFu.text,
                        city: controller.controllerCity.text,
                        publicPlace: controller.controllerPublicPlace.text,
                        context: context,
                      );

                      controller.clearFields();
                    }
                  },
                ),
              ),
            ],
          )
        ],
      );
    },
  );
}
