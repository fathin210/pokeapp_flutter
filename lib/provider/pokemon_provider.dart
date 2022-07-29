import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex2/model/listpokemon_model.dart';

class PokemonProvider with ChangeNotifier {
  ListPokemon pokemon = ListPokemon();
  var url = Uri.parse(
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');

  Future fetchPokemon() async {
    var res = await http.get(url);
    Map<String, dynamic> data = json.decode(res.body);

    // Translate dari JSON ke Model
    pokemon = ListPokemon.fromJson(data);
    notifyListeners();
  }
}
