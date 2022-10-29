import 'package:flutter/material.dart';
import 'package:gen_z_designs/gen_z_designs.dart';

class GenZButton extends StatefulWidget {
  /// Text takes [String] and If [child] and [text] both are given then [text] will be given priority.
  final String? text;

  /// When [GenZButton] is tapped or pressed if given [Null] button will be disabled.
  final void Function()? onPressed;

  /// Label for the [GenZButton].
  /// Takes [Widget] and will be given less priority than [text].
  final Widget? child;

  /// Takes [Widget] as an [Icon] and can be used alone as [IconButton].
  ///
  /// ``Example``
  /// ```dart
  /// GenZButton(
  ///   onPressed: () {},
  ///   icon: const Icon(Icons.favorite),
  ///   type: GenZButtonType.TRANSPARENT,
  /// )
  /// ```
  final Widget? icon;

  /// Defualt position is [GenZPosition.LEADING].
  ///
  /// Takes [GenZPosition] and this will decide where [icon] and ([text] or [child]) will be shown.
  ///
  /// [GenZPosition.CENTER],[GenZPosition.LEADING],[GenZPosition.TRAILING]
  ///
  /// `When [icon] is used with [child] or [text] then position can't be [GenZPosition.CENTER]`.
  final GenZPosition position;

  /// Defualt [size]  is [GenZSize.MEDIUM].
  ///
  /// Takes [GenZSize] and have four sizes:
  ///
  /// [GenZSize.SMALL], [GenZSize.MEDIUM], [GenZSize.LARGE], [GenZSize.XLARGE]
  final GenZSize size;

  /// Padding for the content.
  final EdgeInsets? padding;

  /// Default [elevation] is 0.
  final double elevation;

  /// If [disabledColor] not given then it will take [color] with 60% opacity.
  final Color? disabledColor;

  /// Default [disabledElevation] is 0.
  final double disabledElevation;

  /// Default [focusElevation] is 0.
  final double focusElevation;

  /// Default [hoverElevation] is 0.
  final double hoverElevation;

  /// Default [highlightElevation] is 0.
  final double highlightElevation;

  /// Default [height] is 0.
  ///
  /// Some height of button is taken from padding, to completely erase height use [height] and [padding] zero.
  final double? height;

  /// Defualt [minWidth] is 0.
  final double? minWidth;

  /// Default [color] is [GenZColors.primary] for defualt [GenZButtonType.FILL] button type.
  final Color? color;

  /// [textStyle] is only applicable to text provided using [text] params.
  final TextStyle? textStyle;

  /// Defualt [type] is [GenZButtonType.FILL].
  ///
  /// Takes [GenZButtonType] and have four types:
  ///
  /// [GenZButtonType.FILL], [GenZButtonType.OUTLINED], [GenZButtonType.OUTLINED2X], [GenZButtonType.TRANSPARENT]
  final GenZButtonType? type;

  /// [textColor] works for all [text],[child],[icon]
  ///
  /// Also [textColor] have less priority over [textStyle.color]
  final Color? textColor;

  /// Default is false.
  final bool enableFeedback;

  /// Splash color for icon is transparent
  final Color? splashColor;

  /// Badge if true will show badge over button
  final bool badge;

  final BadgeType badgeType;

  /// Widget for badge text to be display inside
  final Widget? badgeText;

  /// BadgePosition Outside Positions and default will be right=0 and size will be 12 if not provided
  ///
  /// Note: This param will only useful for BadgePosition.OUTSIDE
  final GenZBadgePosition badgePosition;

  /// Default badge color will be picked from color property of button
  final Color? badgeColor;

  /// [highlightColor] color for icon is transparent
  final Color? highlightColor;

