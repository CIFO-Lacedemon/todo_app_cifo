import 'package:go_router/go_router.dart';
import 'package:todo_app_cifo/modules/todo/ui/pages/todos_page.dart';

enum AppRouter { home }

final goRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: AppRouter.home.name,
      builder: (context, state) {
        return TodosPage();
      },
    ),
  ],
);
