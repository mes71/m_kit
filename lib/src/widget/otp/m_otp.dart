import 'package:MKit/src/common/m_color.dart';
import 'package:flutter/material.dart';

class MOtp extends StatefulWidget {
  MOtp(
      {super.key,
      this.length = 6,
      required this.onCompleted,
      this.initText,
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
  String? initText;

  @override
  State<MOtp> createState() => _MOtpState();
}

class _MOtpState extends State<MOtp> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;
  int _focusedIndex = -1;

  @override
  void didUpdateWidget(covariant MOtp oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.initText != oldWidget.initText &&
        widget.initText != null &&
        (widget.initText?.isNotEmpty ?? false)) {
      setState(() {
        for (int i = 0; i < widget.length; i++) {
          if (i < widget.initText!.length) {
            _controllers[i].text = widget.initText![i];
            _focusedIndex = i;
          } else {
            _controllers[i].clear();
          }
        }
        _focusedIndex = -1;
        FocusScope.of(context).unfocus();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.length, (index) {
      var editing = TextEditingController();
      if (widget.initText != null && (widget.initText?.isNotEmpty ?? false)) {
        editing.text = widget.initText![index];
      }
      return editing;
    });
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SizedBox(
        height: (widget.height ?? 55) + 10,
        child: ListView.separated(
            itemCount: widget.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (BuildContext context, int index) => SizedBox(
                  width: widget.separator?.toDouble() ?? 10,
                ),
            itemBuilder: (BuildContext context, int index) {
              final isFocused = _focusedIndex == index;
              return AnimatedScale(
                scale: isFocused ? 1.5 : 1.0,
                duration: const Duration(milliseconds: 300),
                child: SizedBox(
                  width: widget.width?.toDouble() ?? 48,
                  height: widget.height?.toDouble() ?? 48,
                  child: TextField(
                    controller: _controllers[index],
                    onTapOutside: (event) {
                      FocusScope.of(context).unfocus();
                      setState(() {
                        _focusedIndex = -1;
                      });
                    },
                    focusNode: _focusNodes[index],
                    onTap: () {
                      setState(() {
                        _focusedIndex = index;
                      });
                    },
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
                          borderSide: _focusNodes[index].hasFocus
                              ? BorderSide(
                                  color: widget.borderSideColor ??
                                      MColor.bgTextFiledBorder,
                                  width:
                                      widget.borderSideWidth?.toDouble() ?? 1.0)
                              : BorderSide.none),
                    ),
                    onChanged: (value) => _onChanged(index, value),
                  ),
                ),
              );
            }),
      ),
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
        setState(() {
          _focusedIndex = index - 1;
        });
      }
    } else {
      if (index < widget.length - 1) {
        _focusNodes[index + 1].requestFocus();
        setState(() {
          _focusedIndex = index + 1;
        });
      }
    }

    final otp = _controllers.map((c) => c.text).join();

    if (otp.length == widget.length) {
      widget.onCompleted(otp);
    }
  }
}
