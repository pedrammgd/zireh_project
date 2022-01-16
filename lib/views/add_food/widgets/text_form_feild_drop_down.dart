import 'package:flutter/material.dart';
import 'package:zireh_project/core/constans/constans.dart';
import 'package:zireh_project/shared/widgets/custom_text_form_field.dart';
import 'package:zireh_project/shared/widgets/expandable/custom_expandable.dart';
//ignore: must_be_immutable
class TextFormFieldDropDown extends StatefulWidget {
   TextFormFieldDropDown(
      {required this.expandableController,
      required this.labelTextField,
      required this.expandedWidget, this.controller,required this.isExpand});

  final CustomExpandableController expandableController;
  final String labelTextField;
  final Widget expandedWidget;
  final TextEditingController? controller;
   bool isExpand;


  @override
  State<TextFormFieldDropDown> createState() => _TextFormFieldDropDownState();
}

class _TextFormFieldDropDownState extends State<TextFormFieldDropDown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: CustomExpandable(
        splashRadius: 20,
        headerBodySpace: 1,
        iconSize: 29,
        controller: widget.expandableController,
        paddingIconTop: 5,
        customCurve: Curves.easeInBack,
        milliseconds: 500,
        defaultHeaderIconColor: Colors.black,
        headerWidget: CustomTextFormField(
          controller: widget.controller,
          labelText: widget.labelTextField,
          readOnly: true,
          suffixIcon: InkWell(
            onTap: () {
              // setState(() {
                widget.expandableController.toggle();

                widget.isExpand = ! widget.isExpand;
              // });
            },
            child: CustomExpandIcon(
              isExpanded: widget.isExpand,
              color: pinkColor,
              padding: const EdgeInsets.only(top: 5, left: 8),
              size: 34,
            ),
          ),
        ),
        defaultHeaderDecoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.1),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 8), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadiusDirectional.circular(20),
        ),
        expandedWidget: widget.expandedWidget,
      ),
    );
  }
}
