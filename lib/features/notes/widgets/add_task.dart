import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:p/features/notes/data/cubit/note_cubit.dart';
import 'package:p/features/notes/data/models/note_model.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController _controller =
      TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  NoteModel addNote() {
    final NoteModel note = NoteModel()
      ..date = DateTime.now()
      ..text = _controller.text.trim()
      ..isDone = false;
    return note;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(hintText: 'Add a task'),
          ),
        ),
        const Gap(8),
        FilledButton(
          onPressed: () {
            context.read<NoteCubit>().addNote(addNote());
            _controller.clear();
            FocusScope.of(context).unfocus();
          },
          child: const Text('Add Task'),
        ),
      ],
    );
  }
}
