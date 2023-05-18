// ignore_for_file: unused_element
import 'package:go_router/go_router.dart';

import '../screens/home_screen.dart';
import '../screens/static_screen/settings_screen.dart';
import '../screens/user/change_password_screen.dart';
import '../screens/user/forget_password_screen.dart';
import '../screens/user/login_screen.dart';
import '../screens/user/profile_screen.dart';
import '../screens/user/update_profile_screen.dart';
import '../screens/initial_screen.dart';
import '../screens/static_screen/about_screen.dart';
import '../screens/static_screen/contact_screen.dart';
import '../screens/user/register_screen.dart';
import '../screens/user/welcome_screen.dart';


// GoRouter configuration
final routes = GoRouter(
  initialLocation: '/',
  routes: [
    // Loader Screen
    GoRoute(
      path: '/',
      builder: (context, state) => const InitialScreen(),
    ),
    GoRoute(
      path: '/welcome',
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    // User Screen
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/change_password',
      builder: (context, state) => const ChangePasswordScreen(),
    ),
    GoRoute(
      path: '/forget_password',
      builder: (context, state) => const ForgetPasswordScreen(),
    ),
    GoRoute(
      path: '/update_profile',
      builder: (context, state) => const UpdateProfileScreen(),
    ),
    // Static Screen
    GoRoute(
      path: '/about',
      builder: (context, state) => const AboutScreen(),
    ),
    GoRoute(
      path: '/contact',
      builder: (context, state) => const ContactScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),

  ],
);