import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_adopt_app/providers/pets_provider.dart';
import 'package:provider/provider.dart';

import 'pages/add_pet_page.dart';
import 'pages/pets_list_page.dart';

void main() {
  runApp(const MyApp());
}

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => PetsListPage(),
  ),
  GoRoute(
    path: '/add',
    builder: (context, state) => AddPetPage(),
  ),
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PetsProvider()),
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
