import 'package:flutter/material.dart';
import 'package:pokedex2/provider/pokemon_provider.dart';
import 'package:pokedex2/screen/detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PokemonProvider>().fetchPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "POKEAPP",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Consumer<PokemonProvider>(builder: (context, value, child) {
        return GridView.builder(
          itemCount:
              value.pokemon.pokemon == null ? 0 : value.pokemon.pokemon!.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            print(value.pokemon.pokemon![0]);
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailScreen(pokemon: value.pokemon.pokemon![index])),
              ),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Expanded(
                        child: FadeInImage.memoryNetwork(
                          image: value.pokemon.pokemon![index].img!,
                          placeholder: kTransparentImage,
                          key: Key(index.toString()),
                        ),
                      ),
                      Text(value.pokemon.pokemon![index].name!),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
