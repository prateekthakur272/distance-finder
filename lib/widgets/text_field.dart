import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class TextInput extends StatelessWidget {
  final String placeholder;
  final TextEditingController controller;
  final void Function(String)? onChange;
  const TextInput({Key? key, required this.placeholder, required this.controller, this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: const BorderRadius.all(Radius.circular(12))
      ),
      keyboardType: TextInputType.streetAddress,
      placeholder: placeholder,
      onChanged: onChange,
    );
  }
}
