import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BuildTextFormFieldWidget extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final VoidCallback? onPressed;
  final InputDecoration? decoration;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? style;
  final int? maxLines;

  const BuildTextFormFieldWidget({
    super.key,
    this.hintText,
    this.controller,
    this.onPressed,
    this.decoration,
    this.inputFormatters,
    this.style,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters: inputFormatters,
      textCapitalization: TextCapitalization.words,
      decoration: decoration,
      style: style,
      maxLines: maxLines,
    );
  }
}