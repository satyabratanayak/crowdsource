import 'package:crowdsource/Frontend/Global/BottomBar/BottomBarSelector/build_moving_selector.dart';
import 'package:crowdsource/Utilities/size_config.dart';
import 'package:flutter/material.dart';

class BuildMovingSelectorAnimation extends StatelessWidget {
  final AnimationController controller;
  final int selectedIndex;
  final int previousIndex;
  final Color color;
  final int itemCount;
  const BuildMovingSelectorAnimation({
    Key? key,
    required this.controller,
    required this.selectedIndex,
    required this.previousIndex,
    required this.color,
    required this.itemCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double maxElementWidth = ((deviceWidth - getWidth(60)) / 4) - getWidth(0) / itemCount;
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) => Transform.translate(
        offset: Tween<Offset>(begin: Offset(previousIndex * maxElementWidth, 0), end: Offset(selectedIndex * maxElementWidth, 0))
            .animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.0, 0.35),
              ),
            )
            .value,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Opacity(
              opacity: controller.value <= 0.45 ? 1.0 : 0.0,
              child: BuilMovingSelector(
                itemWidth: maxElementWidth,
                color: color,
                width: Tween<double>(begin: getWidth(40), end: getWidth(30))
                    .animate(
                      CurvedAnimation(
                        parent: controller,
                        curve: const Interval(0.3, 0.4),
                      ),
                    )
                    .value,
                height: Tween<double>(begin: getHeight(40), end: getHeight(30))
                    .animate(
                      CurvedAnimation(
                        parent: controller,
                        curve: const Interval(0.3, 0.45),
                      ),
                    )
                    .value,
              ),
            ),
            Opacity(
              opacity: controller.value >= 0.45 ? 1.0 : 0.0,
              child: BuilMovingSelector(
                itemWidth: maxElementWidth,
                color: color,
                width: Tween<double>(begin: getWidth(30), end: getWidth(40))
                    .animate(
                      CurvedAnimation(
                        parent: controller,
                        curve: const Interval(0.45, 0.60),
                      ),
                    )
                    .value,
                height: Tween<double>(begin: getHeight(30), end: getHeight(40))
                    .animate(
                      CurvedAnimation(
                        parent: controller,
                        curve: const Interval(0.45, 0.60),
                      ),
                    )
                    .value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
