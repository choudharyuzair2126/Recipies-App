// ignore_for_file: no_leading_underscores_for_local_identifiers

class RecipieApi {
  List<Meals>? meals;

  RecipieApi({this.meals});

  RecipieApi.fromJson(Map<String, dynamic> json) {
    meals = json["meals"] == null
        ? null
        : (json["meals"] as List).map((e) => Meals.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (meals != null) {
      _data["meals"] = meals?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Meals {
  String? idMeal;
  String? strMeal;
  dynamic strDrinkAlternate;
  String? strCategory;
  String? strArea;
  String? strInstructions;
  String? strMealThumb;
  String? strTags;
  String? strYoutube;
  String? strIngredient1;
  String? strIngredient2;
  String? strIngredient3;
  String? strIngredient4;
  String? strIngredient5;
  String? strIngredient6;
  String? strIngredient7;
  String? strIngredient8;
  String? strIngredient9;
  String? strIngredient10;
  String? strIngredient11;
  String? strIngredient12;
  String? strIngredient13;
  String? strIngredient14;
  String? strIngredient15;
  String? strIngredient16;
  String? strIngredient17;
  String? strIngredient18;
  String? strIngredient19;
  String? strIngredient20;
  String? strMeasure1;
  String? strMeasure2;
  String? strMeasure3;
  String? strMeasure4;
  String? strMeasure5;
  String? strMeasure6;
  String? strMeasure7;
  String? strMeasure8;
  String? strMeasure9;
  String? strMeasure10;
  String? strMeasure11;
  String? strMeasure12;
  String? strMeasure13;
  String? strMeasure14;
  String? strMeasure15;
  String? strMeasure16;
  String? strMeasure17;
  String? strMeasure18;
  String? strMeasure19;
  String? strMeasure20;
  String? strSource;
  dynamic strImageSource;
  dynamic strCreativeCommonsConfirmed;
  dynamic dateModified;

  Meals(
      {this.idMeal,
      this.strMeal,
      this.strDrinkAlternate,
      this.strCategory,
      this.strArea,
      this.strInstructions,
      this.strMealThumb,
      this.strTags,
      this.strYoutube,
      this.strIngredient1,
      this.strIngredient2,
      this.strIngredient3,
      this.strIngredient4,
      this.strIngredient5,
      this.strIngredient6,
      this.strIngredient7,
      this.strIngredient8,
      this.strIngredient9,
      this.strIngredient10,
      this.strIngredient11,
      this.strIngredient12,
      this.strIngredient13,
      this.strIngredient14,
      this.strIngredient15,
      this.strIngredient16,
      this.strIngredient17,
      this.strIngredient18,
      this.strIngredient19,
      this.strIngredient20,
      this.strMeasure1,
      this.strMeasure2,
      this.strMeasure3,
      this.strMeasure4,
      this.strMeasure5,
      this.strMeasure6,
      this.strMeasure7,
      this.strMeasure8,
      this.strMeasure9,
      this.strMeasure10,
      this.strMeasure11,
      this.strMeasure12,
      this.strMeasure13,
      this.strMeasure14,
      this.strMeasure15,
      this.strMeasure16,
      this.strMeasure17,
      this.strMeasure18,
      this.strMeasure19,
      this.strMeasure20,
      this.strSource,
      this.strImageSource,
      this.strCreativeCommonsConfirmed,
      this.dateModified});

  Meals.fromJson(Map<String, dynamic> json) {
    idMeal = json["idMeal"];
    strMeal = json["strMeal"];
    strDrinkAlternate = json["strDrinkAlternate"];
    strCategory = json["strCategory"];
    strArea = json["strArea"];
    strInstructions = json["strInstructions"];
    strMealThumb = json["strMealThumb"];
    strTags = json["strTags"];
    strYoutube = json["strYoutube"];
    strIngredient1 = json["strIngredient1"];
    strIngredient2 = json["strIngredient2"];
    strIngredient3 = json["strIngredient3"];
    strIngredient4 = json["strIngredient4"];
    strIngredient5 = json["strIngredient5"];
    strIngredient6 = json["strIngredient6"];
    strIngredient7 = json["strIngredient7"];
    strIngredient8 = json["strIngredient8"];
    strIngredient9 = json["strIngredient9"];
    strIngredient10 = json["strIngredient10"];
    strIngredient11 = json["strIngredient11"];
    strIngredient12 = json["strIngredient12"];
    strIngredient13 = json["strIngredient13"];
    strIngredient14 = json["strIngredient14"];
    strIngredient15 = json["strIngredient15"];
    strIngredient16 = json["strIngredient16"];
    strIngredient17 = json["strIngredient17"];
    strIngredient18 = json["strIngredient18"];
    strIngredient19 = json["strIngredient19"];
    strIngredient20 = json["strIngredient20"];
    strMeasure1 = json["strMeasure1"];
    strMeasure2 = json["strMeasure2"];
    strMeasure3 = json["strMeasure3"];
    strMeasure4 = json["strMeasure4"];
    strMeasure5 = json["strMeasure5"];
    strMeasure6 = json["strMeasure6"];
    strMeasure7 = json["strMeasure7"];
    strMeasure8 = json["strMeasure8"];
    strMeasure9 = json["strMeasure9"];
    strMeasure10 = json["strMeasure10"];
    strMeasure11 = json["strMeasure11"];
    strMeasure12 = json["strMeasure12"];
    strMeasure13 = json["strMeasure13"];
    strMeasure14 = json["strMeasure14"];
    strMeasure15 = json["strMeasure15"];
    strMeasure16 = json["strMeasure16"];
    strMeasure17 = json["strMeasure17"];
    strMeasure18 = json["strMeasure18"];
    strMeasure19 = json["strMeasure19"];
    strMeasure20 = json["strMeasure20"];
    strSource = json["strSource"];
    strImageSource = json["strImageSource"];
    strCreativeCommonsConfirmed = json["strCreativeCommonsConfirmed"];
    dateModified = json["dateModified"];
  }

  get strIngredient => [
        strIngredient1,
        strIngredient2,
        strIngredient3,
        strIngredient4,
        strIngredient5,
        strIngredient6,
        strIngredient7,
        strIngredient8,
        strIngredient9,
        strIngredient10,
        strIngredient11,
        strIngredient12,
        strIngredient13,
        strIngredient14,
        strIngredient15,
        strIngredient16,
        strIngredient17,
        strIngredient18,
        strIngredient19,
        strIngredient20,
      ];

  get strMeasure => [
        strMeasure1,
        strMeasure2,
        strMeasure3,
        strMeasure4,
        strMeasure5,
        strMeasure6,
        strMeasure7,
        strMeasure8,
        strMeasure9,
        strMeasure10,
        strMeasure11,
        strMeasure12,
        strMeasure13,
        strMeasure14,
        strMeasure15,
        strMeasure16,
        strMeasure17,
        strMeasure18,
        strMeasure19,
        strMeasure20,
      ];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["idMeal"] = idMeal;
    _data["strMeal"] = strMeal;
    _data["strDrinkAlternate"] = strDrinkAlternate;
    _data["strCategory"] = strCategory;
    _data["strArea"] = strArea;
    _data["strInstructions"] = strInstructions;
    _data["strMealThumb"] = strMealThumb;
    _data["strTags"] = strTags;
    _data["strYoutube"] = strYoutube;
    _data["strIngredient1"] = strIngredient1;
    _data["strIngredient2"] = strIngredient2;
    _data["strIngredient3"] = strIngredient3;
    _data["strIngredient4"] = strIngredient4;
    _data["strIngredient5"] = strIngredient5;
    _data["strIngredient6"] = strIngredient6;
    _data["strIngredient7"] = strIngredient7;
    _data["strIngredient8"] = strIngredient8;
    _data["strIngredient9"] = strIngredient9;
    _data["strIngredient10"] = strIngredient10;
    _data["strIngredient11"] = strIngredient11;
    _data["strIngredient12"] = strIngredient12;
    _data["strIngredient13"] = strIngredient13;
    _data["strIngredient14"] = strIngredient14;
    _data["strIngredient15"] = strIngredient15;
    _data["strIngredient16"] = strIngredient16;
    _data["strIngredient17"] = strIngredient17;
    _data["strIngredient18"] = strIngredient18;
    _data["strIngredient19"] = strIngredient19;
    _data["strIngredient20"] = strIngredient20;
    _data["strMeasure1"] = strMeasure1;
    _data["strMeasure2"] = strMeasure2;
    _data["strMeasure3"] = strMeasure3;
    _data["strMeasure4"] = strMeasure4;
    _data["strMeasure5"] = strMeasure5;
    _data["strMeasure6"] = strMeasure6;
    _data["strMeasure7"] = strMeasure7;
    _data["strMeasure8"] = strMeasure8;
    _data["strMeasure9"] = strMeasure9;
    _data["strMeasure10"] = strMeasure10;
    _data["strMeasure11"] = strMeasure11;
    _data["strMeasure12"] = strMeasure12;
    _data["strMeasure13"] = strMeasure13;
    _data["strMeasure14"] = strMeasure14;
    _data["strMeasure15"] = strMeasure15;
    _data["strMeasure16"] = strMeasure16;
    _data["strMeasure17"] = strMeasure17;
    _data["strMeasure18"] = strMeasure18;
    _data["strMeasure19"] = strMeasure19;
    _data["strMeasure20"] = strMeasure20;
    _data["strSource"] = strSource;
    _data["strImageSource"] = strImageSource;
    _data["strCreativeCommonsConfirmed"] = strCreativeCommonsConfirmed;
    _data["dateModified"] = dateModified;
    return _data;
  }
}
