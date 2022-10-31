import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDialog extends StatefulWidget {
  const AppDialog({Key? key, required this.child, required this.title, this.height}) : super(key: key);

  final Widget child;
  final String title;
  final double? height;
  @override
  State<StatefulWidget> createState() => AppDialogState();
}

class AppDialogState extends State<AppDialog> with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? scaleAnimation;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 450));

    scaleAnimation = CurvedAnimation(parent: controller!, curve: Curves.fastLinearToSlowEaseIn);

    controller!.addListener(() {
      setState(() {});
    });

    controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Align(
        alignment: Alignment.topCenter,
        child: Material(
          color: Colors.transparent,
          child: ScaleTransition(
              scale: scaleAnimation!,
              child: Container(
                  height: widget.height ?? 430,
                  width: 700,
                  decoration: ShapeDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          buildHeader,
                          Divider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: widget.child,
                      ))
                    ],
                  ))),
        ),
      ),
    );
  }

  Widget get buildHeader => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            InkWell(onTap: () => Get.back(), child: Icon(Icons.clear))
          ],
        ),
      );
}
