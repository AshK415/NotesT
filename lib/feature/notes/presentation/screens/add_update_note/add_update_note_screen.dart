import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'widgets/build_form.dart';

class AddUpdateNoteScreen extends HookConsumerWidget {
  const AddUpdateNoteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          BuildForm(
            titleController: titleController,
            descriptionController: descriptionController,
          ),
        ],
      ),
    );
  }
}
