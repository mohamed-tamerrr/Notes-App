import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:p/core/theme/app_status_colors.dart';
import 'package:p/core/theme/app_text_styles.dart';
import 'package:p/features/notes/data/cubit/note_cubit.dart';
import 'package:p/features/notes/widgets/list_action_button.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.title,
    required this.id,
    required this.isDone,
  });

  final bool isDone;
  final String title;
  final int id;

  @override
  Widget build(BuildContext context) {
    final AppStatusColors statusColors = Theme.of(
      context,
    ).extension<AppStatusColors>()!;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: statusColors.border),
        color: isDone
            ? Theme.of(context).colorScheme.surface
            : null,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: isDone
                  ? AppTextStyles.listText.copyWith(
                      color: statusColors.textDisabledColor,
                      decoration: TextDecoration.lineThrough,
                    )
                  : AppTextStyles.listText,
            ),
          ),
          const Gap(8),
          ListActionButton(
            label: isDone ? 'Undone' : 'Done',
            backgroundColor: isDone
                ? statusColors.undone
                : statusColors.done,
            onPressed: () => context
                .read<NoteCubit>()
                .toggleDone(id, !isDone),
          ),

          const Gap(8),
          ListActionButton(
            onPressed: () {
              context.read<NoteCubit>().deleteNote(id);
            },
            backgroundColor: statusColors.remove,
            label: 'Remove',
          ),
        ],
      ),
    );
  }
}
