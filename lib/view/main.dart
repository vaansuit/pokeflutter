import 'package:flutter/material.dart';

import '../model/repository/pokemon_repository.dart';
import '../presenter/pokemon_presenter.dart';
import 'detalhe/detail_page.dart';
import 'home/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  final repository = PokemonRepository();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => PokemonPresenter(repository),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/pokemonPage': (context) => const DetailPage(),
      },
      initialRoute: '/',
    );
  }
}
