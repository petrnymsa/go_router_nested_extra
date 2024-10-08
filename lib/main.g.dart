// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $mainRoute,
      $messageRoute,
    ];

RouteBase get $mainRoute => GoRouteData.$route(
      path: '/',
      name: 'main',
      factory: $MainRouteExtension._fromState,
    );

extension $MainRouteExtension on MainRoute {
  static MainRoute _fromState(GoRouterState state) => MainRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $messageRoute => GoRouteData.$route(
      path: '/messages',
      name: 'messages',
      factory: $MessageRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'detail',
          name: 'detail',
          factory: $DetailMessageRouteExtension._fromState,
        ),
      ],
    );

extension $MessageRouteExtension on MessageRoute {
  static MessageRoute _fromState(GoRouterState state) => MessageRoute(
        $extra: state.extra as MessagesList,
      );

  String get location => GoRouteData.$location(
        '/messages',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

extension $DetailMessageRouteExtension on DetailMessageRoute {
  static DetailMessageRoute _fromState(GoRouterState state) =>
      DetailMessageRoute(
        $extra: state.extra as Message,
      );

  String get location => GoRouteData.$location(
        '/messages/detail',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}
