import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.isLoading = false,
  });
  final Widget? child;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
        style: TextStyle(),
        child: GestureDetector(
          onTap: onPressed,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (child, animation) => ScaleTransition(
              scale: animation,
              child: child,
            ),
            child: Container(
              padding: const EdgeInsets.all(8),
              height: 40,
              constraints: const BoxConstraints(minWidth: 40),
              decoration: BoxDecoration(
                color: const Color(0xff444444),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                key: ValueKey(isLoading),
                child: isLoading ? const Text('Saving.. ') : child,
              ),
            ),
          ),
        ));
  }
}
