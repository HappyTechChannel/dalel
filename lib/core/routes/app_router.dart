import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/views/forgot_password_view.dart';
import 'package:dalel/features/auth/presentation/views/sign_in_view.dart';
import 'package:dalel/features/auth/presentation/views/sign_up_view.dart';
import 'package:dalel/features/home/data/models/historical_periods_model.dart';
import 'package:dalel/features/home/presentation/views/historical_periods_details_view.dart';
import 'package:dalel/features/home/presentation/widgets/home_nav_bar_widget.dart';
import 'package:dalel/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:dalel/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: "/onBoarding",
      builder: (context, state) => const OnBoardingView(),
    ),
    GoRoute(
      path: "/signUp",
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(),
        child: const SignUpView(),
      ),
    ),
    GoRoute(
      path: "/signIn",
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(),
        child: const SignInView(),
      ),
    ),
    GoRoute(
      path: "/forgotPassword",
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(),
        child: const ForgotPasswordView(),
      ),
    ),
    GoRoute(
      path: "/homeNavBar",
      builder: (context, state) => const HomeNavBarWidget(),
    ),
    GoRoute(
      path: "/historicalPeriodsDetailsView",
      builder: (context, state) => HistoricalPeriodsDetailsView(
          model: state.extra as HistoricalPeriodsModel),
    ),
  ],
);
