import 'package:flutter/foundation.dart';


@immutable
class User {

  const User({
    required this.id,
    required this.createdDate,
    required this.modifiedDate,
    required this.name,
    required this.displayName,
    this.failLoginCount,
    required this.affectDate,
    required this.expireDate,
    this.testAmount,
    this.testSelectId,
    required this.userType,
    required this.tenantId,
    required this.fullTextSearch,
    required this.lock,
    required this.active,
  });

  final String id;
  final String createdDate;
  final String modifiedDate;
  final String name;
  final String displayName;
  final int? failLoginCount;
  final String affectDate;
  final String expireDate;
  final int? testAmount;
  final String? testSelectId;
  final String userType;
  final String tenantId;
  final String fullTextSearch;
  final bool lock;
  final bool active;

  factory User.fromJson(Map<String,dynamic> json) => User(
    id: json['id'] as String,
    createdDate: json['createdDate'] as String,
    modifiedDate: json['modifiedDate'] as String,
    name: json['name'] as String,
    displayName: json['displayName'] as String,
    failLoginCount: json['failLoginCount'] != null ? json['failLoginCount'] as int : null,
    affectDate: json['affectDate'] as String,
    expireDate: json['expireDate'] as String,
    testAmount: json['testAmount'] != null ? json['testAmount'] as int : null,
    testSelectId: json['testSelectId'] != null ? json['testSelectId'] as String : null,
    userType: json['userType'] as String,
    tenantId: json['tenantId'] as String,
    fullTextSearch: json['fullTextSearch'] as String,
    lock: json['lock'] as bool,
    active: json['active'] as bool
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'createdDate': createdDate,
    'modifiedDate': modifiedDate,
    'name': name,
    'displayName': displayName,
    'failLoginCount': failLoginCount,
    'affectDate': affectDate,
    'expireDate': expireDate,
    'testAmount': testAmount,
    'testSelectId': testSelectId,
    'userType': userType,
    'tenantId': tenantId,
    'fullTextSearch': fullTextSearch,
    'lock': lock,
    'active': active
  };

  User clone() => User(
    id: id,
    createdDate: createdDate,
    modifiedDate: modifiedDate,
    name: name,
    displayName: displayName,
    failLoginCount: failLoginCount,
    affectDate: affectDate,
    expireDate: expireDate,
    testAmount: testAmount,
    testSelectId: testSelectId,
    userType: userType,
    tenantId: tenantId,
    fullTextSearch: fullTextSearch,
    lock: lock,
    active: active
  );


  User copyWith({
    String? id,
    String? createdDate,
    String? modifiedDate,
    String? name,
    String? displayName,
    int? failLoginCount,
    String? affectDate,
    String? expireDate,
    int? testAmount,
    String? testSelectId,
    String? userType,
    String? tenantId,
    String? fullTextSearch,
    bool? lock,
    bool? active
  }) => User(
    id: id ?? this.id,
    createdDate: createdDate ?? this.createdDate,
    modifiedDate: modifiedDate ?? this.modifiedDate,
    name: name ?? this.name,
    displayName: displayName ?? this.displayName,
    failLoginCount: failLoginCount ?? this.failLoginCount,
    affectDate: affectDate ?? this.affectDate,
    expireDate: expireDate ?? this.expireDate,
    testAmount: testAmount ?? this.testAmount,
    testSelectId: testSelectId ?? this.testSelectId,
    userType: userType ?? this.userType,
    tenantId: tenantId ?? this.tenantId,
    fullTextSearch: fullTextSearch ?? this.fullTextSearch,
    lock: lock ?? this.lock,
    active: active ?? this.active,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is User && id == other.id && createdDate == other.createdDate && modifiedDate == other.modifiedDate && name == other.name && displayName == other.displayName && failLoginCount == other.failLoginCount && affectDate == other.affectDate && expireDate == other.expireDate && testAmount == other.testAmount && testSelectId == other.testSelectId && userType == other.userType && tenantId == other.tenantId && fullTextSearch == other.fullTextSearch && lock == other.lock && active == other.active;

  @override
  int get hashCode => id.hashCode ^ createdDate.hashCode ^ modifiedDate.hashCode ^ name.hashCode ^ displayName.hashCode ^ failLoginCount.hashCode ^ affectDate.hashCode ^ expireDate.hashCode ^ testAmount.hashCode ^ testSelectId.hashCode ^ userType.hashCode ^ tenantId.hashCode ^ fullTextSearch.hashCode ^ lock.hashCode ^ active.hashCode;
}
