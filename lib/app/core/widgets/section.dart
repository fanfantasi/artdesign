import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final String title;
  final bool more;
  final VoidCallback onTap;

  const Section({
    required this.title,
    required this.more,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            title,
            maxFontSize: 14,
            minFontSize: 12,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Theme.of(context).colorScheme.onBackground),
          ),
          Visibility(
            visible: more,
            child: GestureDetector(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  AutoSizeText(
                    'view all'.tr(),
                    maxFontSize: 12,
                    minFontSize: 10,
                    style: TextStyle(
                      height: 1,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Icon(
                      Icons.arrow_forward,
                      size: 16,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
              onTap: onTap,
            ),
          )
        ],
      ),
    );
  }
}
