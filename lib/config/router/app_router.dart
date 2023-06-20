import 'package:go_router/go_router.dart';
import 'package:river_app/preSentation/screens/screens.dart';

final appRouter = GoRouter(
    // initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: '/state',
        builder: (context, state) {
          return const StateProviderScreen();
        },
      ),
      GoRoute(
        path: '/future',
        builder: (context, state) {
          return const PokemonScreen();
        },
      ),
      GoRoute(
        path: '/stream',
        builder: (context, state) {
          return const StreamScreen();
        },
      ),
      GoRoute(
        path: '/state-notifier',
        builder: (context, state) {
          return const TodosScreen();
        },
      ),
    ]);
