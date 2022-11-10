// To parse this JSON data, do
//
//     final cast = castFromMap(jsonString);

import 'dart:convert';

class Cast {
  Cast({
    this.person,
    this.character,
    this.self,
    this.voice,
  });

  Person? person;
  Character? character;
  bool? self;
  bool? voice;

  factory Cast.fromJson(String str) => Cast.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cast.fromMap(Map<String, dynamic> json) {
    try {
      return Cast(
        person: Person.fromMap(json["person"]),
        character: Character.fromMap(json["character"]),
        self: json["self"],
        voice: json["voice"],
      );
    } catch (e, st) {
      print(e);
      print(st);
      throw Error();
    }
  }

  Map<String, dynamic> toMap() => {
        "person": person?.toMap(),
        "character": character?.toMap(),
        "self": self,
        "voice": voice,
      };
}

class Character {
  Character({
    this.id,
    this.url,
    this.name,
    this.image,
    this.links,
  });

  int? id;
  String? url;
  String? name;
  Image? image;
  Links? links;

  factory Character.fromJson(String str) => Character.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Character.fromMap(Map<String, dynamic> json) => Character(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        image: json["image"] == null ? null : Image.fromMap(json["image"]),
        links: Links.fromMap(json["_links"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "url": url,
        "name": name,
        "image": image?.toMap(),
        "_links": links?.toMap(),
      };
}

class Image {
  Image({
    this.medium,
    this.original,
  });

  String? medium;
  String? original;

  factory Image.fromJson(String str) => Image.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Image.fromMap(Map<String, dynamic> json) => Image(
        medium: json["medium"],
        original: json["original"],
      );

  Map<String, dynamic> toMap() => {
        "medium": medium,
        "original": original,
      };
}

class Links {
  Links({
    this.self,
  });

  Self? self;

  factory Links.fromJson(String str) => Links.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Links.fromMap(Map<String, dynamic> json) => Links(
        self: Self.fromMap(json["self"]),
      );

  Map<String, dynamic> toMap() => {
        "self": self?.toMap(),
      };
}

class Self {
  Self({
    this.href,
  });

  String? href;

  factory Self.fromJson(String str) => Self.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Self.fromMap(Map<String, dynamic> json) => Self(
        href: json["href"],
      );

  Map<String, dynamic> toMap() => {
        "href": href,
      };
}

class Person {
  Person({
    this.id,
    this.url,
    this.name,
    this.country,
    this.birthday,
    this.deathday,
    this.gender,
    this.image,
    this.updated,
    this.links,
  });

  int? id;
  String? url;
  String? name;
  Country? country;
  DateTime? birthday;
  dynamic deathday;
  String? gender;
  Image? image;
  int? updated;
  Links? links;

  factory Person.fromJson(String str) => Person.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Person.fromMap(Map<String, dynamic> json) => Person(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        country: Country.fromMap(json["country"]),
        birthday:
            json["birthday"] == null ? null : DateTime.parse(json["birthday"]),
        deathday: json["deathday"],
        gender: json["gender"],
        image: Image.fromMap(json["image"]),
        updated: json["updated"],
        links: Links.fromMap(json["_links"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "url": url,
        "name": name,
        "country": country?.toMap(),
        "birthday":
            "${birthday?.year.toString().padLeft(4, '0')}-${birthday?.month.toString().padLeft(2, '0')}-${birthday?.day.toString().padLeft(2, '0')}",
        "deathday": deathday,
        "gender": gender,
        "image": image?.toMap(),
        "updated": updated,
        "_links": links?.toMap(),
      };
}

class Country {
  Country({
    this.name,
    this.code,
    this.timezone,
  });

  String? name;
  String? code;
  String? timezone;

  factory Country.fromJson(String str) => Country.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Country.fromMap(Map<String, dynamic> json) => Country(
        name: json["name"],
        code: json["code"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "code": code,
        "timezone": timezone,
      };
}
