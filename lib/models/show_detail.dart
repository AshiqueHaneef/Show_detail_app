// To parse this JSON data, do
//
//     final showDetail = showDetailFromMap(jsonString);

import 'dart:convert';

class ShowDetail {
  ShowDetail({
    this.id,
    this.url,
    this.name,
    this.type,
    this.language,
    this.genres,
    this.status,
    this.runtime,
    this.averageRuntime,
    this.premiered,
    this.ended,
    this.officialSite,
    this.schedule,
    this.rating,
    this.weight,
    this.network,
    this.webChannel,
    this.dvdCountry,
    this.externals,
    this.image,
    this.summary,
    this.updated,
    this.links,
  });

  int? id;
  String? url;
  String? name;
  String? type;
  String? language;
  List<String?>? genres;
  String? status;
  int? runtime;
  int? averageRuntime;
  DateTime? premiered;
  DateTime? ended;
  String? officialSite;
  Schedule? schedule;
  Rating? rating;
  int? weight;
  Network? network;
  dynamic webChannel;
  dynamic dvdCountry;
  Externals? externals;
  IMage? image;
  String? summary;
  int? updated;
  Links? links;

  factory ShowDetail.fromJson(String str) =>
      ShowDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ShowDetail.fromMap(Map<String, dynamic> json) {
    try {
      return ShowDetail(
        id: json["id"],
        url: json["url"] ?? "",
        name: json["name"] ?? "",
        type: json["type"] ?? "",
        language: json["language"] ?? "",
        genres: List<String>.from(json["genres"].map((x) => x) ?? []),
        status: json["status"] ?? "",
        runtime: json["runtime"],
        averageRuntime: json["averageRuntime"],
        premiered: json["premiered"] == null
            ? null
            : DateTime.parse(json["premiered"] ?? ""),
        ended: json["ended"] == null ? null : DateTime.parse(json["ended"]),
        officialSite: json["officialSite"] ?? "",
        schedule: Schedule.fromMap(json["schedule"]),
        rating: json["rating"] == null ? null : Rating.fromMap(json["rating"]),
        weight: json["weight"],
        network:
            json["network"] == null ? null : Network.fromMap(json["network"]),
        webChannel: json["webChannel"],
        dvdCountry: json["dvdCountry"],
        externals: Externals.fromMap(json["externals"]),
        image: IMage.fromMap(json["image"]),
        summary: json["summary"] ?? "",
        updated: json["updated"],
        links: Links.fromMap(json["_links"]),
      );
    } catch (e, st) {
      print(e);
      print(st);
      throw Error();
    }
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "url": url,
        "name": name,
        "type": type,
        "language": language,
        "genres": List<dynamic>.from(genres!.map((x) => x)),
        "status": status,
        "runtime": runtime,
        "averageRuntime": averageRuntime,
        "premiered":
            "${premiered?.year.toString().padLeft(4, '0')}-${premiered?.month.toString().padLeft(2, '0')}-${premiered?.day.toString().padLeft(2, '0')}",
        "ended":
            "${ended?.year.toString().padLeft(4, '0')}-${ended?.month.toString().padLeft(2, '0')}-${ended?.day.toString().padLeft(2, '0')}",
        "officialSite": officialSite,
        "schedule": schedule?.toMap(),
        "rating": rating?.toMap(),
        "weight": weight,
        "network": network?.toMap(),
        "webChannel": webChannel,
        "dvdCountry": dvdCountry,
        "externals": externals?.toMap(),
        "image": image?.toMap(),
        "summary": summary,
        "updated": updated,
        "_links": links?.toMap(),
      };
}

class Externals {
  Externals({
    this.tvrage,
    this.thetvdb,
    this.imdb,
  });

  int? tvrage;
  int? thetvdb;
  String? imdb;

  factory Externals.fromJson(String str) => Externals.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Externals.fromMap(Map<String, dynamic> json) {
    return Externals(
      tvrage: json["tvrage"],
      thetvdb: json["thetvdb"],
      imdb: json["imdb"] ?? "",
    );
  }

  Map<String, dynamic> toMap() => {
        "tvrage": tvrage,
        "thetvdb": thetvdb,
        "imdb": imdb,
      };
}

class IMage {
  IMage({
    this.medium,
    this.original,
  });

  String? medium;
  String? original;

  factory IMage.fromJson(String str) => IMage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory IMage.fromMap(Map<String, dynamic> json) {
    return IMage(
      medium: json["medium"] ?? "",
      original: json["original"] ?? "",
    );
  }

  Map<String, dynamic> toMap() => {
        "medium": medium,
        "original": original,
      };
}

class Links {
  Links({
    this.self,
    this.previousepisode,
  });

  Previousepisode? self;
  Previousepisode? previousepisode;

  factory Links.fromJson(String str) => Links.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Links.fromMap(Map<String, dynamic> json) {
    return Links(
      self: Previousepisode.fromMap(json["self"]),
      previousepisode: Previousepisode.fromMap(json["previousepisode"]),
    );
  }
  Map<String, dynamic> toMap() => {
        "self": self?.toMap(),
        "previousepisode": previousepisode?.toMap(),
      };
}

class Previousepisode {
  Previousepisode({
    this.href,
  });

  String? href;

  factory Previousepisode.fromJson(String str) =>
      Previousepisode.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Previousepisode.fromMap(Map<String, dynamic> json) {
    return Previousepisode(
      href: json["href"] ?? "",
    );
  }

  Map<String, dynamic> toMap() => {
        "href": href,
      };
}

class Network {
  Network({
    this.id,
    this.name,
    this.country,
    this.officialSite,
  });

  int? id;
  String? name;
  Country? country;
  String? officialSite;

  factory Network.fromJson(String str) => Network.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Network.fromMap(Map<String, dynamic> json) {
    return Network(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      country:
          json["country"] == null ? null : Country.fromMap(json["country"]),
      officialSite: json["officialSite"] ?? "",
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "country": country?.toMap(),
        "officialSite": officialSite,
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

  factory Country.fromMap(Map<String, dynamic> json) {
    return Country(
      name: json["name"] ?? "",
      code: json["code"] ?? "",
      timezone: json["timezone"] ?? "",
    );
  }

  Map<String, dynamic> toMap() => {
        "name": name,
        "code": code,
        "timezone": timezone,
      };
}

class Rating {
  Rating({
    this.average,
  });

  double? average;

  factory Rating.fromJson(String str) => Rating.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Rating.fromMap(Map<String, dynamic> json) {
    return Rating(
      average: json["average"] == null ? null : json["average"].toDouble(),
    );
  }

  Map<String, dynamic> toMap() => {
        "average": average ?? 0,
      };
}

class Schedule {
  Schedule({
    this.time,
    this.days,
  });

  String? time;
  List<String>? days;

  factory Schedule.fromJson(String str) => Schedule.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Schedule.fromMap(Map<String, dynamic> json) {
    return Schedule(
      time: json["time"] ?? "",
      days: json["days"] == null
          ? null
          : List<String>.from(json["days"].map((x) => x)),
    );
  }

  Map<String, dynamic> toMap() => {
        "time": time,
        "days": List<dynamic>.from(days!.map((x) => x)),
      };
}
