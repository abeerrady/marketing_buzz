import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  Function onSubmit,
  Function onChange,
  bool isPassword = false,
  @required Function validate,
  @required String hint,
  IconData suffix,
  Function suffixPressed,
  @required String label,
  @required IconData prefix,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: type,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      validator: validate,
      enabled: isClickable,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        hintText: hint,
        fillColor: Colors.grey[200],
        hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
        suffixIcon: suffix != null
            ? IconButton(
            onPressed: suffixPressed,
            icon: Icon(
              suffix,
              color: Colors.grey,
            ))
            : null,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
      ),
    );