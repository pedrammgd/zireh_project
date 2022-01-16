import 'dart:math' as math show pi;

import 'package:flutter/material.dart';
import 'package:zireh_project/shared/widgets/lable/lable_widget.dart';

part 'controller_expandable.dart';

part 'custom_icon_expandable.dart';

typedef OnHeaderTap = Function(bool isExpand);

class CustomExpandable extends StatefulWidget {
  final int? milliseconds;
  final Duration _animationDuration;

  final Widget? headerWidget;

  final Widget? collapsedWidget;

  final Widget expandedWidget;

  final bool showHeader;

  final bool showDefaultHeaderBorder;

  final bool expandOnHeaderTapped;

  final Widget? defaultHeaderLabel;

  final Widget? defaultHeaderIcon;

  final BoxDecoration? defaultHeaderDecoration;

  final Color? defaultHeaderIconColor;

  final OnHeaderTap? onHeaderTap;

  final CustomExpandableController? controller;

  final double? headerBodySpace;

  final double splashRadius;

  final Curve? customCurve;

  final double iconSize;

  final double paddingIconStart;
  final double paddingIconEnd;
  final double paddingIconTop;
  final double paddingIconBottom;

  final bool isStackMode;

  CustomExpandable(
      {this.collapsedWidget,
      required this.expandedWidget,
      this.headerWidget,
      this.defaultHeaderLabel,
      this.defaultHeaderIcon,
      this.defaultHeaderDecoration,
      this.showHeader = true,
      this.showDefaultHeaderBorder = true,
      this.expandOnHeaderTapped = true,
      this.defaultHeaderIconColor,
      this.onHeaderTap,
      this.customCurve,
      this.controller,
      this.iconSize = 30,
      this.headerBodySpace = 0,
      this.paddingIconBottom = 0,
      this.paddingIconEnd = 0,
      this.paddingIconStart = 0,
      this.paddingIconTop = 0,
      this.milliseconds = 1000,
      this.splashRadius = 0,
      this.isStackMode = false})
      : assert(headerBodySpace != null && headerBodySpace >= 0),
        _animationDuration = Duration(milliseconds: milliseconds!);

  @override
  _CustomExpandableState createState() => _CustomExpandableState();
}

class _CustomExpandableState extends State<CustomExpandable>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _effectiveController,
      builder: (context, isExpanded, child) => widget.isStackMode
          ? Stack(
              children: [
                Column(
                  children: [
                    SizedBox(height: widget.headerBodySpace),
                    _getBody,
                  ],
                ),
                if (widget.showHeader) _getHeader,
              ],
            )
          : Column(
              children: [
                if (widget.showHeader) _getHeader,
                SizedBox(height: widget.headerBodySpace),
                _getBody,
              ],
            ),
    );
  }

  Widget get _getHeader {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.grey[50],
        borderRadius: BorderRadius.circular(widget.splashRadius),
        onTap: () {
          if (widget.expandOnHeaderTapped) _effectiveController.toggle();
          widget.onHeaderTap?.call(_effectiveController.expanded);
        },
        child: widget.headerWidget ?? _defaultHeader,
      ),
    );
  }

  Widget get _getBody {
    return AnimatedSize(
      duration: widget._animationDuration,
      reverseDuration: widget._animationDuration,
      curve: widget.customCurve ?? Curves.easeOut,
      vsync: this,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (widget.collapsedWidget != null)
            _effectiveController.expanded
                ? widget.expandedWidget
                : widget.collapsedWidget!,
          if (widget.collapsedWidget == null && _effectiveController.expanded)
            widget.expandedWidget,
        ],
      ),
    );
  }

  Widget get _defaultHeader {
    final Color _color =
        widget.defaultHeaderIconColor ?? Theme.of(context).primaryColor;

    return DecoratedBox(
      decoration: _getHeaderDecoration,
      child: CustomLabeledWidget(
        label: widget.defaultHeaderLabel,
        labelAlignment: AlignmentDirectional.centerStart,
        labelFlex: 1,
        childFlex: 0,
        child: widget.defaultHeaderIcon ?? _defaultHeaderIcon(_color),
      ),
    );
  }

  BoxDecoration get _getHeaderDecoration =>
      widget.defaultHeaderDecoration ??
      BoxDecoration(
          border: widget.showDefaultHeaderBorder
              ? const Border(
                  bottom: BorderSide(width: 0.7, color: Colors.black54))
              : null);

  Widget _defaultHeaderIcon(Color _primaryColor) => Padding(
        padding: EdgeInsetsDirectional.only(
            start: widget.paddingIconStart,
            bottom: widget.paddingIconBottom,
            top: widget.paddingIconTop,
            end: widget.paddingIconEnd),
        child: CustomExpandIcon(
          isExpanded: _effectiveController.expanded,
          color: _primaryColor,
          padding: EdgeInsets.zero,
          duration: widget._animationDuration,
          size: widget.iconSize,
        ),
      );

  final CustomExpandableController _controller =
      CustomExpandableController(false);

  CustomExpandableController get _effectiveController =>
      widget.controller ?? _controller;
}
