import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notest/feature/notes/domain/domain.dart';

import 'note_card.dart';

class NotesList extends HookConsumerWidget {
  const NotesList({super.key, required this.notes});
  final List<Note> notes;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MasonryGridView.count(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      itemCount: notes.length,
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      itemBuilder: (ctx, idx) {
        final note = notes[idx];
        return NoteCard(
          note: note,
          onTap: () {},
        )
            .animate()
            .fadeIn(delay: const Duration(milliseconds: 100) * idx)
            .moveX(delay: const Duration(milliseconds: 100) * idx);
      },
    );
  }
}
