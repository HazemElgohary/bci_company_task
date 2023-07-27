import 'package:bci_company_task/app/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaginationItem extends StatelessWidget {
  final int page;
  final int last;
  final VoidCallback onBack;
  final VoidCallback onProgress;

  const PaginationItem(
      {Key? key,
      required this.page,
      required this.onBack,
      required this.onProgress,
      required this.last})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: page > 1 ? onBack : null,
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        CircleAvatar(
          radius: 24,
          backgroundColor: AppColors.primary,
          child: Text(
            page.toString(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        IconButton(
          onPressed: page < last ? onProgress : null,
          icon: const Icon(
            Icons.arrow_forward_ios,
          ),
        ),
      ],
    );
  }
}
class SecondPaginationItem extends StatelessWidget {
  final int page;
  final int last;
  final VoidCallback onProgress;

  const SecondPaginationItem(
      {Key? key,
      required this.page,
      required this.onProgress,
      required this.last})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: AppColors.borderColor),
          ),
          child: Center(
            child: Text(
              page.toString(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        IconButton(
          onPressed: page < last ? onProgress : null,
          icon: const Icon(
            Icons.arrow_forward_ios,
          ),
        ),
      ],
    );
  }
}
