part of 'custom_expandable.dart';


class CustomExpandableController extends ValueNotifier<bool> {
  CustomExpandableController(bool expanded) : super(expanded);

  bool get expanded => value;

  set expanded(bool newValue) => value = newValue;

  @override
  set value(bool newValue) => super.value = newValue;

  void toggle() => value = !value;
}
