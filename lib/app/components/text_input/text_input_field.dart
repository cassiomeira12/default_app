import 'package:flutter/material.dart';

class TextInputField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextInputType keyboardType;

  TextAlign textAlign;
  bool obscureText;
  TextCapitalization textCapitalization;

  TextEditingController controller;
  FormFieldValidator<String> validator;
  FormFieldSetter<String> onSaved;
  ValueChanged<String> onChanged;

  TextInputField({
    @required this.labelText,
    this.hintText,

    this.keyboardType = TextInputType.text,
    this.textAlign = TextAlign.center,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,

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
      style: Theme.of(context).textTheme.body2,
      textAlign: TextAlign.center,
      obscureText: widget.obscureText,
      textCapitalization: widget.textCapitalization,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
      decoration: InputDecoration(
        hintText: widget.hintText == null ? null : widget.hintText,
        labelText: widget.labelText,
        labelStyle: Theme.of(context).textTheme.body2,
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
          borderSide: BorderSide(color: Theme.of(context).hintColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
      ),
      controller: widget.controller,
      validator: widget.validator == null ? (value) => value.isEmpty ? "${widget.labelText} não pode ser vazio" : null : widget.validator,
      onSaved: widget.onSaved,
      onChanged: widget.onChanged,
    );
  }
}
