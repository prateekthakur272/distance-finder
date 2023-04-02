import 'package:flutter/cupertino.dart';

class Button extends StatelessWidget {
  final String label;
  final void Function()? onClick;
  const Button({Key? key, required this.label, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(onPressed: onClick,borderRadius: const BorderRadius.all(Radius.circular(12)), child: Text(label));
  }
}
