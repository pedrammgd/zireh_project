import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zireh_project/core/constans/constans.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validatorTextField;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? labelText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;
  final int? maxLines;
  final TextInputAction? textInputAction;
  final double paddingAll;
  final double contentPadding;
  final double? width;
  final double? height;
  final int? maxLength;
  final Function()? onTap;
  final bool hasPrefixIcon;
  final bool showCursor;
  final bool readOnly;
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  final Color fillColor;
  final bool hasBorder;
  final bool? alignLabelWithHint;
  final TextAlignVertical? textAlignVertical;
  final Color borderColor;
  final double borderRadius;
  final String? hintText;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final String? suffixText;

  const CustomTextFormField({
    this.controller,
    this.validatorTextField,
    this.prefixIcon = const Icon(Icons.person_outline),
    this.labelText = '',
    this.inputFormatters = const [],
    this.textInputType,
    this.maxLines,
    this.textInputAction,
    this.width,
    this.contentPadding = 20,
    this.paddingAll = 9,
    this.maxLength,
    this.onTap,
    this.hasPrefixIcon = false,
    this.showCursor = true,
    this.readOnly = false,
    this.onChanged,
    this.focusNode,
    this.fillColor = Colors.white,
    this.hasBorder = true,
    this.alignLabelWithHint,
    this.textAlignVertical,
    this.height,
    this.borderColor = Colors.grey,
    this.suffixIcon,
    this.borderRadius = 10,
    this.hintText,
    this.floatingLabelBehavior,
    this.suffixText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(paddingAll),
      child: SizedBox(
        width: width,
        height: height,
        child: TextFormField(
            onTap: onTap,
            textAlignVertical: textAlignVertical,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.end,
            focusNode: focusNode,
            onChanged: onChanged,
            controller: controller,
            validator: validatorTextField,
            keyboardType: textInputType,
            inputFormatters: inputFormatters,
            textInputAction: textInputAction,
            maxLength: maxLength,
            maxLines: maxLines,
            showCursor: showCursor,
            readOnly: readOnly,
            decoration: InputDecoration(
                hintText: hintText,
                floatingLabelBehavior: floatingLabelBehavior,
                hintStyle:  TextStyle(fontSize: 12, color: lightGrayColor),
                hintTextDirection: TextDirection.ltr,
                suffixIconConstraints: const BoxConstraints(
                  minHeight: 24,
                  minWidth: 24,
                ),
                alignLabelWithHint: alignLabelWithHint,
                contentPadding: EdgeInsets.all(contentPadding),
                filled: true,
                suffixIcon: suffixIcon,
                suffixText: suffixText,
                suffixStyle:  TextStyle(color: lightGrayColor),
                fillColor: fillColor,
                prefixIcon:
                    hasPrefixIcon ? prefixIcon : const SizedBox.shrink(),
                prefixIconConstraints: BoxConstraints(
                    minWidth: hasPrefixIcon ? 48 : 20,
                    minHeight: hasPrefixIcon ? 48 : 0),
                labelText: labelText,
                labelStyle:  TextStyle(fontSize: 18,color: lightGrayColor),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.5,
                    color: hasBorder ? borderLavenderColor : Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: BorderSide(
                    width: 1.5,
                    color: hasBorder ? borderLavenderColor : Colors.transparent,
                  ),
                ))),
      ),
    );
  }
}
