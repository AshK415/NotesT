import 'package:flutter/material.dart';

class BuildTitleField extends StatelessWidget {
  const BuildTitleField({super.key, required this.titleController});
  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextField(
          controller: titleController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
            counterText: '',
          ),
          minLines: 1,
          onChanged: (value) {},
        ),
      ],
    );
  }
}

class BuildDescriptionField extends StatelessWidget {
  const BuildDescriptionField({super.key, required this.descriptionController});
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextField(
          controller: descriptionController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
          ),
          minLines: 2,
          maxLines: 100,
          onChanged: (value) {},
        ),
      ],
    );
  }
}
