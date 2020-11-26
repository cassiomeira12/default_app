import 'package:flutter/material.dart';

class AreaInputField extends StatefulWidget {
  final String labelText;
  final TextInputType inputType;

  TextAlign textAlign;
  bool obscureText;
  TextCapitalization textCapitalization;
  int maxLines;

  TextEditingController controller;
  FormFieldValidator<String> validator;
  FormFieldSetter<String> onSaved;
  ValueChanged<String> onChanged;

  AreaInputField({
    @required this.labelText,

    this.inputType = TextInputType.text,
    this.textAlign = TextAlign.center,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.words,
    this.maxLines = 2,

    this.controller,
    this.validator,
    this.onSaved,
    this.onChanged,
  });

  @override
  _AreaInputFieldState createState() => _AreaInputFieldState();
}

class _AreaInputFieldState extends State<AreaInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.inputType,
      style: Theme.of(context).textTheme.body2,
      textAlign: TextAlign.left,
      textCapitalization: widget.textCapitalization,
      maxLength: 25 * widget.maxLines,
      maxLines: widget.maxLines,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
      decoration: InputDecoration(
        labelText: widget.labelText,
        alignLabelWithHint: true,
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
