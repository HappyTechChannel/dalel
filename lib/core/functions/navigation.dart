import 'package:go_router/go_router.dart';

void customNavigate(context, String path) {
  GoRouter.of(context).push(path);
}

void customReplacementNavigate(context, String path) {
  GoRouter.of(context).pushReplacement(path);
}
