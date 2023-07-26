import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool loading;
  final bool active;
  final String text;
  final bool custom;
  final double? textSize;
  final Color? textColor;
  final double width;
  final double height;
  final double radius;
  final Color? color;

  const DefaultButton({
    Key? key,
    required this.text,
    this.textSize,
    this.textColor,
    this.loading = false,
    this.radius = 35,
    this.active = true,
    this.width = double.infinity,
    this.height = 50,
    required this.onTap,
    this.color,
    this.custom = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        child: ElevatedButton(
          onPressed: active ? onTap : null,
          style: ButtonStyle(
            // elevation:
            //     elevation != null ? MaterialStateProperty.all(elevation) : null,
            // shape: isOutlined
            //     ? MaterialStateProperty.all(
            //         RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(5),
            //           side: BorderSide(
            //             width: 2,
            //             color: color ?? AppColors.primary,
            //           ),
            //         ),
            //       )
            //     : null,
            backgroundColor: MaterialStateProperty.all(
              loading
                  ? (color ?? AppColors.loadingColor)
                  : active
                      ? (color ?? AppColors.primary)
                      : (color ?? const Color(0XFFADADAD)),
            ),
          ),
          child: Center(
            child: loading
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'loading'.tr,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.titleLarge!.copyWith(
                          fontSize: 18,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Center(
                        child: CupertinoActivityIndicator(
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ],
                  )
                : custom
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // SvgPicture.asset(
                          //   Asset.images.svgs.newAd,
                          // ),
                          // const SizedBox(
                          //   width: 8,
                          // ),
                          Text(
                            text,
                            style: context.textTheme.titleLarge!.copyWith(
                              color: AppColors.whiteColor,
                              fontSize: textSize ?? 24,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    : Text(
                        text,
                        style: context.textTheme.titleLarge!.copyWith(
                          color: textColor ?? AppColors.whiteColor,
                          fontSize: textSize ?? 20,
                          // fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
          ),
        ),
      ),
    );
  }
}
