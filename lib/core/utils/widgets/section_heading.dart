import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final bool showAction;

  const SectionHeading({
    super.key,
    required this.title,
    this.onTap,
    this.showAction = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          if (showAction)
            TextButton(
              onPressed: onTap,
              child: Text(
                'voir plus',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
        ],
      ),
    );
  }
}

class SectionHeadingMini extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final bool showAction;

  const SectionHeadingMini({
    super.key,
    required this.title,
    this.onTap,
    this.showAction = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //   padding: EdgeInsets.symmetric(horizontal: CustomSize.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          if (showAction)
            TextButton(
              onPressed: onTap,
              child: Text(
                'voir plus',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
        ],
      ),
    );
  }
}
