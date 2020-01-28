import 'dart:convert';

Videoget videogetFromJson(String str) => Videoget.fromJson(json.decode(str));



class Videoget {
    String status;
    List data;

    Videoget({
        this.status,
        this.data,
    });

    factory Videoget.fromJson(Map<String, dynamic> json) => Videoget(
        status: json["status"],
        data: List.from(json["data"].map((x) => Datum.fromJson(x))),
    );

   
}

class Datum {
    String id;
    String video;

    Datum({
        this.id,
        this.video,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        video: json["video"],
    );
}