import 'package:MKit/src/widget/common/m_color.dart';
import 'package:flutter/material.dart';

class MTextStyle {
  MTextStyle._();

  static TextStyle headline1(BuildContext context) => TextStyle(
        textBaseline: TextBaseline.alphabetic,
        fontWeight: FontWeight.w700,
        fontSize: 48,
        color: Theme.of(context).colorScheme.tertiary,
        fontFamilyFallback: const [],
      );

  static TextStyle headline2(BuildContext context) => TextStyle(
        textBaseline: TextBaseline.alphabetic,
        fontWeight: FontWeight.w700,
        fontSize: 40,
        color: Theme.of(context).colorScheme.tertiary,
        fontFamilyFallback: const [],
      );

  static TextStyle headline3(BuildContext context) => TextStyle(
        textBaseline: TextBaseline.alphabetic,
        fontWeight: FontWeight.w700,
        fontSize: 36,
        color: Theme.of(context).colorScheme.tertiary,
        fontFamilyFallback: const [],
      );

  static TextStyle headline4(BuildContext context) => TextStyle(
        textBaseline: TextBaseline.alphabetic,
        fontWeight: FontWeight.w700,
        fontSize: 32,
        color: Theme.of(context).colorScheme.tertiary,
        fontFamilyFallback: const [],
      );

  static TextStyle headline5(BuildContext context) => TextStyle(
        textBaseline: TextBaseline.alphabetic,
        fontWeight: FontWeight.w700,
        fontSize: 28,
        color: Theme.of(context).colorScheme.tertiary,
        fontFamilyFallback: const [],
      );

  static TextStyle headline6(BuildContext context) => TextStyle(
        textBaseline: TextBaseline.alphabetic,
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: Theme.of(context).colorScheme.tertiary,
        fontFamilyFallback: const [],
      );

  static TextStyle button(BuildContext context) => TextStyle(
        textBaseline: TextBaseline.alphabetic,
        fontWeight: FontWeight.w700,
        fontSize: 18,
        color: Theme.of(context).colorScheme.tertiary,
        fontFamilyFallback: const [],
      );

  static TextStyle subtitle1(BuildContext context) => TextStyle(
        textBaseline: TextBaseline.alphabetic,
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: Theme.of(context).colorScheme.onTertiary,
        fontFamilyFallback: const [],
      );

  static TextStyle subtitle2(BuildContext context) => TextStyle(
        textBaseline: TextBaseline.alphabetic,
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: Theme.of(context).colorScheme.tertiaryContainer,
        fontFamilyFallback: const [],
      );

  static TextStyle buttonText(BuildContext context) => TextStyle(
        textBaseline: TextBaseline.alphabetic,
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: Theme.of(context).colorScheme.tertiary,
        fontFamilyFallback: const [],
      );

  /*<==============================================================>*/
  static TextStyle bodyText1(BuildContext context) => TextStyle(
        textBaseline: TextBaseline.alphabetic,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: Theme.of(context).colorScheme.tertiary,
        fontFamilyFallback: const [],
      );

  static TextStyle bodyText2(BuildContext context) => const TextStyle(
        textBaseline: TextBaseline.alphabetic,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: MColor.textPrimaryColorLight,
        fontFamilyFallback: [],
      );

  static TextStyle caption(BuildContext context) => TextStyle(
        textBaseline: TextBaseline.alphabetic,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: Theme.of(context).colorScheme.tertiary,
        fontFamilyFallback: const [],
      );

  static TextStyle caption2(BuildContext context) => TextStyle(
        textBaseline: TextBaseline.alphabetic,
        fontWeight: FontWeight.w400,
        fontSize: 10,
        color: Theme.of(context).colorScheme.tertiary,
        fontFamilyFallback: const [],
      );
}
