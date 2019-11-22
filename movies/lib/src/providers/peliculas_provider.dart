import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:movies/src/models/pelicula_model.dart';

class PeliculasProvider {
  String _apikey = '38a229726f7775bfb2a13412bc203940';
  String _url = 'api.themoviedb.org';
  String _language = 'es-LA';

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apikey, 'language': _language});
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final peliculas = new Peliculas.fromJsonList(decodedData['results']);
    print(peliculas.items[0].title);
    return peliculas.items;
  }
}
