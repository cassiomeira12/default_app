import 'package:flutter/material.dart';

import '../../styles/font_style.dart';

class TextInputField extends StatefulWidget {
  final String labelText;
  final TextStyle fieldStyle;
  final String hintText;
  final TextInputType keyboardType;
  final bool enable;

  TextAlign textAlign;
  bool obscureText;
  TextCapitalization textCapitalization;

  TextEditingController controller;
  FormFieldValidator<String> validator;
  FormFieldSetter<String> onSaved;
  ValueChanged<String> onChanged;

  TextInputField({
    @required this.labelText,
    this.fieldStyle,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.textAlign = TextAlign.center,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    this.enable = true,
    this.controller,
    this.validator,
    this.onSaved,
    this.onChanged,
  });

  @override
  _TextInputFieldState createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      style: widget.fieldStyle ??
          fontField(
            context,
            color: widget.enable ? null : Theme.of(context).hintColor,
          ),
      textAlign: widget.textAlign,
      obscureText: widget.obscureText,
      textCapitalization: widget.textCapitalization,
      textInputAction: TextInputAction.next,
      enabled: widget.enable,
      //onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        hintStyle: widget.fieldStyle ?? fontField(context),
        labelStyle: widget.fieldStyle ?? fontField(context),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Theme.of(context).errorColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Theme.of(context).errorColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Theme.of(context).primaryColorLight),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Theme.of(context).hintColor.withOpacity(0.3),
          ),
        ),
      ),
      controller: widget.controller,
      validator: widget.validator == null
          ? (value) => value.isEmpty
              ? "${widget.labelText ?? widget.hintText} não pode ser vazio"
              : null
          : widget.validator,
      onSaved: widget.onSaved,
      onChanged: widget.onChanged,
    );
  }
}
