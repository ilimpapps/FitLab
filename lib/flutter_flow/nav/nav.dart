import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';

import '/backend/supabase/supabase.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const HomeWidget() : const OnboardingWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const HomeWidget() : const OnboardingWidget(),
        ),
        FFRoute(
          name: 'Home',
          path: '/home',
          builder: (context, params) => const HomeWidget(),
        ),
        FFRoute(
          name: 'Registration',
          path: '/registration',
          builder: (context, params) => const RegistrationWidget(),
        ),
        FFRoute(
          name: 'Login',
          path: '/login',
          builder: (context, params) => const LoginWidget(),
        ),
        FFRoute(
          name: 'Onboarding',
          path: '/onboarding',
          builder: (context, params) => const OnboardingWidget(),
        ),
        FFRoute(
          name: 'FillUserInfo',
          path: '/fillUserInfo',
          builder: (context, params) => const FillUserInfoWidget(),
        ),
        FFRoute(
          name: 'ProfileInfo',
          path: '/profileInfo',
          builder: (context, params) => const ProfileInfoWidget(),
        ),
        FFRoute(
          name: 'Exercices',
          path: '/exercices',
          builder: (context, params) => ExercicesWidget(
            rlCoach: params.getParam(
              'rlCoach',
              ParamType.String,
            ),
            rlClient: params.getParam(
              'rlClient',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'ProfileEdit',
          path: '/profileEdit',
          builder: (context, params) => const ProfileEditWidget(),
        ),
        FFRoute(
          name: 'ForgotPassword',
          path: '/forgotPassword',
          builder: (context, params) => const ForgotPasswordWidget(),
        ),
        FFRoute(
          name: 'ForgotPasswordMessage',
          path: '/forgotPasswordMessage',
          builder: (context, params) => ForgotPasswordMessageWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'ChatsMessages',
          path: '/chatsMessages',
          builder: (context, params) => ChatsMessagesWidget(
            chat: params.getParam<ChatsRow>(
              'chat',
              ParamType.SupabaseRow,
            ),
            training: params.getParam<UsersTrainingsRow>(
              'training',
              ParamType.SupabaseRow,
            ),
            excercise: params.getParam<ExercisesRow>(
              'excercise',
              ParamType.SupabaseRow,
            ),
            rlUsersTraining: params.getParam(
              'rlUsersTraining',
              ParamType.int,
            ),
            trainingDateTime: params.getParam(
              'trainingDateTime',
              ParamType.DateTime,
            ),
            trainingName: params.getParam(
              'trainingName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'ProfileApp',
          path: '/profileApp',
          builder: (context, params) => const ProfileAppWidget(),
        ),
        FFRoute(
          name: 'Training',
          path: '/training',
          builder: (context, params) => TrainingWidget(
            rlUsersTrainings: params.getParam(
              'rlUsersTrainings',
              ParamType.int,
            ),
            isCoachView: params.getParam(
              'isCoachView',
              ParamType.bool,
            ),
            dateTime: params.getParam(
              'dateTime',
              ParamType.DateTime,
            ),
          ),
        ),
        FFRoute(
          name: 'Chats',
          path: '/chats',
          builder: (context, params) => const ChatsWidget(),
        ),
        FFRoute(
          name: 'ExercisesDetails',
          path: '/exercisesDetails',
          builder: (context, params) => ExercisesDetailsWidget(
            rlExercises: params.getParam(
              'rlExercises',
              ParamType.int,
            ),
            rlCoach: params.getParam(
              'rlCoach',
              ParamType.String,
            ),
            rlUser: params.getParam(
              'rlUser',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'DiaryPhoto',
          path: '/diaryPhoto',
          builder: (context, params) => DiaryPhotoWidget(
            rlUser: params.getParam(
              'rlUser',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'PhotoView',
          path: '/photoView',
          builder: (context, params) => PhotoViewWidget(
            progressPhoto: params.getParam<PhotoProgressRow>(
              'progressPhoto',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: 'MyProgress',
          path: '/myProgress',
          builder: (context, params) => MyProgressWidget(
            rlUser: params.getParam(
              'rlUser',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'MyProgressAdd',
          path: '/myProgressAdd',
          builder: (context, params) => MyProgressAddWidget(
            type: params.getParam(
              'type',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'MyProgressChart',
          path: '/myProgressChart',
          builder: (context, params) => MyProgressChartWidget(
            rlUsersMeasurements: params.getParam(
              'rlUsersMeasurements',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'Achievments',
          path: '/achievments',
          builder: (context, params) => const AchievmentsWidget(),
        ),
        FFRoute(
          name: 'CoachList',
          path: '/coachList',
          builder: (context, params) => const CoachListWidget(),
        ),
        FFRoute(
          name: 'ClientsList',
          path: '/clientsList',
          builder: (context, params) => const ClientsListWidget(),
        ),
        FFRoute(
          name: 'CoachInfo',
          path: '/coachInfo',
          builder: (context, params) => CoachInfoWidget(
            coachRow: params.getParam<UsersRow>(
              'coachRow',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: 'PlanToUser',
          path: '/planToUser',
          builder: (context, params) => const PlanToUserWidget(),
        ),
        FFRoute(
          name: 'TrainingTemplates',
          path: '/trainingTemplates',
          builder: (context, params) => const TrainingTemplatesWidget(),
        ),
        FFRoute(
          name: 'TrainingTemplatesAdd1',
          path: '/trainingTemplatesAdd1',
          builder: (context, params) => const TrainingTemplatesAdd1Widget(),
        ),
        FFRoute(
          name: 'TrainingTemplatesAdd2',
          path: '/trainingTemplatesAdd2',
          builder: (context, params) => TrainingTemplatesAdd2Widget(
            name: params.getParam(
              'name',
              ParamType.String,
            ),
            difficulty: params.getParam(
              'difficulty',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'PlanTemplates',
          path: '/planTemplates',
          builder: (context, params) => const PlanTemplatesWidget(),
        ),
        FFRoute(
          name: 'PlanTemplatesAdd1',
          path: '/planTemplatesAdd1',
          builder: (context, params) => const PlanTemplatesAdd1Widget(),
        ),
        FFRoute(
          name: 'PlanTemplatesAdd2',
          path: '/planTemplatesAdd2',
          builder: (context, params) => PlanTemplatesAdd2Widget(
            name: params.getParam(
              'name',
              ParamType.String,
            ),
            trainingCount: params.getParam(
              'trainingCount',
              ParamType.int,
            ),
            difficulty: params.getParam(
              'difficulty',
              ParamType.String,
            ),
            gender: params.getParam<String>(
              'gender',
              ParamType.String,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: 'PlanView',
          path: '/planView',
          builder: (context, params) => PlanViewWidget(
            rlUsers: params.getParam(
              'rlUsers',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'EditTraining',
          path: '/editTraining',
          builder: (context, params) => const EditTrainingWidget(),
        ),
        FFRoute(
          name: 'EditPlan1stStep',
          path: '/editPlan1stStep',
          builder: (context, params) => const EditPlan1stStepWidget(),
        ),
        FFRoute(
          name: 'EditPlan2ndStep',
          path: '/editPlan2ndStep',
          builder: (context, params) => const EditPlan2ndStepWidget(),
        ),
        FFRoute(
          name: 'PlanToUserAdd1',
          path: '/planToUserAdd1',
          builder: (context, params) => PlanToUserAdd1Widget(
            usersName: params.getParam(
              'usersName',
              ParamType.String,
            ),
            usersSurname: params.getParam(
              'usersSurname',
              ParamType.String,
            ),
            usersPhotoUrl: params.getParam(
              'usersPhotoUrl',
              ParamType.String,
            ),
            rlUsers: params.getParam(
              'rlUsers',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'PlanToUserAdd2',
          path: '/planToUserAdd2',
          builder: (context, params) => PlanToUserAdd2Widget(
            trainingsCount: params.getParam(
              'trainingsCount',
              ParamType.int,
            ),
            usersName: params.getParam(
              'usersName',
              ParamType.String,
            ),
            usersSurname: params.getParam(
              'usersSurname',
              ParamType.String,
            ),
            rlUsers: params.getParam(
              'rlUsers',
              ParamType.String,
            ),
            endDate: params.getParam(
              'endDate',
              ParamType.DateTime,
            ),
          ),
        ),
        FFRoute(
          name: 'ClientProfileView',
          path: '/clientProfileView',
          builder: (context, params) => ClientProfileViewWidget(
            userRow: params.getParam<UsersRow>(
              'userRow',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: 'TrainingReport',
          path: '/trainingReport',
          builder: (context, params) => TrainingReportWidget(
            passedTraining: params.getParam<PassedTrainingsRow>(
              'passedTraining',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: 'TrainingTemplatesEdit',
          path: '/trainingTemplatesEdit',
          builder: (context, params) => TrainingTemplatesEditWidget(
            exerciesesList: params.getParam<CoachTrainingsExercisesRow>(
              'exerciesesList',
              ParamType.SupabaseRow,
              isList: true,
            ),
            idTraning: params.getParam(
              'idTraning',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'Archive',
          path: '/archive',
          builder: (context, params) => const ArchiveWidget(),
        ),
        FFRoute(
          name: 'TrainingCopy',
          path: '/trainingCopy',
          builder: (context, params) => TrainingCopyWidget(
            rlUsersTrainings: params.getParam(
              'rlUsersTrainings',
              ParamType.int,
            ),
            isCoachView: params.getParam(
              'isCoachView',
              ParamType.bool,
            ),
            dateTime: params.getParam(
              'dateTime',
              ParamType.DateTime,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/onboarding';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: const Color(0xFF0C0B12),
                  child: Center(
                    child: Image.asset(
                      'assets/images/splash.png',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
