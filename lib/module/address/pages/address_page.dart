import 'package:flutter/material.dart';
import 'package:seven_pay/shared/menu/menu.dart';
import 'package:seven_pay/theme/app_theme.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addressList = [
      {
        'cep': '91420-270',
        'logradouro': 'Rua São Domingos',
        'complemento': '',
        'bairro': 'Bom Jesus',
        'localidade': 'Porto Alegre',
        'uf': 'RS',
        'ibge': '4314902',
        'gia': '',
        'ddd': '51',
        'siafi': '8801'
      },
      {
        'cep': '91040-000',
        'logradouro': 'Rua Domingos Rubbo',
        'complemento': '',
        'bairro': 'Cristo Redentor',
        'localidade': 'Porto Alegre',
        'uf': 'RS',
        'ibge': '4314902',
        'gia': '',
        'ddd': '51',
        'siafi': '8801'
      },
      {
        'cep': '91040-320',
        'logradouro': 'Rua Domingos Martins',
        'complemento': '',
        'bairro': 'Cristo Redentor',
        'localidade': 'Porto Alegre',
        'uf': 'RS',
        'ibge': '4314902',
        'gia': '',
        'ddd': '51',
        'siafi': '8801'
      },
      {
        'cep': '91120-090',
        'logradouro': 'Rua Domingos de Abreu',
        'complemento': '',
        'bairro': 'Sarandi',
        'localidade': 'Porto Alegre',
        'uf': 'RS',
        'ibge': '4314902',
        'gia': '',
        'ddd': '51',
        'siafi': '8801'
      },
      {
        'cep': '91910-450',
        'logradouro': 'Rua Domingos da Silva',
        'complemento': '',
        'bairro': 'Camaquã',
        'localidade': 'Porto Alegre',
        'uf': 'RS',
        'ibge': '4314902',
        'gia': '',
        'ddd': '51',
        'siafi': '8801'
      },
      {
        'cep': '91360-040',
        'logradouro': 'Rua Domingos Seguézio',
        'complemento': '',
        'bairro': 'Vila Ipiranga',
        'localidade': 'Porto Alegre',
        'uf': 'RS',
        'ibge': '4314902',
        'gia': '',
        'ddd': '51',
        'siafi': '8801'
      },
      {
        'cep': '91790-072',
        'logradouro': 'Rua Domingos José Poli',
        'complemento': '',
        'bairro': 'Restinga',
        'localidade': 'Porto Alegre',
        'uf': 'RS',
        'ibge': '4314902',
        'gia': '',
        'ddd': '51',
        'siafi': '8801'
      },
      {
        'cep': '91160-080',
        'logradouro': 'Rua Luiz Domingos Ramos',
        'complemento': '',
        'bairro': 'Santa Rosa de Lima',
        'localidade': 'Porto Alegre',
        'uf': 'RS',
        'ibge': '4314902',
        'gia': '',
        'ddd': '51',
        'siafi': '8801'
      },
      {
        'cep': '90650-090',
        'logradouro': 'Rua Domingos Crescêncio',
        'complemento': '',
        'bairro': 'Santana',
        'localidade': 'Porto Alegre',
        'uf': 'RS',
        'ibge': '4314902',
        'gia': '',
        'ddd': '51',
        'siafi': '8801'
      },
      {
        'cep': '91910-420',
        'logradouro': 'Rua José Domingos Varella',
        'complemento': '',
        'bairro': 'Cavalhada',
        'localidade': 'Porto Alegre',
        'uf': 'RS',
        'ibge': '4314902',
        'gia': '',
        'ddd': '51',
        'siafi': '8801'
      },
      {
        'cep': '91261-304',
        'logradouro': 'Rua Domingos Mullet Rodrigues',
        'complemento': '',
        'bairro': 'Mário Quintana',
        'localidade': 'Porto Alegre',
        'uf': 'RS',
        'ibge': '4314902',
        'gia': '',
        'ddd': '51',
        'siafi': '8801'
      },
      {
        'cep': '90420-200',
        'logradouro': 'Rua Domingos José de Almeida',
        'complemento': '',
        'bairro': 'Rio Branco',
        'localidade': 'Porto Alegre',
        'uf': 'RS',
        'ibge': '4314902',
        'gia': '',
        'ddd': '51',
        'siafi': '8801'
      },
      {
        'cep': '91790-101',
        'logradouro': 'Rua Domingos Manoel Mincarone',
        'complemento': '',
        'bairro': 'Restinga',
        'localidade': 'Porto Alegre',
        'uf': 'RS',
        'ibge': '4314902',
        'gia': '',
        'ddd': '51',
        'siafi': '8801'
      },
      {
        'cep': '91120-480',
        'logradouro': 'Rua Domingos Antônio Santoro',
        'complemento': '',
        'bairro': 'Sarandi',
        'localidade': 'Porto Alegre',
        'uf': 'RS',
        'ibge': '4314902',
        'gia': '',
        'ddd': '51',
        'siafi': '8801'
      },
      {
        'cep': '91540-650',
        'logradouro': 'Acesso Olavo Domingos de Oliveira',
        'complemento': '',
        'bairro': 'Jardim Carvalho',
        'localidade': 'Porto Alegre',
        'uf': 'RS',
        'ibge': '4314902',
        'gia': '',
        'ddd': '51',
        'siafi': '8801'
      },
      {
        'cep': '91740-650',
        'logradouro': 'Praça Domingos Fernandes de Souza',
        'complemento': '',
        'bairro': 'Cavalhada',
        'localidade': 'Porto Alegre',
        'uf': 'RS',
        'ibge': '4314902',
        'gia': '',
        'ddd': '51',
        'siafi': '8801'
      }
    ];

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
                children: const [
                  _InputText(labelText: 'BAIRRO'),
                  SizedBox(width: 30),
                  _InputText(labelText: 'UF'),
                ],
              ),
              Row(
                children: [
                  _Button(
                    text: 'FILTRAR',
                    onTap: () {},
                  ),
                  const SizedBox(width: 12),
                  _Button(
                    text: 'ATUALIZAR',
                    paddingHorizontal: 14,
                    onTap: () {},
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
                  child: ListView(
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
                              _titleAddress(title: 'Opçoes'),
                            ],
                          ),
                        ],
                      ),
                      ...addressList.asMap().entries.map((addressMap) {
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
                                    _cellText(text: address['cep']),
                                    _cellText(text: address['logradouro']),
                                    _cellText(text: address['complemento']),
                                    _cellText(text: address['bairro']),
                                    _cellText(text: address['localidade']),
                                    _cellText(text: address['uf']),
                                    _cellText(text: address['ibge']),
                                    const Icon(
                                      Icons.menu,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            if (addressIndex != addressList.length - 1) ...[
                              const Divider(
                                color: AppTheme.darkGreyOpacity,
                                thickness: 2,
                              ),
                            ],
                          ],
                        );
                      }).toList(),
                    ],
                  ),
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

  const _InputText({
    Key? key,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      width: 180,
      child: TextFormField(
        style: const TextStyle(
          fontSize: 14,
        ),
        decoration: InputDecoration(
          labelText: labelText,
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
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Icon? icon;
  final double? paddingHorizontal;

  const _Button({
    Key? key,
    required this.text,
    required this.onTap,
    this.icon,
    this.paddingHorizontal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          AppTheme.darkGrey,
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
          horizontal: paddingHorizontal ?? 30,
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
