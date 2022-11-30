import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_adopt_app/models/pet_model.dart';
import 'package:my_adopt_app/pages/edit_pet_page.dart';
import 'package:my_adopt_app/pages/signup_page.dart';
import 'package:my_adopt_app/providers/auth_provider.dart';
import 'package:my_adopt_app/providers/pets_provider.dart';
import 'package:provider/provider.dart';

import 'pages/add_pet_page.dart';
import 'pages/pets_list_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var authProvider = AuthProvider();
  var isAuth = await authProvider.hasToken();

  print("isAuth $isAuth");

  runApp(MyApp(
    authProvider: authProvider,
    initialRoute: isAuth ? "/list" : "/",
  ));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  final AuthProvider authProvider;
  MyApp({
    required this.authProvider,
    required this.initialRoute,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = GoRouter(initialLocation: initialRoute, routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SignupPage(),
      ),
      GoRoute(
        path: '/list',
        builder: (context, state) => PetsListPage(),
      ),
      GoRoute(
        path: '/add',
        builder: (context, state) => AddPetPage(),
      ),
      GoRoute(
        path: '/edit',
        builder: (context, state) => EditPetPage(
          pet: state.extra as PetModel,
        ),
      ),
    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PetsProvider()),
        ChangeNotifierProvider(create: (context) => authProvider),
      ],
      child: MaterialApp.router(
        title: 'Pet Adoption App',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        routerConfig: router,
      ),
    );
  }
}
