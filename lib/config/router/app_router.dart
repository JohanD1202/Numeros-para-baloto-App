import 'package:go_router/go_router.dart';
import 'package:numeros_para_baloto_app/presentation/screens/miloto_screen.dart';
import 'package:numeros_para_baloto_app/presentation/screens/screens_barrel.dart';
import 'package:numeros_para_baloto_app/presentation/shared/menus/menu_interior.dart';
import 'package:numeros_para_baloto_app/presentation/shared/menus/menu_interior2.dart';
import 'package:numeros_para_baloto_app/presentation/shared/menus/menu_interior3.dart';


final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: InicioScreen.name,
      builder: (context, state) => const InicioScreen(),
    ),
    GoRoute(
      path: '/menu',
      name: MenuScreen.name,
      builder: (context, state) => const MenuScreen(),
    ),
    GoRoute(
      path: '/baloto',
      name: BalotoScreen.name,
      builder: (context, state) => const BalotoScreen(),
    ),
    GoRoute(
      path: '/revancha',
      name: RevanchaScreen.name,
      builder: (context, state) => const RevanchaScreen(),
    ),
    GoRoute(
      path: '/resultados',
      name: ResultadosScreen.name,
      builder: (context, state) => ResultadosScreen(),
    ),
    GoRoute(
      path: '/miloto',
      name: MilotoScreen.name,
      builder: (context, state) => const MilotoScreen(),
    ),
    GoRoute(
      path: '/menuInterior',
      name: MenuInterior.name,
      builder: (context, state) => MenuInterior(),
    ),
    GoRoute(
      path: '/menuInterior2',
      name: MenuInterior2.name,
      builder: (context, state) => MenuInterior2(),
    ),
    GoRoute(
      path: '/menuInterior3',
      name: MenuInterior3.name,
      builder: (context, state) => MenuInterior3(),
    ),
  ]
);