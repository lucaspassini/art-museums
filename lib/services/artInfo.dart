// To parse this JSON data, do
//
//     final harvardArtMuseums = harvardArtMuseumsFromJson(jsonString);

import 'dart:convert';

HarvardArtMuseums harvardArtMuseumsFromJson(String str) =>
    HarvardArtMuseums.fromJson(json.decode(str));

String harvardArtMuseumsToJson(HarvardArtMuseums data) =>
    json.encode(data.toJson());

class HarvardArtMuseums {
  HarvardArtMuseums({
    this.info,
    this.records,
  });

  Info info;
  List<Record> records;

  factory HarvardArtMuseums.fromJson(Map<String, dynamic> json) =>
      HarvardArtMuseums(
        info: Info.fromJson(json["info"]),
        records:
            List<Record>.from(json["records"].map((x) => Record.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "records": List<dynamic>.from(records.map((x) => x.toJson())),
      };
}

class Info {
  Info({
    this.totalrecordsperquery,
    this.totalrecords,
    this.pages,
    this.page,
    this.next,
    this.prev,
  });

  int totalrecordsperquery;
  int totalrecords;
  int pages;
  int page;
  String next;
  String prev;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        totalrecordsperquery: json["totalrecordsperquery"],
        totalrecords: json["totalrecords"],
        pages: json["pages"],
        page: json["page"],
        next: json["next"],
        prev: json["prev"],
      );

  Map<String, dynamic> toJson() => {
        "totalrecordsperquery": totalrecordsperquery,
        "totalrecords": totalrecords,
        "pages": pages,
        "page": page,
        "next": next,
        "prev": prev,
      };
}

class Record {
  Record({
    this.date,
    this.copyright,
    this.imageid,
    this.idsid,
    this.accesslevel,
    this.format,
    this.caption,
    this.description,
    this.technique,
    this.renditionnumber,
    this.baseimageurl,
    this.alttext,
    this.width,
    this.id,
    this.lastupdate,
    this.iiifbaseuri,
    this.fileid,
    this.height,
  });

  DateTime date;
  Copyright copyright;
  int imageid;
  int idsid;
  int accesslevel;
  Format format;
  String caption;
  dynamic description;
  String technique;
  String renditionnumber;
  String baseimageurl;
  dynamic alttext;
  int width;
  int id;
  String lastupdate;
  String iiifbaseuri;
  int fileid;
  int height;

  factory Record.fromJson(Map<String, dynamic> json) => Record(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        copyright: json["copyright"] == null
            ? null
            : copyrightValues.map[json["copyright"]],
        imageid: json["imageid"],
        idsid: json["idsid"],
        accesslevel: json["accesslevel"],
        format: formatValues.map[json["format"]],
        caption: json["caption"] == null ? null : json["caption"],
        description: json["description"],
        technique: json["technique"] == null ? null : json["technique"],
        renditionnumber: json["renditionnumber"],
        baseimageurl: json["baseimageurl"],
        alttext: json["alttext"],
        width: json["width"],
        id: json["id"],
        lastupdate: json["lastupdate"],
        iiifbaseuri: json["iiifbaseuri"],
        fileid: json["fileid"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "date": date == null
            ? null
            : "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "copyright":
            copyright == null ? null : copyrightValues.reverse[copyright],
        "imageid": imageid,
        "idsid": idsid,
        "accesslevel": accesslevel,
        "format": formatValues.reverse[format],
        "caption": caption == null ? null : caption,
        "description": description,
        "technique": technique == null ? null : technique,
        "renditionnumber": renditionnumber,
        "baseimageurl": baseimageurl,
        "alttext": alttext,
        "width": width,
        "id": id,
        "lastupdate": lastupdate,
        "iiifbaseuri": iiifbaseuri,
        "fileid": fileid,
        "height": height,
      };
}

enum Copyright { PRESIDENT_AND_FELLOWS_OF_HARVARD_COLLEGE }

final copyrightValues = EnumValues({
  "President and Fellows of Harvard College":
      Copyright.PRESIDENT_AND_FELLOWS_OF_HARVARD_COLLEGE
});

enum Format { IMAGE_JPEG }

final formatValues = EnumValues({"image/jpeg": Format.IMAGE_JPEG});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
