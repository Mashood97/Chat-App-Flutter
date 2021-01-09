import 'package:flutter/material.dart';

class AndroidTextField extends StatelessWidget {
  final titleLabel;
  final maxLength;
  final icon;
  final controller;
  final inputType;
  final Function fieldSubmit;
  final focusnode;
  final validator;
  final inputAction;
  final readOnly;
  final maxLines;
  final obsecureText;
  final String initValues;
  final Function onSaved;
  final style;
  final textAlign;
  final Function onChanged;

  AndroidTextField(
      {this.onSaved,
      this.initValues,
      this.onChanged,
      this.textAlign = TextAlign.start,
      this.style,
      @required this.titleLabel,
      this.maxLength,
      @required this.icon,
      this.validator,
      this.readOnly = false,
      this.controller,
      @required this.inputAction,
      this.focusnode,
      this.maxLines,
      this.obsecureText = false,
      this.fieldSubmit,
      @required this.inputType});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Padding(
      padding: mediaQuery.size.width < 350 ?  const EdgeInsets.all(1.0) : const EdgeInsets.all(10.0),
      child: TextFormField(
        initialValue: initValues,
        maxLength: maxLength,
        controller: controller,
        onSaved: onSaved,
        keyboardType: inputType,
        validator: validator,
        style: style,
        obscureText: obsecureText,
        textInputAction: inputAction,
        readOnly: readOnly,
        onFieldSubmitted: fieldSubmit,
        maxLines: maxLines,
        onChanged: onChanged,
        textAlign: textAlign,
        focusNode: focusnode,
        decoration: InputDecoration(
          labelText: titleLabel,
          prefixIcon: Icon(
            icon,
            color: Theme.of(context).accentColor,
          ),
          labelStyle: Theme.of(context).textTheme.headline4.copyWith(
              fontSize: 14, fontWeight: FontWeight.w100, color: Colors.grey),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          )),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          )),
          contentPadding: EdgeInsets.only(left: 40, right: 40),
        ),
      ),
    );
  }
}
