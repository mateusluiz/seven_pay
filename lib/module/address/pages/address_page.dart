import 'package:flutter/material.dart';
import 'package:seven_pay/shared/menu/menu.dart';
import 'package:seven_pay/theme/app_theme.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          const _BoxSpacing(
            children: [],
          ),
        ],
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
