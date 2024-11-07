import 'package:MKit/src/widget/common/m_color.dart';
import 'package:MKit/src/widget/common/m_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
class MTextField extends StatefulWidget {
  MTextField(
      {super.key,
      this.maxLines,
      this.maxLength,
      this.hintText,
      this.padding,
      this.onChanged,
      this.onSubmitted,
      this.keyboardType,
      this.showCounter = false,
      this.isDense,
      this.initText,
      this.isForNumber = false,
      this.style,
      this.suffixIcon,
      this.validator,
      this.readonly = false,
      this.boxConstraints,
      this.minLines,
      this.radius,
      this.filled,
      this.enabled,
      this.label}) {
    filled = filled ?? false;
    obscure = false;
    _inputBorder = OutlineInputBorder(
        borderSide: const BorderSide(color: MColor.borderPrimary),
        borderRadius: BorderRadius.circular(radius ?? 16));
  }

  MTextField.noBorder(
      {super.key,
      this.maxLines,
      this.maxLength,
      this.hintText,
      this.padding,
      this.onChanged,
      this.onSubmitted,
      this.keyboardType,
      this.showCounter = false,
      this.isDense,
      this.initText,
      this.style,
      this.suffixIcon,
      this.radius,
      this.validator,
      this.boxConstraints,
      this.minLines,
      this.isForNumber = false,
      this.readonly = false,
      this.label,
      this.filled,
      this.enabled}) {
    _inputBorder = OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(radius ?? 16));
    obscure = false;
    filled = filled ?? true;
  }

  MTextField.password(
      {super.key,
      this.maxLines = 1,
      this.maxLength,
      this.hintText,
      this.padding,
      this.onChanged,
      this.onSubmitted,
      this.keyboardType,
      this.showCounter = false,
      this.isDense,
      this.initText,
      this.style,
      this.suffixIcon,
      this.prefixIcon,
      this.radius,
      this.validator,
      this.boxConstraints,
      this.minLines,
      this.isForNumber = false,
      this.readonly = false,
      this.label,
      this.filled,
      this.enabled}) {
    _inputBorder = OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(radius ?? 16));
    filled = filled ?? true;
    obscure = true;
    _isPassword = true;
    prefixIcon = prefixIcon ?? const Icon(CupertinoIcons.person);
  }

  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final String? hintText;
  final String? label;
  final EdgeInsets? padding;
  final TextStyle? style;
  final bool showCounter;
  final bool? isDense;
  final bool? isForNumber;
  final bool readonly;
  bool? obscure;
  final bool? enabled;
  final double? radius;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final FormFieldValidator? validator;
  final String? initText;
  Widget? suffixIcon;
  Widget? prefixIcon;
  bool? filled;
  bool _isPassword = false;

  final BoxConstraints? boxConstraints;
  late final InputBorder? _inputBorder;

  @override
  State<MTextField> createState() => _MTextFieldState();
}

class _MTextFieldState extends State<MTextField> {
  final TextEditingController _controller = TextEditingController();
  bool? obscure;

  @override
  void initState() {
    super.initState();
    if (widget.initText != null) {
      _controller.text = widget.initText!;
    }
    obscure = widget.obscure;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: widget.padding ?? const EdgeInsets.symmetric(vertical: 6.0),
        child: TextFormField(
          controller: _controller,
          readOnly: widget.readonly,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          onChanged: widget.onChanged,
          validator: widget.validator,
          enabled: widget.enabled,
          obscureText: obscure ?? false,
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          onFieldSubmitted: widget.onSubmitted,
          maxLength: widget.maxLength,
          textDirection:
              widget._isPassword ? TextDirection.ltr : TextDirection.rtl,
          style: widget.style ?? MTextStyle.bodyText2(context),
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
              errorStyle: MTextStyle.caption2(context),
              errorMaxLines: 1,
              isDense: widget.isDense,
              suffixIcon: widget.suffixIcon ??
                  (widget._isPassword
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              obscure = !obscure!;
                            });
                          },
                          icon: Icon(!obscure!
                              ? CupertinoIcons.eye_slash
                              : CupertinoIcons.eye))
                      : null),
              suffixIconConstraints: widget.boxConstraints,
              prefixIcon: widget.prefixIcon,
              prefixIconConstraints: widget.boxConstraints,
              hintText: widget.hintText,
              labelText: widget.label,
              filled: widget.filled,
              counter: widget.showCounter ? null : const SizedBox(),
              hintStyle: MTextStyle.bodyText2(context),
              enabledBorder: widget._inputBorder,
              focusedBorder: widget._inputBorder,
              border: widget._inputBorder),
        ));
  }
}
