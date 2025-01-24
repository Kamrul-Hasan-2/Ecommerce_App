import 'package:ecomerce/app/app_colors.dart';
import 'package:flutter/material.dart';

class SizePickerWidget extends StatefulWidget {
  const SizePickerWidget({super.key, required this.sizes, required this.onSizeSelected});

  final List<String> sizes;
  final Function(String) onSizeSelected;

  @override
  State<SizePickerWidget> createState() => _SizePickerWidgetState();
}

class _SizePickerWidgetState extends State<SizePickerWidget> {
  String? _selectedSize;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _getSizeItems(),
      ),
    );
  }

  List<Widget> _getSizeItems() {
    List<Widget> sizeItemWidgetList = [];
    for (String size in widget.sizes) {
      Widget item = (getSizeItemWidget(
          name: size, onTap: () {
            _selectedSize = size;
            widget.onSizeSelected(_selectedSize!);
            setState(() {});
      }, isSelected: _selectedSize == size));
      sizeItemWidgetList.add(item);
    }
    return sizeItemWidgetList;
  }

  Widget getSizeItemWidget(
      {required String name,
      required VoidCallback onTap,
      required bool isSelected}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(),
            //borderRadius: BorderRadius.circular(30),
            color: isSelected ? AppColors.themeColor : Colors.transparent),
        child: Text(name, style: TextStyle(
          color: isSelected ? Colors.white : null,
        ),),
      ),
    );
  }
}
