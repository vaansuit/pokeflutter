import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../presenter/pokemon_presenter.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = true;
  late PokemonPresenter presenter;
  @override
  void initState() {
    presenter = context.read<PokemonPresenter>();
    presenter.getPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pokedex'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.network(
                'https://raw.githubusercontent.com/RafaelBarbosatec/SimplePokedex/master/assets/pokebola_img.png',
              ),
            ),
          ],
        ),
        body: Stack(children: [
          Consumer<PokemonPresenter>(builder: (_, present, widget) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                ),
                itemCount: presenter.pokemonList.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: Image.network(
                        presenter.pokemonList[index].thumbnailImage ?? ''),
                  );
                });
          })
        ]));
  }
}
