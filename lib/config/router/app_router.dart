import 'package:go_router/go_router.dart';
import 'package:numeros_para_baloto_app/presentation/screens/baloto_screen.dart';
import 'package:numeros_para_baloto_app/presentation/screens/generador_numeros_baloto_screen.dart';
import 'package:numeros_para_baloto_app/presentation/screens/inicio_screen.dart';
import 'package:numeros_para_baloto_app/presentation/screens/menu_screens.dart';
import 'package:numeros_para_baloto_app/presentation/screens/mi_loto_screen.dart';
import 'package:numeros_para_baloto_app/presentation/screens/revancha_screen.dart';


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
      path: '/mi_loto',
      name: MiLotoScreen.name,
      builder: (context, state) => const MiLotoScreen(),
    ),

    GoRoute(
      path: '/generador_numeros_baloto',
      name: GeneradorNumerosBalotoScreen.name,
      builder: (context, state) => const GeneradorNumerosBalotoScreen(),
    ),






  ]
);

