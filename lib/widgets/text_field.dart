import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key, required this.password});

  final void Function(String) password;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  var isShown = false;
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void showPassword() {
    setState(() {
      isShown = !isShown;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextField(
        controller: _passwordController,
        onSubmitted: (value) {
          widget.password(value);
        },
        textAlignVertical: TextAlignVertical.center,
        obscureText: isShown ? true : false,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFFAFAFA),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          prefixIcon: IconButton(
            iconSize: 20,
            icon: const SvgIcon(
              icon: SvgIconData('assets/images/Lock.svg'),
            ),
            onPressed: () {},
          ),
          suffixIcon: IconButton(
            iconSize: 20,
            icon: const SvgIcon(
              icon: SvgIconData('assets/images/Hide.svg'),
            ),
            onPressed: showPassword,
          ),
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }
}
