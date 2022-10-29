import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gen_z_designs/gen_z_designs.dart';
import 'package:gen_z_designs/shape/gen_z_avatar_shape.dart';

class GenZAvatar extends StatelessWidget {
  /// Badge Position takes alignment and have few configuration on
  /// `Alignment.topRight`, `Alignment.topLeft`, `Alignment.bottomRight`,
  /// `Alignment.bottomLeft`.
  ///
  /// We can give alignment using Alignment(x,y) Constructor
  ///
  /// Default badgePosition is [Alignment.bottomRight]
  final Alignment? badgePosition;

  /// shape of image, `default is circle`
  final GenZAvatarShape? avatarShape;

  /// enable badge, `default is false`
  final bool? badge;

  /// size of avatar, `default is 100`
  final double size;

  /// badgeSize of avatar, `default is 15`
  final double badgeSize;

  /// badgeColor of avatar, ``default is [GenZColors.success]``
  final Color? badgeColor;

  /// borderColor of avatar, ``default is [Colors.white]``
  final Color? borderColor;

  /// ImageFit of avatar, ``default is [BoxFit.cover]``
  final BoxFit? fit;

  /// Image url for the network image
  final String? url;

  /// Child is used only when url is not given,
  ///
  /// Prefer wrapping child with center
  final Widget? child;

  /// borderWith of avatar, `default is 1`
  final double? borderWidth;

  /// errorBuilder is only used with url tag only not with child
  final Widget Function(
          BuildContext context, Object object, StackTrace? stackTrace)?
      errorBuilder;

  /// badgeBorderColor of avatars badge, ``default is [Colors.white]``
  final Color? badgeBorderColor;

  /// badgeBorderWidth of avatar badge, `default is 0`
  final double? badgeBorderWidth;

  const GenZAvatar(
      {super.key,
      this.url,
      this.child,
      this.fit,
      this.badge,
      this.badgePosition,
      this.avatarShape,
      this.badgeBorderColor,
      this.badgeBorderWidth,
      this.size = 100,
      this.badgeSize = 15,
      this.badgeColor,
      this.borderColor,
      this.borderWidth,
      this.errorBuilder})
      : assert(child == null && url == null ? false : true, AVATARURLCHILDNULL),
        assert(
            url != null && child != null ? false : true, AVATARURLCHILDNOTNULL),
        assert(errorBuilder != null && url == null ? false : true,
            AVATARURLERRORBUILDER);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: size,
            width: size,
            foregroundDecoration: BoxDecoration(
              border: Border.all(
                  color: borderColor ?? Colors.white, width: borderWidth ?? 1),
              borderRadius: avatarShape == GenZAvatarShape.SQUARE
                  ? BorderRadius.zero
                  : BorderRadius.circular(size / 2),
            ),
            child: ClipRRect(
              borderRadius: avatarShape == GenZAvatarShape.SQUARE
                  ? BorderRadius.zero
                  : BorderRadius.circular(size / 2),
              child: child ??
                  Image.network(
                    url ?? "",
                    fit: fit ?? BoxFit.cover,
                    errorBuilder: errorBuilder ??
                        (context, error, stackTrace) => const Center(
                              child: Icon(
                                Icons.error_outline_rounded,
                                color: Colors.grey,
                              ),
                            ),
                  ),
            ),
          ),
          (badge ?? false)
              ? Align(
                  alignment: _badgePosition(),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: badgeBorderColor ?? Colors.white,
                            width: badgeBorderWidth ?? 0),
                        color: badgeColor ?? GenZColors.success,
                        shape: BoxShape.circle),
                    width: badgeSize,
                    height: badgeSize,
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  _badgePosition() {
    var x = ((sqrt2 * (size / 2)) - (size / 2) - (sqrt2 * (badgeSize / 2)));
    var y = (sqrt2 * size);
    var cord = x / y;

    if (badgePosition == Alignment.topRight) {
      return FractionalOffset(0.986 - cord, cord + 0.014);
    } else if (badgePosition == Alignment.bottomRight ||
        badgePosition == null) {
      return FractionalOffset(0.986 - cord, 0.986 - cord);
    } else if (badgePosition == Alignment.topLeft) {
      return FractionalOffset(cord + 0.014, cord + 0.014);
    } else if (badgePosition == Alignment.bottomLeft) {
      return FractionalOffset(cord + 0.014, 0.986 - cord);
    } else if (badgePosition != null) {
      return badgePosition;
    } else {
      return const Alignment(0, 0);
    }
  }
}
