import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:seven_pay/module/address/controller/address_controller.dart';
import 'package:seven_pay/shared/menu/widgets/menu.dart';
import 'package:seven_pay/theme/app_theme.dart';
import 'package:seven_pay/utils/helpers.dart';

class AddressPage extends StatelessWidget {
  final controller = AddressController();

  AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!controller.addressState.isDialogShow) {
        _showDialog(
          context: context,
          controller: controller,
        );
        controller.addressState.isDialogShow = true;
      }
    });

    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 1120;

        return Menu(
          title: 'Olá João',
          description: 'SEJA BEM VINDO AO PORTAL 7PAY',
          isMobile: isMobile,
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
            isMobile
                ? _BoxSpacingHeaderMobile(controller: controller)
                : _BoxSpacingHeaderWeb(controller: controller),
            const SizedBox(height: 24),
            isMobile
                ? _BoxSpacingMobile(controller: controller)
                : _BoxSpacingWeb(controller: controller),
            if (isMobile) const SizedBox(height: 60),
          ],
        );
      }),
    );
  }
}

class _InputText extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final TextEditingController controller;
  final double inputHeight;
  final double inputWidth;

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
    this.inputWidth = 180,
    this.inputFormatters,
    this.keyboardType,
    this.validator,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: inputHeight,
      width: inputWidth,
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
  final bool isMobile;
  final double paddingSide;

  const _BoxSpacing({
    Key? key,
    required this.children,
    this.paddingHorizontal = 25,
    this.isMobile = false,
    this.paddingSide = 55,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: paddingSide,
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
              child: isMobile
                  ? Wrap(
                      runSpacing: 8,
                      children: children,
                    )
                  : Row(
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

class _BoxSpacingWeb extends StatelessWidget {
  final AddressController controller;

  const _BoxSpacingWeb({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _BoxSpacing(
      paddingHorizontal: 14,
      children: [
        Expanded(
          child: SizedBox(
            height: Helpers.getSizeScreen(context).height * 0.4,
            child: controller.addressState.observerState(
              () {
                return controller.addressState.isLoading
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
                          ...controller.addressState.addressList
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
                                        _cellText(text: address.complemento),
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
                                    controller.addressState.addressList.length -
                                        1) ...[
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
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _BoxSpacingMobile extends StatelessWidget {
  final AddressController controller;

  const _BoxSpacingMobile({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _BoxSpacing(
      paddingHorizontal: 14,
      paddingSide: 12,
      children: [
        Expanded(
          child: SizedBox(
            height: Helpers.getSizeScreen(context).height * 0.4,
            child: controller.addressState.observerState(
              () {
                return controller.addressState.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columns: [
                              DataColumn(
                                label: _titleAddress(title: 'CEP'),
                              ),
                              DataColumn(
                                label: _titleAddress(title: 'Logradouro'),
                              ),
                              DataColumn(
                                label: _titleAddress(title: 'Complemento'),
                              ),
                              DataColumn(
                                label: _titleAddress(title: 'Bairro'),
                              ),
                              DataColumn(
                                label: _titleAddress(title: 'Localidade'),
                              ),
                              DataColumn(
                                label: _titleAddress(title: 'UF'),
                              ),
                              DataColumn(
                                label: _titleAddress(title: 'IBGE'),
                              ),
                              DataColumn(
                                label: _titleAddress(title: 'Opções'),
                              ),
                            ],
                            rows: controller.addressState.addressList
                                .map(
                                  (address) => DataRow(
                                    cells: [
                                      DataCell(
                                        SizedBox(
                                          width: 100,
                                          child: Text(address.cep),
                                        ),
                                      ),
                                      DataCell(
                                        SizedBox(
                                          width: 100,
                                          child: Text(address.logradouro),
                                        ),
                                      ),
                                      DataCell(
                                        SizedBox(
                                          width: 100,
                                          child: Text(address.complemento),
                                        ),
                                      ),
                                      DataCell(
                                        SizedBox(
                                          width: 100,
                                          child: Text(address.bairro),
                                        ),
                                      ),
                                      DataCell(
                                        SizedBox(
                                          width: 100,
                                          child: Text(address.localidade),
                                        ),
                                      ),
                                      DataCell(
                                        SizedBox(
                                          width: 50,
                                          child: Text(address.uf),
                                        ),
                                      ),
                                      DataCell(
                                        SizedBox(
                                          width: 100,
                                          child: Text(address.ibge),
                                        ),
                                      ),
                                      const DataCell(
                                        SizedBox(
                                          width: 100,
                                          child: Icon(Icons.menu),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _BoxSpacingHeaderMobile extends StatelessWidget {
  final AddressController controller;

  const _BoxSpacingHeaderMobile({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _BoxSpacing(
      isMobile: true,
      paddingSide: 12,
      children: [
        Wrap(
          runSpacing: 12,
          children: [
            Row(
              children: [
                Expanded(
                  child: _InputText(
                    labelText: 'BAIRRO',
                    controller: controller.controllerNeighborhoodFilter,
                    inputWidth: Helpers.getSizeScreen(context).width,
                    onChanged: (value) {
                      controller.filterAddress(
                        neighborhood:
                            controller.controllerNeighborhoodFilter.text,
                        fu: controller.controllerFuFilter.text,
                        context: context,
                      );
                    },
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: _InputText(
                    labelText: 'UF',
                    controller: controller.controllerFuFilter,
                    inputWidth: Helpers.getSizeScreen(context).width,
                    onChanged: (value) {
                      controller.filterAddress(
                        neighborhood:
                            controller.controllerNeighborhoodFilter.text,
                        fu: controller.controllerFuFilter.text,
                        context: context,
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
        const SizedBox(width: 30),
        Wrap(
          runSpacing: 12,
          children: [
            _Button(
              text: 'FILTRAR',
              paddingHorizontal: 10,
              onTap: () {
                controller.filterAddress(
                  neighborhood: controller.controllerNeighborhoodFilter.text,
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
            Center(
              child: GestureDetector(
                onTap: () {},
                child: const Icon(Icons.download),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _BoxSpacingHeaderWeb extends StatelessWidget {
  final AddressController controller;

  const _BoxSpacingHeaderWeb({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _BoxSpacing(
      children: [
        Row(
          children: [
            _InputText(
              labelText: 'BAIRRO',
              controller: controller.controllerNeighborhoodFilter,
              onChanged: (value) {
                controller.filterAddress(
                  neighborhood: controller.controllerNeighborhoodFilter.text,
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
                  neighborhood: controller.controllerNeighborhoodFilter.text,
                  fu: controller.controllerFuFilter.text,
                  context: context,
                );
              },
            ),
            const SizedBox(width: 30),
          ],
        ),
        Row(
          children: [
            _Button(
              text: 'FILTRAR',
              onTap: () {
                controller.filterAddress(
                  neighborhood: controller.controllerNeighborhoodFilter.text,
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
            Center(
              child: GestureDetector(
                onTap: () {},
                child: const Icon(Icons.download),
              ),
            ),
          ],
        ),
      ],
    );
  }
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
