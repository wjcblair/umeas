// import 'package:flutter/material.dart';

// class AuthTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final TextInputType keyboardType;
//   final String hintText;
//   final Widget prefixIcon;
//   final bool obscureText;
//   final bool enableSuggestions;
//   final bool autocorrect;
//   final String? Function(String?) validator;
//   final ValueChanged<String>? onChanged;
//   final ValueNotifier<bool> isValid;
//   final bool enableInteractiveSelection;

//   const AuthTextField({
//     Key? key,
//     required this.controller,
//     required this.keyboardType,
//     required this.hintText,
//     required this.obscureText,
//     this.enableSuggestions = false,
//     this.autocorrect = false,
//     required this.prefixIcon,
//     required this.validator,
//     required this.onChanged,
//     required this.isValid,
//     required this.enableInteractiveSelection,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       controller: controller,
//       keyboardType: keyboardType,
//       decoration: InputDecoration(
//           filled: true,
//           fillColor: Colors.white,
//           border: const OutlineInputBorder(),
//           hintText: hintText,
//           prefixIcon: prefixIcon,
//           labelStyle: const TextStyle(fontSize: 13.0)),
//       obscureText: obscureText,
//       enableSuggestions: enableSuggestions,
//       autocorrect: autocorrect,
//       validator: validator,
//       onChanged: onChanged,
//       enableInteractiveSelection: enableInteractiveSelection,
//     );
//   }
// }
