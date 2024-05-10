import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropdownButton1<T> extends StatelessWidget {
  final T? value;
  final List<T> items;
  final ValueChanged<T?> onChanged;
  final String hintText;
  final FormFieldValidator<T>? validator;

  const CustomDropdownButton1({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.hintText = 'Select',
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<T>(
      validator: validator,
      value: value,
      items: items.map((item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(item.toString()),
        );
      }).toList(),
      onChanged: onChanged,
      hint: Text(
        hintText,
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: Colors.purple
        ),
        iconSize: 25,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 8),
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        fillColor: const Color(0xFFF6F6F6),
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.purple, width: 2)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.purple, width: 2)),
      ),
    );
  }
}
