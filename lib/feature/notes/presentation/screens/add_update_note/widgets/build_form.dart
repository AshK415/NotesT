import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notest/feature/notes/presentation/components/app_bar.dart';
import 'package:notest/feature/notes/presentation/components/button.dart';
import 'package:notest/feature/notes/presentation/screens/add_update_note/widgets/text_forms.dart';

class BuildForm extends ConsumerWidget {
  const BuildForm(
      {super.key,
      required this.titleController,
      required this.descriptionController});
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: NoteAppBar(
        actions: [
          AppButton(
            child: const Text('Save'),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 8,
        ),
        children: [
          BuildTitleField(titleController: titleController),
          const SizedBox(
            height: 8,
          ),
          BuildDescriptionField(descriptionController: descriptionController),
        ],
      ),
    );
  }
}
