
import 'package:flutter/material.dart';
import 'package:zireh_project/core/constans/constans.dart';

class CustomCardItem extends StatelessWidget {
  const CustomCardItem({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Constants.mediumHorizontalSpacer,
            Expanded(
                child: Text(
              title,
              style: TextStyle(color: grayColor, fontSize: 15),
            )),
            Constants.smallHorizontalSpacer,
            _tagItem(),
            Constants.smallHorizontalSpacer,
          ],
        ),
      ),
    );
  }

  Widget _tagItem() {
    return Container(
      height: 40,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: oldLaceColor, borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: Text(
        'در حال بررسی',
        style: TextStyle(
            color: khakiColor, fontWeight: FontWeight.bold, fontSize: 13),
      )
      ),
    );
  }
}
