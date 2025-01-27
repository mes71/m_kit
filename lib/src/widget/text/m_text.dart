import 'dart:ui' as ui show TextHeightBehavior;

import 'package:flutter/material.dart';

class MText extends StatelessWidget {
  final String? data;
  final BuildContext context;

  /// If non-null, the style to use for this text.
  ///
  /// If the style's "inherit" property is true, the style will be merged with
  /// the closest enclosing [DefaultTextStyle]. Otherwise, the style will
  /// replace the closest enclosing [DefaultTextStyle].
  final TextStyle? style;

  /// {@macro flutter.painting.textPainter.strutStyle}
  final StrutStyle? strutStyle;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// The directionality of the text.
  ///
  /// This decides how [textAlign] values like [TextAlign.start] and
  /// [TextAlign.end] are interpreted.
  ///
  /// This is also used to disambiguate how to render bidirectional text. For
  /// example, if the [data] is an English phrase followed by a Hebrew phrase,
  /// in a [TextDirection.ltr] context the English phrase will be on the left
  /// and the Hebrew phrase to its right, while in a [TextDirection.rtl]
  /// context, the English phrase will be on the right and the Hebrew phrase on
  /// its left.
  ///
  /// Defaults to the ambient [Directionality], if any.
  final TextDirection? textDirection;

  /// Used to select a font when the same Unicode character can
  /// be rendered differently, depending on the locale.
  ///
  /// It's rarely necessary to set this property. By default its value
  /// is inherited from the enclosing app with `Localizations.localeOf(context)`.
  ///
  /// See [RenderParagraph.locale] for more information.
  final Locale? locale;

  /// Whether the text should break at soft line breaks.
  ///
  /// If false, the glyphs in the text will be positioned as if there was unlimited horizontal space.
  final bool? softWrap;

  /// How visual overflow should be handled.
  ///
  /// If this is null [TextStyle.overflow] will be used, otherwise the value
  /// from the nearest [DefaultTextStyle] ancestor will be used.
  final TextOverflow? overflow;

  /// {@macro flutter.painting.textPainter.textScaler}
  final TextScaler? textScaler;

  /// An optional maximum number of lines for the text to span, wrapping if necessary.
  /// If the text exceeds the given number of lines, it will be truncated according
  /// to [overflow].
  ///
  /// If this is 1, text will not wrap. Otherwise, text will be wrapped at the
  /// edge of the box.
  ///
  /// If this is null, but there is an ambient [DefaultTextStyle] that specifies
  /// an explicit number for its [DefaultTextStyle.maxLines], then the
  /// [DefaultTextStyle] value will take precedence. You can use a [RichText]
  /// widget directly to entirely override the [DefaultTextStyle].
  final int? maxLines;

  /// {@template flutter.widgets.Text.semanticsLabel}
  /// An alternative semantics label for this text.
  ///
  /// If present, the semantics of this widget will contain this value instead
  /// of the actual text. This will overwrite any of the semantics labels applied
  /// directly to the [TextSpan]s.
  ///
  /// This is useful for replacing abbreviations or shorthands with the full
  /// text value:
  ///
  /// ```dart
  /// const Text(r'$$', semanticsLabel: 'Double dollars')
  /// ```
  /// {@endtemplate}
  final String? semanticsLabel;

  /// {@macro flutter.painting.textPainter.textWidthBasis}
  final TextWidthBasis? textWidthBasis;

  /// {@macro dart.ui.textHeightBehavior}
  final ui.TextHeightBehavior? textHeightBehavior;

  /// The color to use when painting the selection.
  ///
  /// This is ignored if [SelectionContainer.maybeOf] returns null
  /// in the [BuildContext] of the [Text] widget.
  ///
  /// If null, the ambient [DefaultSelectionStyle] is used (if any); failing
  /// that, the selection color defaults to [DefaultSelectionStyle.defaultColor]
  /// (semi-transparent grey).
  final Color? selectionColor;

