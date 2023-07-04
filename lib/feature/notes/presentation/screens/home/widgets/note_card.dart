import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:notest/feature/notes/domain/domain.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note, required this.onTap});
  final Note note;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(10),
      color: note.color,
      child: InkWell(
        splashColor: Colors.black12,
        onLongPress: onTap,
        child: Container(
          constraints: const BoxConstraints(maxHeight: 300, minHeight: 100),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: AutoSizeText(
                    note.title ?? '',
                    presetFontSizes: const [16, 14, 12, 10, 8],
                    textScaleFactor: 2,
                    softWrap: true,
                    group: AutoSizeGroup(),
                    overflow: TextOverflow.fade,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  )),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    note.date,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
