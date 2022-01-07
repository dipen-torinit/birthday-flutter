import 'package:flutter/material.dart';

class ProgressButton extends StatefulWidget {
  final String label;
  final VoidCallback callback;
  final bool showProgress;

  const ProgressButton(
      {Key? key,
      required this.label,
      required this.callback,
      required this.showProgress})
      : super(key: key);

  @override
  State<ProgressButton> createState() => _ProgressButtonState();
}

class _ProgressButtonState extends State<ProgressButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
          child: Text(
            widget.label,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          onPressed: () => {widget.callback()},
        ),
      ],
    );
  }
}
