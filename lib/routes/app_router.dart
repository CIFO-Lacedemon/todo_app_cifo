import 'package:go_router/go_router.dart';
import 'package:todo_app_cifo/modules/todo/ui/pages/todos_details_page.dart';
import 'package:todo_app_cifo/modules/todo/ui/pages/todos_page.dart';

enum AppRouter { home, details }

final goRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: AppRouter.home.name,
      builder: (context, state) {
        return TodosPage();
      },
      routes: [
        GoRoute(
          path: 'details',
          name: AppRouter.details.name,
          builder: (context, state) {
            return TodosDetailsPage(
              // todoDetailsObject: state.extra as TodoDetailsObject,
            );
          },
        ),
      ],
    ),
  ],
);
