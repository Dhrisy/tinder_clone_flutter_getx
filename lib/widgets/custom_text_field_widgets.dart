import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController? editingController;
  final IconData? iconData;
  final String? assetRef;
  final String? labelText;
  final bool? isObscure;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final IconData? suffixIcon;

  const CustomTextFieldWidget(
      {Key? key,
      this.assetRef,
      this.editingController,
      this.iconData,
      this.isObscure,
      this.validator,
      this.keyboardType,
      this.suffixIcon,
      this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: editingController,
      obscureText: isObscure!,
      validator:validator,
        keyboardType: keyboardType,
      decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: iconData != null ? Icon(iconData) 
          : Padding(padding: const EdgeInsets.all(8),
          child: Image.asset(assetRef.toString()),),
          labelStyle: const TextStyle(
            fontSize: 18,
          ),
          suffixIcon: suffixIcon != null ? Icon(CupertinoIcons.eye_slash) : SizedBox.shrink(),
          
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1
            )
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1
            )
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1
            )
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1
            )
          ),
          
          ),
    );
  }
}
