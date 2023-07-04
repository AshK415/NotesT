import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'button.dart';

class NoteAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NoteAppBar({
    super.key,
    this.autoImplementLeading = true,
    this.title,
    this.actions,
    this.systemUiOverlayStyle = SystemUiOverlayStyle.dark,
  });
  final bool autoImplementLeading;
  final String? title;
  final List<Widget>? actions;
  final SystemUiOverlayStyle systemUiOverlayStyle;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: systemUiOverlayStyle,
      child: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: const IconThemeData(color: Colors.white),
          brightness: Brightness.light,
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: SafeArea(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (autoImplementLeading)
                AppButton(
                  child: const Icon(FeatherIcons.chevronLeft),
                  onPressed: () {},
                ),
              (title != null)
                  ? Expanded(
                      child: Text(
                      title!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ))
                  : const Spacer()
            ],
          )),
        )
            .animate()
            .fadeIn(duration: const Duration(milliseconds: 200))
            .slideY(duration: const Duration(milliseconds: 200)),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
