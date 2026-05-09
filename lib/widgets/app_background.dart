import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/colors.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({super.key, required this.child, this.solid});

  final Widget child;
  final Color? solid;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: solid ?? AppColors.bgSoft,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (solid == null)
            Positioned.fill(
              child: SvgPicture.asset(
                'assets/pattern/airplane_box.svg',
                fit: BoxFit.none,
                repeat: ImageRepeat.repeat,
              ),
            ),
          child,
        ],
      ),
    );
  }
}
