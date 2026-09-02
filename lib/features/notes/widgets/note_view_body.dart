import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:p/core/theme/app_text_styles.dart';
import 'package:p/core/theme/cubit/theme_cubit.dart';
import 'package:p/features/notes/data/cubit/note_cubit.dart';
import 'package:p/features/notes/widgets/add_task.dart';
import 'package:p/features/notes/widgets/footer.dart';
import 'package:p/features/notes/widgets/task_tile.dart';

class NoteViewBody extends StatelessWidget {
  const NoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Daily Todo’s',
                    style: AppTextStyles.heading,
                  ),
                  IconButton(
                    icon: Icon(
                      Theme.of(context).brightness ==
                              Brightness.dark
                          ? Icons.light_mode
                          : Icons.dark_mode,
                    ),
                    onPressed: () =>
                        context.read<ThemeCubit>().toggleTheme(),
                  ),
                ],
              ),
              const Gap(24),
              const AddTask(),
              const Gap(48),
              Expanded(
                child: BlocBuilder<NoteCubit, NoteState>(
                  builder: (context, state) {
                    if (state is NoteFailure) {
                      return Center(child: Text(state.message));
                    }
                    if (state is NoteLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is NoteSuccess) {
                      return ListView.separated(
                        itemCount: state.notes.length + 1,
                        separatorBuilder: (context, index) =>
                            Gap(8),
                        itemBuilder: (context, index) {
                          if (index == state.notes.length) {
                            return Center(child: Footer());
                          }
                          return TaskTile(
                            title:
                                state.notes[index].text ??
                                "Untitled",
                            id: state.notes[index].id,
                            isDone: state.notes[index].isDone!,
                          );
                        },
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
