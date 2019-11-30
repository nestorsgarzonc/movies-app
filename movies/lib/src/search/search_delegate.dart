import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  String _seleccion = " ";
  final peliculas = [
    'Cap america',
    'Batman',
    'Spiderman',
    'Wonder woman',
    'light green',
  ];
  final peliculasRecientes = [
    'Spiderman',
    'Wonder woman',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    //Acciones de nuestro AppBar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //Icono a la izquierda
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //Resultados
    return Center(
      child: Container(
        height: 100,
        color: Colors.blueAccent,
        width: 100,
        child: Text(_seleccion),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final listaSugerida = (query.isEmpty)
        ? peliculasRecientes
        : peliculas
            .where((p) => p.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
    //Sugerencias busqueda
    return ListView.builder(
      itemCount: listaSugerida.length,
      itemBuilder: (context, i) {
        return ListTile(
          leading: Icon(Icons.movie),
          title: Text(listaSugerida[i]),
          onTap: () {
            _seleccion=listaSugerida[i];
            showResults(context);
          },
        );
      },
    );
  }
}