  /// Defualt [shape] is [GenZButtonShape.DEFAULT].
  ///
  /// Takes [GenZButtonShape] and have three shapes:
  ///
  /// [GenZButtonShape.DEFAULT], [GenZButtonShape.PILL], [GenZButtonShape.SQUARE]
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
    this.badgeText,
    this.badgeColor,
    this.splashColor,
    this.badgeType = BadgeType.OUTSIDE,
    this.size = GenZSize.MEDIUM,
    this.highlightColor,
    this.badge = false,
    this.badgePosition = const GenZBadgePosition(right: 0),
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
        assert(badgeType == BadgeType.INSIDE ? badgeText != null : true,
            "If BadgeType is Inside then badgeText cant be null"),
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
                  fontSize: _getTextStyle()[0],
                  fontWeight: _getTextStyle()[1],
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
                  fontSize: _getTextStyle()[0],
                  fontWeight: _getTextStyle()[1],
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
    return widget.badge && widget.badgeType == BadgeType.OUTSIDE
        ? _badgeButtonOutside()
        : _mainButton();
  }

  /// Function used to get button color according to several conditions
  Color _getButtonColor() {
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

  /// If badgeOutside is used then this will be the button
  Widget _badgeButtonOutside() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: _mainButton(),
        ),
        Positioned(
          right: widget.badgePosition.right,
          left: widget.badgePosition.left,
          bottom: widget.badgePosition.bottom,
          top: widget.badgePosition.top,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                widget.badgePosition.size ?? 12,
              ),
              color: widget.badgeColor ?? GenZColors.secondary,
            ),
            width: widget.badgePosition.size ?? 12,
            height: widget.badgePosition.size ?? 12,
            child: widget.badgeText,
          ),
        ),
      ],
    );
  }

  /// Main button if no badge is provided
  Widget _mainButton() {
    return MaterialButton(
        enableFeedback: widget.enableFeedback,
        onPressed: widget.onPressed,
        elevation: widget.elevation,
        hoverElevation: widget.hoverElevation,
        focusElevation: widget.focusElevation,
        highlightElevation: widget.highlightElevation,
        disabledElevation: widget.disabledElevation,
        disabledColor: widget.disabledColor ?? widget.color?.withOpacity(.6),
        textColor: widget.textStyle?.color ?? _getTextColor(),
        color: _getButtonColor(),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: widget.padding ??
            EdgeInsets.symmetric(
              horizontal: (icon == null)
                  ? (child == null ? 0 : 15)
                  : (child == null ? 8 : 15),
              vertical: _getVerticalPadding(),
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
            width: widget.type == GenZButtonType.OUTLINED ? 1 : 2,
          ),
        ),
        splashColor: widget.splashColor ??
            (child == null &&
                    icon != null &&
                    widget.type == GenZButtonType.TRANSPARENT
                ? GenZColors.transparent
                : null),
        highlightColor: widget.highlightColor ??
            (child == null &&
                    icon != null &&
                    widget.type == GenZButtonType.TRANSPARENT
                ? GenZColors.transparent
                : null),
        child: icon != null && child != null && position == GenZPosition.LEADING
            ? Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon!,
                  const SizedBox(width: 8),
                  child!,
                  _insideBadge()
                ],
              )
            : icon != null && child != null && position == GenZPosition.TRAILING
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      child!,
                      const SizedBox(width: 8),
                      icon!,
                      _insideBadge()
                    ],
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [(icon ?? child)!, _insideBadge()],
                  ));
  }

  Widget _insideBadge() {
    return Visibility(
      visible: widget.badge && widget.badgeType == BadgeType.INSIDE,
      child: Container(
        height: widget.badgePosition.size,
        margin: const EdgeInsets.only(left: 5),
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
            color: widget.badgeColor, borderRadius: BorderRadius.circular(20)),
        child: widget.badgeText ?? const Text("NA"),
      ),
    );
  }

  /// Function used to get text color according to several conditions
  Color? _getTextColor() {
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
        if (_isWhiteAndTransparent(widget.color)) {
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

  /// Function used to get text Style according to button size
  List _getTextStyle() {
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

  /// Function used to get vertical padding according to button size
  double _getVerticalPadding() {
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

  /// Check if passed color is white or transparent
  bool _isWhiteAndTransparent(Color? color) {
    if (color == GenZColors.white || color == GenZColors.transparent) {
      return true;
    } else {
      return false;
    }
  }
}
