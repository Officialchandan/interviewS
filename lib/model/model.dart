// To parse this JSON data, do
//
//     final imageData = imageDataFromJson(jsonString);

import 'dart:convert';

ImageData imageDataFromJson(String str) => ImageData.fromJson(json.decode(str));

String imageDataToJson(ImageData data) => json.encode(data.toJson());

class ImageData {
  ImageData({
    this.status,
    this.msg,
    this.data,
  });

  int? status;
  String? msg;
  List<String>? data;

  factory ImageData.fromJson(Map<String, dynamic> json) => ImageData(
        status: json["status"],
        msg: json["msg"],
        data: List<String>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data!.map((x) => x)),
      };
}
