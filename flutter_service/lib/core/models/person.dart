class Person {
  String name;
  String height;
  String mass;
  String hairColor;
  String skinColor;
  String eyeColor;
  String birthYear;
  String gender;
  String homeworld;
  List<String> films;
  List<Null> species;
  List<String> vehicles;
  List<String> starships;
  String created;
  String edited;
  String url;

  Person(
      {this.name,
      this.height,
      this.mass,
      this.hairColor,
      this.skinColor,
      this.eyeColor,
      this.birthYear,
      this.gender,
      this.homeworld,
      this.films,
      this.species,
      this.vehicles,
      this.starships,
      this.created,
      this.edited,
      this.url});

  Person.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    height = json['height'];
    mass = json['mass'];
    hairColor = json['hair_color'];
    skinColor = json['skin_color'];
    eyeColor = json['eye_color'];
    birthYear = json['birth_year'];
    gender = json['gender'];
    homeworld = json['homeworld'];
    created = json['created'];
    edited = json['edited'];
    url = json['url'];
  }

  static Person fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return Person(
        name: map['name'],
        height: map['height'],
        mass: map['mass'],
        hairColor: map['hair_color'],
        skinColor: map['skin_color'],
        eyeColor: map['eye_color'],
        birthYear: map['birth_year'],
        gender: map['gender'],
        homeworld: map['homeworld'],
        created: map['created'],
        edited: map['edited'],
        url: map['url']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['height'] = this.height;
    data['mass'] = this.mass;
    data['hair_color'] = this.hairColor;
    data['skin_color'] = this.skinColor;
    data['eye_color'] = this.eyeColor;
    data['birth_year'] = this.birthYear;
    data['gender'] = this.gender;
    data['homeworld'] = this.homeworld;
    data['created'] = this.created;
    data['edited'] = this.edited;
    data['url'] = this.url;
    return data;
  }
}
