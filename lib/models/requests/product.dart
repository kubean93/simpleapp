import 'package:flutter/foundation.dart';


@immutable
class Product {

  const Product({
    required this.id,
    this.caseId,
    this.startDate,
    this.endDate,
    this.placementDescription,
  });

  final String id;
  final String? caseId;
  final String? startDate;
  final String? endDate;
  final String? placementDescription;

  factory Product.fromJson(Map<String,dynamic> json) => Product(
    id: json['id'] as String,
    caseId: json['caseId'] != null ? json['caseId'] as String : null,
    startDate: json['startDate'] != null ? json['startDate'] as String : null,
    endDate: json['endDate'] != null ? json['endDate'] as String : null,
    placementDescription: json['placementDescription'] != null ? json['placementDescription'] as String : null
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'caseId': caseId,
    'startDate': startDate,
    'endDate': endDate,
    'placementDescription': placementDescription
  };

  Product clone() => Product(
    id: id,
    caseId: caseId,
    startDate: startDate,
    endDate: endDate,
    placementDescription: placementDescription
  );


  Product copyWith({
    String? id,
    String? caseId,
    String? startDate,
    String? endDate,
    String? placementDescription
  }) => Product(
    id: id ?? this.id,
    caseId: caseId ?? this.caseId,
    startDate: startDate ?? this.startDate,
    endDate: endDate ?? this.endDate,
    placementDescription: placementDescription ?? this.placementDescription,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Product && id == other.id && caseId == other.caseId && startDate == other.startDate && endDate == other.endDate && placementDescription == other.placementDescription;

  @override
  int get hashCode => id.hashCode ^ caseId.hashCode ^ startDate.hashCode ^ endDate.hashCode ^ placementDescription.hashCode;
}
