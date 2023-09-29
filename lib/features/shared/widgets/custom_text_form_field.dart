import 'package:flutter/material.dart';

import '../../../core/core.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    this.controller,
    this.onFieldSubmitted,
    this.focusNode,
    this.label,
    this.hint,
    this.errorMessage,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.validator,
    this.prefixIcon,
    super.key,
  });

  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  final Widget? prefixIcon;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
        borderSide: const BorderSide(color: colorBlack),
        borderRadius: BorderRadius.circular(20));

    return TextFormField(
      controller: controller,
      onTapOutside: (PointerDownEvent event) =>
          FocusScope.of(context).unfocus(),
      onChanged: onChanged,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: const TextStyle(fontSize: 16, color: Colors.black54),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        floatingLabelStyle: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        enabledBorder: border,
        focusedBorder: border,
        errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.red.shade500,
        )),
        focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.red.shade500,
        )),
        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hint,
        errorText: errorMessage,
        focusColor: colors.primary,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
