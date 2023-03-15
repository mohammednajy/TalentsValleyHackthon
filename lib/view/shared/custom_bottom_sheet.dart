import 'package:flutter/material.dart';
import 'package:talents_valley_hackthon/utils/responsive.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet(
      {super.key,
      required this.title,
      this.titleColor = Colors.black,
      required this.closable,
      required this.options,
      required this.height});
  final String title;
  final bool closable;
  final List<Widget> options;
  final Color titleColor;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          )),
      padding: const EdgeInsets.only(left: 28, right: 28, top: 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                    color: titleColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              closable
                  ? InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.close_rounded,
                        color: Colors.black,
                        size: 20,
                      ),
                    )
                  : Container()
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(
              thickness: 2,
            ),
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [...options])
        ],
      ),
    );
  }
}
