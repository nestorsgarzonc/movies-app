//API Key
//38a229726f7775bfb2a13412bc203940
//Api token v4
//eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzOGEyMjk3MjZmNzc3NWJmYjJhMTM0MTJiYzIwMzk0MCIsInN1YiI6IjVkZDZjNWE1M2ZhYmEwMDAxM2Y3NGM5NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.YYDcGpkyOhndOWkDSN1Cvu1dropJnoekWvWlu1P8GGY

class Peliculas {
  List<Pelicula> items = new List();
  Peliculas();

  Peliculas.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final pelicula = new Pelicula.fromJsonMap(item);
      items.add(pelicula);
    }
  }
}

class Pelicula {
  String uniqueId;
  double popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String title;
  double voteAverage;
  String overview;
  String releaseDate;

  Pelicula({
    this.popularity,
    this.voteCount,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });

  Pelicula.fromJsonMap(Map<String, dynamic> json) {
    popularity = json['popularity'] / 1;
    voteCount = json['vote_count'];
    video = json['video'];
    posterPath = json['poster_path'];
    id = json['id'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    genreIds = json['genre_ids'].cast<int>();
    title = json['title'];
    voteAverage = json['vote_average'] / 1;
    overview = json['overview'];
    releaseDate = json['release_date'];
  }
  getPosterImg(){
    if(posterPath==null){
      return 'http://www.viz.inmersa.co/wp-content/uploads/2016/10/Contenido-no-disponible-05.png';
    }else{
      return 'https://image.tmdb.org/t/p/w500/$posterPath';
    }
  }
  getBackgroundImg(){
    if(posterPath==null){
      return 'http://www.viz.inmersa.co/wp-content/uploads/2016/10/Contenido-no-disponible-05.png';
    }else{
      return 'https://image.tmdb.org/t/p/w500/$backdropPath';
    }
  }
}