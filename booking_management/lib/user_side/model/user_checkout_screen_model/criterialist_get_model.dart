// To parse this JSON data, do
//
//     final criteriaListGetModel = criteriaListGetModelFromJson(jsonString);

import 'dart:convert';

CriteriaListGetModel criteriaListGetModelFromJson(String str) =>
    CriteriaListGetModel.fromJson(json.decode(str));

String criteriaListGetModelToJson(CriteriaListGetModel data) =>
    json.encode(data.toJson());

class CriteriaListGetModel {
  CriteriaListGetModel({
    required this.statusCode,
    required this.success,
    required this.data,
  });

  final int statusCode;
  final bool success;
  final List<CriteriaDatum> data;

  factory CriteriaListGetModel.fromJson(Map<String, dynamic> json) =>
      CriteriaListGetModel(
        statusCode: json["statusCode"],
        success: json["success"],
        data: List<CriteriaDatum>.from(
            (json["data"] ?? []).map((x) => CriteriaDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CriteriaDatum {
  CriteriaDatum({
    // this.id,
    // this.bookingId,
    // this.booking,
    // this.name,
    // this.criteriaId,
    // this.criteria,
    required this.criteriaList,
    // this.criterias,
    // this.selectCriteriaId,
  });

  // final int id;
  // final int bookingId;
  // final dynamic booking;
  // final dynamic name;
  // final int criteriaId;
  // final dynamic criteria;
  final List<CriteriaCountList> criteriaList;
  // final List<Criteria> criterias;
  // final dynamic selectCriteriaId;

  factory CriteriaDatum.fromJson(Map<String, dynamic> json) => CriteriaDatum(
        // id: json["id"],
        // bookingId: json["bookingId"],
        // booking: json["booking"],
        // name: json["name"],
        // criteriaId: json["criteriaId"],
        // criteria: json["criteria"],
        criteriaList: List<CriteriaCountList>.from((json["criteriaList"] ?? [])
            .map((x) => CriteriaCountList.fromJson(x))),
        // criterias: List<Criteria>.from(
        //     json["criterias"].map((x) => Criteria.fromJson(x))),
        // selectCriteriaId: json["selectCriteriaId"],
      );

  Map<String, dynamic> toJson() => {
        // "id": id,
        // "bookingId": bookingId,
        // "booking": booking,
        // "name": name,
        // "criteriaId": criteriaId,
        // "criteria": criteria,
        "criteriaList": List<dynamic>.from(criteriaList.map((x) => x.toJson())),
        // "criterias": List<dynamic>.from(criterias.map((x) => x.toJson())),
        // "selectCriteriaId": selectCriteriaId,
      };
}

class CriteriaCountList {
  CriteriaCountList({
    required this.name,
    required this.criteriasList,
  });

  final String name;
  final List<SubCriteriasList> criteriasList;

  factory CriteriaCountList.fromJson(Map<String, dynamic> json) =>
      CriteriaCountList(
        name: json["name"],
        criteriasList: List<SubCriteriasList>.from((json["criteriasList"] ?? [])
            .map((x) => SubCriteriasList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "criteriasList":
            List<dynamic>.from(criteriasList.map((x) => x.toJson())),
      };
}

class SubCriteriasList {
  SubCriteriasList({
    // required this.disabled,
    // this.group,
    // required this.selected,
    required this.text,
    required this.value,
  });

  // final bool disabled;
  // final dynamic group;
  // final bool selected;
  final String text;
  final String value;

  factory SubCriteriasList.fromJson(Map<String, dynamic> json) =>
      SubCriteriasList(
        // disabled: json["disabled"],
        // group: json["group"],
        // selected: json["selected"],
        text: json["text"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        // "disabled": disabled,
        // "group": group,
        // "selected": selected,
        "text": text,
        "value": value,
      };
}

// class Criteria {
//   Criteria({
//     this.id,
//     this.resourceId,
//     this.name,
//     this.options,
//   });

//   final int id;
//   final int resourceId;
//   final String name;
//   final String options;

//   factory Criteria.fromJson(Map<String, dynamic> json) => Criteria(
//         id: json["id"],
//         resourceId: json["resourceId"],
//         name: json["name"],
//         options: json["options"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "resourceId": resourceId,
//         "name": name,
//         "options": options,
//       };
// }
