import 'package:flutter/material.dart';
import 'package:gen_z_designs/gen_z_designs.dart';

class GenZButton extends StatefulWidget {
  /// Tested [text] working perfectly with [textColor] and [textStyle]
  final String? text;

  /// Tested [onPressed] and working when [Null] condition its disabled
  final void Function()? onPressed;

  /// Tested [child] and is working fine with [Text] and [Container]
  final Widget? child;

  /// Tested [icon] with [child], [position], working fine
  final Widget? icon;

  /// Tested [position] with [child],[icon] and [text] added assertion for center.
  final GenZPosition position;

  /// Tested [size] with all [GenZSize] working fine
  final GenZSize size;

  /// Tested [padding] working fine
  final EdgeInsets? padding;

  /// Tested [elevation] working fine
  final double elevation;

  /// Tested [disabledColor] working fine
  final Color? disabledColor;
  final double disabledElevation;
  final double focusElevation;
  final double hoverElevation;
  final double highlightElevation;

  /// Tested [height] working fine
  final double? height;

  /// Tested [minWidth] and working fine
  final double? minWidth;

  /// Tested [color] and working fine //!can be improved with fontcolor and all
  final Color? color;

  /// Tested [textStyle] with [text] and is working fine also will only work with text
  final TextStyle? textStyle;

  ///! Not implemented this feature yet
  final GenZButtonType? type;

  /// Tested [textColor] with [text], [child] and [icon] and is working fine
  final Color? textColor;

  ///! Have to test in real device
  final bool enableFeedback;

  final Color? splashColor;
  final Color? highlightColor;
  final GenZButtonShape? shape;

