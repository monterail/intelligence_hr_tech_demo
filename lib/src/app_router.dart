import 'package:auto_route/auto_route.dart';
import 'package:intelligence_demo_hr_tech/src/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View|Page,Route')
class AutoRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: ColleaguesListRoute.page,
          path: '/',
          initial: true,
        ),
        AutoRoute(
          page: ColleagueDetailsRoute.page,
          path: '/:id',
        ),
      ];
}
