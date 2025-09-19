import 'package:flutter/material.dart';

class form
{
  InputDecoration inputDecoration(String label, IconData icon,BuildContext context,{String? prefixText}) =>
      InputDecoration(
        labelText: label.isNotEmpty ? label : null,
        suffixIcon: Icon(icon), // inside the box, left side
        prefixText: prefixText, // e.g. "+91 "
        prefixStyle: const TextStyle(fontWeight: FontWeight.bold),
        filled: true,
        fillColor: Theme.of(context).inputDecorationTheme.fillColor ??
            Theme.of(context).cardColor,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Theme.of(context).dividerColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary, width: 2),
        ),
      );
  Widget buildTextField(
      TextEditingController controller,
      String label,
      BuildContext context,
      IconData icon, {
        TextInputType type = TextInputType.text,
        String? prefixText,
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        decoration: inputDecoration(label, icon,context , prefixText: prefixText),
        validator: (val) => val == null || val.isEmpty ? "Required" : null,
      ),
    );
  }
}