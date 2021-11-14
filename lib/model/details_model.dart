class DetailModel {
  dynamic adult;
  dynamic backdropPath;
  dynamic budget;
  List<Genres?> genres = [];
  dynamic homepage;
  dynamic id;
  dynamic imdbId;
  dynamic originalLanguage;
  dynamic originalTitle;
  dynamic overview;
  dynamic popularity;
  dynamic posterPath;
  List<ProductionCompanies?>? productionCompanies;
  List<ProductionCountries?>? productionCountries;
  dynamic releaseDate;
  dynamic revenue;
  dynamic runtime;
  List<SpokenLanguages?>? spokenLanguages;
  dynamic status;
  dynamic tagline;
  dynamic title;
  dynamic video;
  dynamic voteAverage;
  dynamic voteCount;
  Credits? credits;

  DetailModel(
      {this.adult,
      this.backdropPath,
      this.budget,
      required this.genres,
      this.homepage,
      this.id,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.productionCompanies,
      this.productionCountries,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.spokenLanguages,
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.credits});

  DetailModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres.add(new Genres.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      productionCompanies = [];
      json['production_companies'].forEach((v) {
        productionCompanies!.add(new ProductionCompanies.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      productionCountries = [];
      json['production_countries'].forEach((v) {
        productionCountries!.add(new ProductionCountries.fromJson(v));
      });
    }
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    if (json['spoken_languages'] != null) {
      spokenLanguages = [];
      json['spoken_languages'].forEach((v) {
        spokenLanguages!.add(new SpokenLanguages.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    credits =
        json['credits'] != null ? new Credits.fromJson(json['credits']) : null;
  }
}

class Genres {
  dynamic id;
  dynamic name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class ProductionCompanies {
  dynamic id;
  dynamic logoPath;
  dynamic name;
  dynamic originCountry;

  ProductionCompanies({this.id, this.logoPath, this.name, this.originCountry});

  ProductionCompanies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }
}

class ProductionCountries {
  dynamic iso31661;
  dynamic name;

  ProductionCountries({this.iso31661, this.name});

  ProductionCountries.fromJson(Map<String, dynamic> json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }
}

class SpokenLanguages {
  dynamic iso6391;
  dynamic name;

  SpokenLanguages({this.iso6391, this.name});

  SpokenLanguages.fromJson(Map<String, dynamic> json) {
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }
}

class Credits {
  List<Cast?>? cast;
  List<Crew?>? crew;

  Credits({this.cast, this.crew});

  Credits.fromJson(Map<String, dynamic> json) {
    if (json['cast'] != null) {
      cast = [];
      json['cast'].forEach((v) {
        cast!.add(new Cast.fromJson(v));
      });
    }
    if (json['crew'] != null) {
      crew = [];
      json['crew'].forEach((v) {
        crew!.add(new Crew.fromJson(v));
      });
    }
  }
}

class Cast {
  dynamic id;
  dynamic knownForDepartment;
  dynamic name;
  dynamic originalName;
  dynamic creditId;

  Cast({
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.creditId,
  });

  Cast.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    creditId = json['credit_id'];
  }
}

class Crew {
  dynamic id;
  dynamic knownForDepartment;
  dynamic name;
  dynamic originalName;
  dynamic popularity;
  dynamic profilePath;
  dynamic creditId;
  dynamic department;
  dynamic job;

  Crew(
      {this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.creditId,
      this.department,
      this.job});

  Crew.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    creditId = json['credit_id'];
    department = json['department'];
    job = json['job'];
  }
}
