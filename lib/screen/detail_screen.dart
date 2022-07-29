import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex2/model/listpokemon_model.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key, required this.pokemon}) : super(key: key);
  Pokemon pokemon;
  bodyWidget(BuildContext context) => Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width - 20,
            left: 10.0,
            top: MediaQuery.of(context).size.height * 0.1,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 100.0,
                  ),
                  Text(
                    pokemon.name.toString(),
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  Text("Height: ${pokemon.height}"),
                  Text("Weight: ${pokemon.weight}"),
                  Text(
                    "Types",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type!.map((t) {
                      if (t == "Bug") {
                        return Image.asset("assets/elements/Bug.png");
                      } else if (t == "Dark") {
                        return Image.asset("assets/elements/Dark.png");
                      } else if (t == "Dragon") {
                        return Image.asset("assets/elements/Dragon.png");
                      } else if (t == "Electric") {
                        return Image.asset("assets/elements/Electric.png");
                      } else if (t == "Fairy") {
                        return Image.asset("assets/elements/Fairy.png");
                      } else if (t == "Fight") {
                        return Image.asset("assets/elements/Fight.png");
                      } else if (t == "Fire") {
                        return Image.asset("assets/elements/Fire.png");
                      } else if (t == "Flying") {
                        return Image.asset("assets/elements/Flying.png");
                      } else if (t == "Ghost") {
                        return Image.asset("assets/elements/Ghost.png");
                      } else if (t == "Grass") {
                        return Image.asset("assets/elements/Grass.png");
                      } else if (t == "Grass") {
                        return Image.asset("assets/elements/Grass.png");
                      } else if (t == "Ground") {
                        return Image.asset("assets/elements/Ground.png");
                      } else if (t == "Ice") {
                        return Image.asset("assets/elements/Ice.png");
                      } else if (t == "Normal") {
                        return Image.asset("assets/elements/Normal.png");
                      } else if (t == "Poison") {
                        return Image.asset("assets/elements/Poison.png");
                      } else if (t == "Psychic") {
                        return Image.asset("assets/elements/Psychic.png");
                      } else if (t == "Rock") {
                        return Image.asset("assets/elements/Rock.png");
                      } else if (t == "Steel") {
                        return Image.asset("assets/elements/Steel.png");
                      } else {
                        return Image.asset("assets/elements/Water.png");
                      }
                    }).toList(),
                  ),
                  Text("Weakness",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: pokemon.weaknesses!.map((t) {
                          if (t == "Bug") {
                            return Image.asset("assets/elements/Bug.png");
                          } else if (t == "Dark") {
                            return Image.asset("assets/elements/Dark.png");
                          } else if (t == "Dragon") {
                            return Image.asset("assets/elements/Dragon.png");
                          } else if (t == "Electric") {
                            return Image.asset("assets/elements/Electric.png");
                          } else if (t == "Fairy") {
                            return Image.asset("assets/elements/Fairy.png");
                          } else if (t == "Fight") {
                            return Image.asset("assets/elements/Fight.png");
                          } else if (t == "Fire") {
                            return Image.asset("assets/elements/Fire.png");
                          } else if (t == "Flying") {
                            return Image.asset("assets/elements/Flying.png");
                          } else if (t == "Ghost") {
                            return Image.asset("assets/elements/Ghost.png");
                          } else if (t == "Grass") {
                            return Image.asset("assets/elements/Grass.png");
                          } else if (t == "Grass") {
                            return Image.asset("assets/elements/Grass.png");
                          } else if (t == "Ground") {
                            return Image.asset("assets/elements/Ground.png");
                          } else if (t == "Ice") {
                            return Image.asset("assets/elements/Ice.png");
                          } else if (t == "Normal") {
                            return Image.asset("assets/elements/Normal.png");
                          } else if (t == "Poison") {
                            return Image.asset("assets/elements/Poison.png");
                          } else if (t == "Psychic") {
                            return Image.asset("assets/elements/Psychic.png");
                          } else if (t == "Rock") {
                            return Image.asset("assets/elements/Rock.png");
                          } else if (t == "Steel") {
                            return Image.asset("assets/elements/Steel.png");
                          } else {
                            return Image.asset("assets/elements/Water.png");
                          }
                        }).toList(),
                      ),
                    ),
                  ),
                  Text("Next Evolution",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.nextEvolution == null
                        ? <Widget>[Text("This is the final form")]
                        : pokemon.nextEvolution!
                            .map((n) => FilterChip(
                                  backgroundColor: Colors.green,
                                  label: Text(
                                    n.name.toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onSelected: (b) {},
                                ))
                            .toList(),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
                tag: pokemon.img!,
                child: Container(
                  height: 200.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(pokemon.img!),
                    ),
                  ),
                )),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          pokemon.name.toString().toUpperCase(),
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: bodyWidget(context),
    );
  }
}
