import 'package:flutter/material.dart';
import 'package:hotel_booking/core/utils/constants/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onTap,
    this.title = "",
    this.fsize = 15,
    this.width = double.infinity,
    this.height = 45,
    this.bgColor = primary,
    this.icon,
    this.disableButton = false,
    this.isLoading = false,
    this.radius = 10,
    this.textColor = Colors.white,
  }) : super(key: key);
  final GestureTapCallback onTap;
  final String title;
  final double fsize;
  final Color textColor;
  final double width;
  final double height;
  final double radius;
  final Color bgColor;
  final IconData? icon;
  final bool disableButton;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: disableButton,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: disableButton ? bgColor.withValues(alpha: 0.3) : bgColor,
            boxShadow: [
              BoxShadow(
                color: shadowColor.withValues(alpha: 0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          width: width,
          height: height,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: isLoading
                ? [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: textColor,
                        strokeWidth: 3,
                      ),
                    ),
                  ]
                : (icon == null)
                ? [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: fsize,
                        color: disableButton
                            ? textColor.withValues(alpha: 0.3)
                            : textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ]
                : [
                    Icon(
                      icon,
                      size: fsize + 7,
                      color: disableButton
                          ? textColor.withValues(alpha: 0.3)
                          : textColor,
                    ),
                    SizedBox(width: 5),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: fsize,
                        color: disableButton
                            ? textColor.withValues(alpha: 0.3)
                            : textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
          ),
        ),
      ),
    );
  }
}

class CustomButtonWithAnimation extends StatefulWidget {
  const CustomButtonWithAnimation({
    Key? key,
    required this.onTap,
    this.title = "",
    this.fsize = 15,
    this.width = double.infinity,
    this.height = 45,
    this.bgColor = primary,
    this.icon,
    this.disableButton = false,
    this.isLoading = false,
    this.radius = 10,
    this.textColor = Colors.white,
  }) : super(key: key);
  final GestureTapCallback onTap;
  final String title;
  final double fsize;
  final Color textColor;
  final double width;
  final double height;
  final double radius;
  final Color bgColor;
  final IconData? icon;
  final bool disableButton;
  final bool isLoading;

  @override
  State<CustomButtonWithAnimation> createState() =>
      _CustomButtonWithAnimationState();
}

class _CustomButtonWithAnimationState extends State<CustomButtonWithAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Duration _animationDuration = const Duration(milliseconds: 300);
  final Tween<double> _tween = Tween<double>(begin: 1.0, end: 0.95);

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: _animationDuration)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: widget.disableButton,
      child: GestureDetector(
        onTap: () {
          _controller.forward().then((_) {
            _controller.reverse();
          });
          widget.onTap();
        },
        child: ScaleTransition(
          scale: _tween.animate(
            CurvedAnimation(
              parent: _controller,
              curve: Curves.easeOut,
              reverseCurve: Curves.easeIn,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.radius),
              color: widget.disableButton
                  ? widget.bgColor.withValues(alpha: 0.5)
                  : widget.bgColor,
              boxShadow: [
                BoxShadow(
                  color: shadowColor.withValues(alpha: 0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            width: widget.width,
            height: widget.height,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.isLoading
                  ? [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: widget.textColor,
                          strokeWidth: 3,
                        ),
                      ),
                    ]
                  : (widget.icon == null)
                  ? [
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: widget.fsize,
                          color: widget.disableButton
                              ? widget.textColor.withValues(alpha: 0.3)
                              : widget.textColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ]
                  : [
                      Icon(
                        widget.icon,
                        size: widget.fsize + 7,
                        color: widget.disableButton
                            ? widget.textColor.withValues(alpha: 0.3)
                            : widget.textColor,
                      ),
                      SizedBox(width: 5),
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: widget.fsize,
                          color: widget.disableButton
                              ? widget.textColor.withValues(alpha: 0.3)
                              : widget.textColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
            ),
          ),
        ),
      ),
    );
  }
}
