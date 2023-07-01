/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/chess-bishop.png
  AssetGenImage get chessBishop =>
      const AssetGenImage('assets/icons/chess-bishop.png');

  /// File path: assets/icons/chess-king.png
  AssetGenImage get chessKing =>
      const AssetGenImage('assets/icons/chess-king.png');

  /// File path: assets/icons/chess-knight.png
  AssetGenImage get chessKnight =>
      const AssetGenImage('assets/icons/chess-knight.png');

  /// File path: assets/icons/chess-pawn.png
  AssetGenImage get chessPawn =>
      const AssetGenImage('assets/icons/chess-pawn.png');

  /// File path: assets/icons/chess-queen.png
  AssetGenImage get chessQueen =>
      const AssetGenImage('assets/icons/chess-queen.png');

  /// File path: assets/icons/chess-rook.png
  AssetGenImage get chessRook =>
      const AssetGenImage('assets/icons/chess-rook.png');

  /// File path: assets/icons/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/icons/logo.png');

  /// File path: assets/icons/pices.png
  AssetGenImage get pices => const AssetGenImage('assets/icons/pices.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        chessBishop,
        chessKing,
        chessKnight,
        chessPawn,
        chessQueen,
        chessRook,
        logo,
        pices
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
