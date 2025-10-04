import 'package:curaa/features/delivary/ui/delivery_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/buttom_nav_bar/logic/button_nav_bar_cubit.dart';
import '../../features/buttom_nav_bar/ui/bottom_nav_bar.dart';
import '../../features/login/ui/login_screen.dart';
import '../../features/map/ui/map_screen.dart';
import '../../features/on_boarding/ui/on_boarding_screen.dart';
import '../../features/register/ui/sign_up_screen.dart';
import '../../features/splash/splash_screen.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/splash':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/onBoarding':
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case '/signUp':
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/buttonNav':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ButtonNavBarCubit(),
            child: const BottomNavBar(),
          ),
        );
      case '/delivery':
        return MaterialPageRoute(builder: (_) => DeliveryScreen());
      case '/map':
        return MaterialPageRoute(builder: (_) => MapScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No Route Found${settings.name}')),
          ),
        );
    }
  }
}
