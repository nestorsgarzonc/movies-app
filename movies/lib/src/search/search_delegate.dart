import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    //Acciones de nuestro AppBar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query="";
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
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //Sugerencias busqueda
    return Container();
  }
}
