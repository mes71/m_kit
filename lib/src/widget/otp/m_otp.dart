import 'package:MKit/src/common/m_color.dart';
import 'package:flutter/material.dart';

class MOtp extends StatefulWidget {
  MOtp(
      {super.key,
      this.length = 6,
      required this.onCompleted,
      this.width,
      this.height,
      this.separator,
      this.textStyle,
      this.filled,
      this.filledColor,
      this.borderSideWidth,
      this.borderSideColor});

  final int length;
  final void Function(String) onCompleted;
  Color? borderSideColor;
  int? borderSideWidth;
  int? separator;
  int? width;
  int? height;
  TextStyle? textStyle;
  bool? filled;
  Color? filledColor;

  @override
  State<MOtp> createState() => _MOtpState();
}

class _MOtpState extends State<MOtp> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (widget.height ?? 55) + 10,
      child: ListView.separated(
          itemCount: widget.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (BuildContext context, int index) => SizedBox(
                width: widget.separator?.toDouble() ?? 10,
              ),
          itemBuilder: (BuildContext context, int index) => SizedBox(
                width: widget.width?.toDouble() ?? 48,
                height: widget.height?.toDouble() ?? 48,
                child: TextField(
                  focusNode: _focusNodes[index],
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  style: widget.textStyle ?? const TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    filled: widget.filled ?? true,
                    fillColor: widget.filledColor ?? MColor.bgTextFiled,
                    contentPadding: const EdgeInsets.all(2),
                    counterText: "",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: widget.borderSideColor ??
                                MColor.bgTextFiledBorder,
                            width: widget.borderSideWidth?.toDouble() ?? 1.0)),
                  ),
                  onChanged: (value) => _onChanged(index, value),
                ),
              )),
    );
  }

  @override
  void dispose() {
    for (var e in _controllers) {
      e.dispose();
    }

    for (var e in _focusNodes) {
      e.dispose();
    }
    super.dispose();
  }

  void _onChanged(int index, String value) {
    if (value.isEmpty) {
      if (index > 0) {
        _focusNodes[index - 1].requestFocus();
      }
    } else {
      if (index < widget.length - 1) {
        _focusNodes[index + 1].requestFocus();
      }
    }

    final otp = _controllers.map((c) => c.text).join();

    if (otp.length == widget.length) {
      widget.onCompleted(otp);
    }
  }
}
