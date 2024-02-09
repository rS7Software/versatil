import 'package:flutter/material.dart';

class DefaultTextfield extends StatelessWidget {
  String label;
  String error;
  String initialValue;
  Function(String text) onChanged;
  Icon? icon;

  DefaultTextfield({
    required this.label,
    this.error = '',
    required this.initialValue,
    required this.onChanged,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .9,
      child: TextFormField(
        initialValue: initialValue,
        onChanged: (value) => {
          onChanged(value),
        },
        decoration: InputDecoration(
          label: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),

          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: Colors.blue),
            borderRadius: BorderRadius.circular(15),
          ),
          errorText: error,
          prefixIcon: icon
        ),
        keyboardType: TextInputType.multiline,
        minLines: 1,
        maxLines: 1000000000,
      ),
    );
  }
}