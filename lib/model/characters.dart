class Character {
  String name;
  String birth_year;
  String eye_color;
  String gender;
  String hair_color;
  String height;
  String homeworld;
  String mass;
  String skin_color;

  Character(this.name, this.birth_year, this.eye_color, this.gender,
      this.hair_color, this.height, this.homeworld, this.mass, this.skin_color);

  factory Character.fromMap(Map<String, dynamic> map) {
    return new Character(map['name'] as String,
        map['birth_year'] as String,
        map['eye_color'] as String,
        map['gender'] as String,
        map['hair_color'] as String,
        map['height'] as String,
        map['homeworld'] as String,
        map['mass'] as String,
        map['skin_color'] as String);
  }

}
