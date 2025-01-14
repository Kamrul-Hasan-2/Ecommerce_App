import 'package:flutter/material.dart';

class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    controller;
    return TextField(
      decoration: InputDecoration(
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
          fillColor: Colors.grey.shade200,
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          filled: true,
          hintText: 'Search'),
    );
  }
}