  /// The **2018** spec has thirteen text styles:
  ///
  /// | NAME           | SIZE |  WEIGHT |  SPACING |             |
  /// |----------------|------|---------|----------|-------------|
  /// | displayLarge   | 96.0 | light   | -1.5     |             |
  /// | displayMedium  | 60.0 | light   | -0.5     |             |
  /// | displaySmall   | 48.0 | regular |  0.0     |             |
  /// | headlineMedium | 34.0 | regular |  0.25    |             |
  /// | headlineSmall  | 24.0 | regular |  0.0     |             |
  /// | titleLarge     | 20.0 | medium  |  0.15    |             |
  /// | titleMedium    | 16.0 | regular |  0.15    |             |
  /// | titleSmall     | 14.0 | medium  |  0.1     |             |
  /// | bodyLarge      | 16.0 | regular |  0.5     |             |
  /// | bodyMedium     | 14.0 | regular |  0.25    |             |
  /// | bodySmall      | 12.0 | regular |  0.4     |             |
  /// | labelLarge     | 14.0 | medium  |  1.25    |             |
  /// | labelSmall     | 10.0 | regular |  1.5     |             |
  ///
  /// ...where "light" is `FontWeight.w300`, "regular" is `FontWeight.w400` and
  /// "medium" is `FontWeight.w500`.
  ///
  ///
  ///

  /// | displayLarge   | 96.0 | light   | -1.5     |
  MText.displayLarge(
    this.data, {
    super.key,
    required this.context,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : style = TextTheme.of(context).displayLarge;

  /// | displayMedium  | 60.0 | light   | -0.5     |
  MText.displayMedium(
    this.data, {
    super.key,
    required this.context,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : style = TextTheme.of(context).displayMedium;

  /// | displaySmall   | 48.0 | regular |  0.0     |
  MText.displaySmall(
    this.data, {
    super.key,
    required this.context,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : style = TextTheme.of(context).displaySmall;

  /// | headlineMedium | 34.0 | regular |  0.25    |
  MText.headlineMedium(
    this.data, {
    super.key,
    required this.context,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : style = TextTheme.of(context).headlineMedium;

  /// | headlineSmall  | 24.0 | regular |  0.0     |
  MText.headlineSmall(
    this.data, {
    super.key,
    required this.context,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : style = TextTheme.of(context).headlineSmall;

  /// | titleLarge     | 20.0 | medium  |  0.15    |
  MText.titleLarge(
    this.data, {
    super.key,
    required this.context,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : style = TextTheme.of(context).titleLarge;

  /// | titleMedium    | 16.0 | regular |  0.15    |
  MText.titleMedium(
    this.data, {
    super.key,
    required this.context,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : style = TextTheme.of(context).titleMedium;

  /// | titleSmall     | 14.0 | medium  |  0.1     |
  MText.titleSmall(
    this.data, {
    super.key,
    required this.context,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : style = TextTheme.of(context).titleSmall;

  // | titleSmall     | 14.0 | medium  |  0.1     |
  MText.bodyLarge(
    this.data, {
    super.key,
    required this.context,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : style = TextTheme.of(context).bodyLarge;

  //| bodyMedium     | 14.0 | regular |  0.25    |
  MText.bodyMedium(
    this.data, {
    super.key,
    required this.context,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : style = TextTheme.of(context).bodyMedium;

  // | bodySmall      | 12.0 | regular |  0.4     |
  MText.bodySmall(
    this.data, {
    super.key,
    required this.context,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : style = TextTheme.of(context).bodySmall;

  // | labelSmall     | 10.0 | regular |  1.5     |             |
  MText.labelSmall(
    this.data, {
    super.key,
    required this.context,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : style = TextTheme.of(context).labelSmall;

  /// | labelLarge     | 14.0 | medium  |  1.25    |
  MText.labelLarge(
    this.data, {
    super.key,
    required this.context,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : style = TextTheme.of(context).labelLarge;

  const MText(
    this.data, {
    super.key,
    required this.context,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data ?? '',
      style: style,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      textScaler: textScaler,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      selectionColor: selectionColor,
    );
  }
}
