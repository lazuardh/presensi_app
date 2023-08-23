import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.onPress,
    required this.backgroundColor,
    required this.child,
  });

  final Widget child;
  final Color backgroundColor;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: Container(
          width: size.width * 0.8,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(29),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
