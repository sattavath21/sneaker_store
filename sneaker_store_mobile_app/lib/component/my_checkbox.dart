import 'package:flutter/material.dart';

class MyCheckbox extends StatefulWidget {
  const MyCheckbox({
    Key? key,
    this.width = 24,
    this.height = 24,
    this.color,
    this.iconSize,
    this.onChanged,
    this.checkColor,
  }) : super(key: key);

  final double width;
  final double height;
  final Color? color;
  // Now you can set the checkmark size of your own
  final double? iconSize;
  final Color? checkColor;
  final Function(bool?)? onChanged;

  @override
  State<MyCheckbox> createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() => isChecked = !isChecked);
        widget.onChanged?.call(isChecked);
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.color ?? Colors.grey.shade500,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: isChecked
            ? Center(
              child: Icon(
                  Icons.close,
                  size: widget.iconSize,
                  color: widget.checkColor,
                ),
            )
            : null,
      ),
    );
  }
}