import 'package:flutter/material.dart';
import 'package:gen_z_designs/gen_z_designs.dart';

class GenZButton extends StatefulWidget {
  final String? text;
  final void Function()? onPressed;
  final Widget? child;
  final Widget? icon;
  final GenZPosition position;
  final GenZButtonSize size;
  final EdgeInsets? padding;
  final double elevation;
  final Color? disabledColor;
  final double disabledElevation;
  final double focusElevation;
  final double hoverElevation;
  final double highlightElevation;
  final double? height;
  final double? minWidth;
  final Color? color;
  final TextStyle? textStyle;
  final Color? textColor;
  final BoxConstraints? constraints;
  const GenZButton({
    Key? key,
    this.text,
    required this.onPressed,
    this.constraints,
    this.child,
    this.icon,
    this.position = GenZPosition.leading,
    this.padding,
    this.color = GenZColors.transparent,
    this.size = GenZButtonSize.medium,
    this.textColor,
    this.height,
    this.minWidth,
    this.disabledColor,
    this.textStyle,
    this.elevation = 0.0,
    this.disabledElevation = 0.0,
    this.focusElevation = 0.0,
    this.highlightElevation = 0.0,
    this.hoverElevation = 0.0,
  })  : assert(focusElevation >= 0.0),
        assert(hoverElevation >= 0.0),
        assert(highlightElevation >= 0.0),
        assert(disabledElevation >= 0.0),
        super(key: key);
  @override
  State<GenZButton> createState() => _GenZButtonState();
}

class _GenZButtonState extends State<GenZButton> {
  Widget? child;
  Widget? icon;
  late GenZPosition position;

  @override
  void initState() {
    child = widget.text != null
        ? Text(widget.text.toString(),
            style: widget.textStyle ?? getTextStyle())
        : widget.child;
    position = widget.position;
    icon = widget.icon;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: widget.onPressed,
      elevation: widget.elevation,
      hoverElevation: widget.hoverElevation,
      focusElevation: widget.focusElevation,
      highlightElevation: widget.highlightElevation,
      disabledElevation: widget.disabledElevation,
      disabledColor: widget.disabledColor ?? widget.color?.withOpacity(.6),
      textColor: widget.textColor ??
          (widget.color == GenZColors.white ||
                  widget.color == GenZColors.transparent
              ? GenZColors.dark
              : GenZColors.white),
      color: widget.color,
      padding: widget.padding ??
          EdgeInsets.symmetric(
            horizontal: (icon == null)
                ? (child == null ? 0 : 15)
                : (child == null ? 8 : 15),
            vertical: getHeight(),
          ),
      minWidth: widget.minWidth ?? 0,
      // minWidth:
      //     (icon == null) ? (child == null ? 0 : 80) : (child == null ? 40 : 90),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      splashColor: child == null && icon != null ? null : null,
      highlightColor: child == null && icon != null ? null : null,
      child: icon != null && child != null && position == GenZPosition.leading
          ? Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [icon!, const SizedBox(width: 8), child!],
            )
          : icon != null && child != null && position == GenZPosition.trailing
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [child!, const SizedBox(width: 8), icon!],
                )
              : icon ?? child,
    );
  }

  TextStyle getTextStyle() {
    return TextStyle(
      fontSize: widget.size == GenZButtonSize.small
          ? 12
          : widget.size == GenZButtonSize.medium
              ? 13
              : widget.size == GenZButtonSize.large
                  ? 14
                  : widget.size == GenZButtonSize.xlarge
                      ? 16
                      : 13,
      fontWeight: widget.size == GenZButtonSize.large
          ? FontWeight.w500
          : widget.size == GenZButtonSize.xlarge
              ? FontWeight.w600
              : FontWeight.w400,
    );
  }

  double getHeight() {
    return widget.size == GenZButtonSize.medium
        ? 8
        : widget.size == GenZButtonSize.large
            ? 10
            : widget.size == GenZButtonSize.xlarge
                ? 12
                : 0;
  }
}
