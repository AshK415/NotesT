import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notest/feature/notes/presentation/components/app_bar.dart';
import 'package:notest/feature/notes/presentation/screens/home/providers/notes_provider.dart';
import 'package:notest/feature/notes/presentation/screens/home/widgets/notes_list.dart';
import 'package:notest/shared/routes/app_routes.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesRef = ref.watch(getNotesProvider);
    return Scaffold(
      appBar: const NoteAppBar(
        systemUiOverlayStyle: SystemUiOverlayStyle.light,
        autoImplementLeading: false,
        title: 'FNotes',
        actions: [],
      ),
      body: notesRef.when(
          data: (snapshot) {
            if (snapshot.isEmpty) {
              return const Center(
                child: Text('Start adding notes'),
              );
            }
            return NotesList(notes: snapshot);
          },
          error: (_, __) => const Center(
                child: Text('Error occured while loading notes'),
              ),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Note',
        onPressed: () {
          ref.read(routerProvider).go(AddUpdateRoute.path);
        },
        child: const Icon(FeatherIcons.plus),
      )
          .animate(delay: const Duration(milliseconds: 200))
          .fadeIn()
          .slideX(begin: 1),
    );
  }
}
