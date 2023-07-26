import 'package:flutter/material.dart';

const int largeLayoutSize = 1366;
const int mediumLayoutSize = 768;
const int smallLayoutSize = 360;
const int customLayoutSize = 1100;

class ResponsiveLayout extends StatelessWidget {
  final Widget? largeLayout;
  final Widget? mediumLayout;
  final Widget? smallLayout;
  final Widget? customLayout;
  final bool? isDesktop;

  const ResponsiveLayout({
    Key? key,
    this.largeLayout,
    this.mediumLayout,
    this.smallLayout,
    this.customLayout,
    this.isDesktop,
  }) : super(key: key);

  static bool isSmallLayout(BuildContext context) {
    return MediaQuery.of(context).size.width < mediumLayoutSize;
  }

  static bool isMediumLayout(BuildContext context) {
    return MediaQuery.of(context).size.width >= mediumLayoutSize &&
        MediaQuery.of(context).size.width < largeLayoutSize;
  }

  static bool isLargeLayout(BuildContext context) {
    return MediaQuery.of(context).size.width > largeLayoutSize;
  }

  static bool isCustomSize(BuildContext context) {
    return MediaQuery.of(context).size.width <= customLayoutSize &&
        MediaQuery.of(context).size.width >= mediumLayoutSize;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (isDesktop != null && isDesktop == false) {
          return smallLayout!;
        }
        if (constraints.maxWidth >= largeLayoutSize || (isDesktop ?? false)) {
          return largeLayout ?? smallLayout!;
        } else if (constraints.maxWidth < largeLayoutSize &&
                constraints.maxWidth >= mediumLayoutSize ||
            (isDesktop ?? false)) {
          return mediumLayout ?? largeLayout!;
        } else {
          return smallLayout ?? largeLayout!;
        }
      },
    );
  }
}