  const GenZButton({
    Key? key,
    this.text,
    required this.onPressed,
    this.shape = GenZButtonShape.DEFAULT,
    this.child,
    this.icon,
    this.type = GenZButtonType.FILL,
    this.position = GenZPosition.LEADING,
    this.padding,
    this.enableFeedback = false,
    this.color,
    this.splashColor,
    this.size = GenZSize.MEDIUM,
    this.highlightColor,
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
        assert(
          icon != null && (child != null || text != null)
              ? (position == GenZPosition.CENTER ? false : true)
              : true,
          POSITIONCENTERERROR,
        ),
        super(key: key);
  @override
  State<GenZButton> createState() => _GenZButtonState();
}

class _GenZButtonState extends State<GenZButton> {
  Widget? child;
  Widget? icon;
  late GenZPosition position;
  final Set<MaterialState> _states = <MaterialState>{};

  @override
  void initState() {
    child = widget.text != null
        ? Text(widget.text.toString(),
            style: widget.textStyle ??
                TextStyle(
                  fontSize: getTextStyle()[0],
                  fontWeight: getTextStyle()[1],
                ))
        : widget.child;
    position = widget.position;
    icon = widget.icon;
    super.initState();
  }

  @override
  void didUpdateWidget(GenZButton oldWidget) {
    _updateState(MaterialState.disabled, !(widget.onPressed != null));

    child = widget.text != null
        ? Text(widget.text.toString(),
            style: widget.textStyle ??
                TextStyle(
                  fontSize: getTextStyle()[0],
                  fontWeight: getTextStyle()[1],
                ))
        : widget.child;
    icon = widget.icon;
    position = widget.position;

    _updateState(
      MaterialState.disabled,
      !(widget.onPressed != null),
    );
    super.didUpdateWidget(oldWidget);
  }

  void _updateState(MaterialState state, bool value) {
    value ? _states.add(state) : _states.remove(state);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      enableFeedback: widget.enableFeedback,
      onPressed: widget.onPressed,
      elevation: widget.elevation,
      hoverElevation: widget.hoverElevation,
      focusElevation: widget.focusElevation,
      highlightElevation: widget.highlightElevation,
      disabledElevation: widget.disabledElevation,
      disabledColor: widget.disabledColor ?? widget.color?.withOpacity(.6),
      textColor: widget.textStyle?.color ?? getTextColor(),
      color: getButtonColor(),
      padding: widget.padding ??
          EdgeInsets.symmetric(
            horizontal: (icon == null)
                ? (child == null ? 0 : 15)
                : (child == null ? 8 : 15),
            vertical: getVerticalPadding(),
          ),
      minWidth: widget.minWidth ?? 0,
      // minWidth:
      //     (icon == null) ? (child == null ? 0 : 80) : (child == null ? 40 : 90),
      height: widget.height ?? 0,
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(widget.shape == GenZButtonShape.PILL
                  ? MediaQuery.of(context).size.height
                  : widget.shape == GenZButtonShape.SQUARE
                      ? 0
                      : 5),
          side: BorderSide(
              color: widget.type == GenZButtonType.OUTLINED ||
                      widget.type == GenZButtonType.OUTLINED2X
                  ? widget.color ?? GenZColors.dark
                  : GenZColors.transparent,
              width: widget.type == GenZButtonType.OUTLINED ? 1 : 2)),
      splashColor:
          widget.splashColor ?? (child == null && icon != null ? null : null),
      highlightColor: widget.highlightColor ??
          (child == null && icon != null ? null : null),
      child: icon != null && child != null && position == GenZPosition.LEADING
          ? Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [icon!, const SizedBox(width: 8), child!],
            )
          : icon != null && child != null && position == GenZPosition.TRAILING
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [child!, const SizedBox(width: 8), icon!],
                )
              : icon ?? child,
    );
  }

  Color getButtonColor() {
    if (widget.type == GenZButtonType.FILL && widget.color != null) {
      return widget.color!;
    } else if (widget.type == GenZButtonType.FILL && widget.color == null) {
      return GenZColors.primary;
    } else if (widget.type == GenZButtonType.TRANSPARENT ||
        widget.type == GenZButtonType.OUTLINED ||
        widget.type == GenZButtonType.OUTLINED2X) {
      return GenZColors.transparent;
    } else {
      return GenZColors.primary;
    }
  }

  Color? getTextColor() {
    if (widget.textColor != null) {
      return widget.textColor;
    } else if (widget.textColor == null) {
      if (widget.color == null) {
        if (widget.type == GenZButtonType.FILL) {
          return GenZColors.white;
        } else if (widget.type == GenZButtonType.TRANSPARENT ||
            widget.type == GenZButtonType.OUTLINED ||
            widget.type == GenZButtonType.OUTLINED2X) {
          return GenZColors.dark;
        }
      } else if (widget.color != null) {
        if (isWhiteAndTransparent(widget.color)) {
          return GenZColors.dark;
        } else if (widget.type == GenZButtonType.OUTLINED ||
            widget.type == GenZButtonType.OUTLINED2X) {
          return widget.color;
        } else if (widget.type == GenZButtonType.FILL) {
          return GenZColors.white;
        }
      }
    } else if (widget.type == GenZButtonType.FILL) {
      return widget.color;
    }
    return null;
  }

  List getTextStyle() {
    if (widget.size == GenZSize.SMALL) {
      return [12.0, FontWeight.w400];
    } else if (widget.size == GenZSize.MEDIUM) {
      return [13.0, FontWeight.w400];
    } else if (widget.size == GenZSize.LARGE) {
      return [14.0, FontWeight.w500];
    } else if (widget.size == GenZSize.XLARGE) {
      return [16.0, FontWeight.w600];
    } else {
      return [13.0, FontWeight.w400];
    }
  }

  double getVerticalPadding() {
    if (widget.size == GenZSize.MEDIUM) {
      return 10;
    } else if (widget.size == GenZSize.LARGE) {
      return 12;
    } else if (widget.size == GenZSize.XLARGE) {
      return 14;
    } else {
      return 0;
    }
  }

  isWhiteAndTransparent(Color? color) {
    if (color == GenZColors.white || color == GenZColors.transparent) {
      return true;
    } else {
      return false;
    }
  }
}
