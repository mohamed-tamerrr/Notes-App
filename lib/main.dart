import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:p/core/theme/app_theme.dart';
import 'package:p/core/database/isar_service.dart';
import 'package:p/core/theme/cubit/theme_cubit.dart';
import 'package:p/features/notes/data/cubit/note_cubit.dart';
import 'package:p/features/notes/data/repo/notes_repo.dart';
import 'package:p/features/notes/views/note_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isar = await IsarService.init();
  runApp(NotesApp(isar: isar));
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key, required this.isar});
  final Isar isar;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(
          create: (_) =>
              NoteCubit(repo: NotesRepo(isar: isar))..getNotes(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeMode,
            builder: (context, child) {
              return GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                behavior: HitTestBehavior.opaque,
                child: child,
              );
            },
            home: const Noteview(),
          );
        },
      ),
    );
  }
}
