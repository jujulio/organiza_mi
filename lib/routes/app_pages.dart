import 'package:organiza_mi/routes/app_routes.dart';
import 'package:organiza_mi/screens/categoria/categoria_page.dart';
import 'package:organiza_mi/screens/home/home_screen.dart';
import 'package:organiza_mi/screens/rotina/criar_rotina.dart';
import 'package:organiza_mi/screens/rotina/rotina_page.dart';

class AppPages {
  static final routes = {
    AppRoutes.HOME: (context) => const HomeScreen(),
    AppRoutes.ROTINA: (context) => const RotinaPage(),
    AppRoutes.CRIAR_ROTINA: (context) => const CriarRotina(rotinaDoc: null),
    //AppRoutes.TASK:(context) => const TaskPage(),
    //AppRoutes.CREATE_TASK:(context) => const CreateTask(),
    AppRoutes.CATEGORIA: (context) => const CategoriaPage(),
  };
}
