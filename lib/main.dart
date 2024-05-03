import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_storage_todos_api/local_storage_todos_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolistapp/edit_project/view/edit_project_page.dart';
import 'package:todolistapp/project_overview/bloc/project_overview_bloc.dart';
import 'package:todolistapp/screens/home_screen.dart';
import 'package:todolistapp/screens/let_start_screen.dart';
import 'package:todolistapp/screens/login_screen.dart';
import 'package:todolistapp/screens/today_tasks_screen.dart';
import 'package:todolistapp/screens/view_projects_screen.dart';
import 'package:todolistapp/screens/view_tasks_screen.dart';
import 'package:todos_repository/todos_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(
    // You can also use a `ReCaptchaEnterpriseProvider` provider instance as an
    // argument for `webProvider`
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    // Default provider for Android is the Play Integrity provider. You can use the "AndroidProvider" enum to choose
    // your preferred provider. Choose from:
    // 1. Debug provider
    // 2. Safety Net provider
    // 3. Play Integrity provider
    androidProvider: AndroidProvider.debug,
    // Default provider for iOS/macOS is the Device Check provider. You can use the "AppleProvider" enum to choose
    // your preferred provider. Choose from:
    // 1. Debug provider
    // 2. Device Check provider
    // 3. App Attest provider
    // 4. App Attest provider with fallback to Device Check provider (App Attest provider is only available on iOS 14.0+, macOS 14.0+)
    appleProvider: AppleProvider.appAttest,
  );
  final projectApi =
      LocalStorageTodosApi(plugin: await SharedPreferences.getInstance());
  final projectRepository = ProjectsRepository(projectsApi: projectApi);
  runApp(TodoListApp(projectsRepository: projectRepository));
}

class TodoListApp extends StatelessWidget {
  const TodoListApp({required this.projectsRepository, super.key});
  final ProjectsRepository projectsRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: projectsRepository,
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light()
          .copyWith(textButtonTheme: const TextButtonThemeData()),
      initialRoute: LetStartScreen.id,
      routes: {
        LetStartScreen.id: (context) => const LetStartScreen(),
        EditProjectPage.id: (context) => const EditProjectPage(),
        TodayTasksScreen.id: (context) => TodayTasksScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        ViewProjectsScreen.id: (context) => const ViewProjectsScreen(),
        ViewTasksScreen.id: (context) => const ViewTasksScreen(),
      },
    );
  }
}
