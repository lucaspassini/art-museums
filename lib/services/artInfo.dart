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
  });

  int totalrecordsperquery;
  int totalrecords;
  int pages;
  int page;
  String next;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        totalrecordsperquery: json["totalrecordsperquery"],
        totalrecords: json["totalrecords"],
        pages: json["pages"],
        page: json["page"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "totalrecordsperquery": totalrecordsperquery,
        "totalrecords": totalrecords,
        "pages": pages,
        "page": page,
        "next": next,
      };
}

class Record {
  Record({
    this.id,
    this.imageid,
    this.fileid,
    this.idsid,
    this.caption,
    this.alttext,
    this.description,
    this.copyright,
    this.iiifbaseuri,
    this.baseimageurl,
    this.renditionnumber,
    this.date,
    this.height,
    this.width,
    this.accesslevel,
    this.format,
    this.technique,
    this.lastupdate,
  });

  int id;
  int imageid;
  int fileid;
  int idsid;
  dynamic caption;
  dynamic alttext;
  dynamic description;
  String copyright;
  String iiifbaseuri;
  String baseimageurl;
  String renditionnumber;
  DateTime date;
  int height;
  int width;
  int accesslevel;
  String format;
  String technique;
  String lastupdate;

  factory Record.fromJson(Map<String, dynamic> json) => Record(
        id: json["id"],
        imageid: json["imageid"],
        fileid: json["fileid"],
        idsid: json["idsid"],
        caption: json["caption"],
        alttext: json["alttext"],
        description: json["description"],
        copyright: json["copyright"],
        iiifbaseuri: json["iiifbaseuri"],
        baseimageurl: json["baseimageurl"],
        renditionnumber: json["renditionnumber"],
        date: DateTime.parse(json["date"]),
        height: json["height"],
        width: json["width"],
        accesslevel: json["accesslevel"],
        format: json["format"],
        technique: json["technique"],
        lastupdate: json["lastupdate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imageid": imageid,
        "fileid": fileid,
        "idsid": idsid,
        "caption": caption,
        "alttext": alttext,
        "description": description,
        "copyright": copyright,
        "iiifbaseuri": iiifbaseuri,
        "baseimageurl": baseimageurl,
        "renditionnumber": renditionnumber,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "height": height,
        "width": width,
        "accesslevel": accesslevel,
        "format": format,
        "technique": technique,
        "lastupdate": lastupdate,
      };
}
