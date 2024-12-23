import 'package:flutter/material.dart';

class MOtp extends StatefulWidget {
  const MOtp({
    super.key,
    this.length = 6,
    required this.onCompleted,
  });

  final int length;
  final void Function(String) onCompleted;

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
      height: 65,
      child: ListView.builder(
          itemCount: widget.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) => Container(
                padding: const EdgeInsets.all(8),
                width: 60,
                height: 60,
                child: TextField(
                  focusNode: _focusNodes[index],
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18),
                  decoration: const InputDecoration(
                    counterText: "", // Hides the maxLength counter
                    border: OutlineInputBorder(),
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
