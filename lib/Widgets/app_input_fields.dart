import 'package:flutter/material.dart';

// class AppInputFields extends StatelessWidget {
//   final String label;
//   final TextEditingController controller;
//   final VoidCallback? onTap; // Add onTap as an optional parameter
//   final bool readOnly;
//
//   AppInputFields({
//     required this.label,
//     required this.controller,
//     this.onTap,
//     this.readOnly = false, // Default to false unless specified
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       readOnly: readOnly,
//       decoration: InputDecoration(
//         labelText: label,
//       ),
//       onTap: onTap, // Trigger the onTap callback when the field is tapped
//     );
//   }
// }

class AppInputFields extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final VoidCallback? onTap;
  final bool readOnly;
  final InputDecoration? decoration; // Add the decoration parameter

  AppInputFields({
    required this.label,
    required this.controller,
    this.onTap,
    this.readOnly = false,
    this.decoration, // Accept the decoration parameter
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      decoration: decoration ?? InputDecoration(labelText: label), // Use custom decoration if provided
      onTap: onTap,
    );
  }
}
