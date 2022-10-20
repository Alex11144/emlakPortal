// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Houses _$HousesFromJson(Map<String, dynamic> json) {
  // $checkKeys(
  //   json,
  //   // disallowNullValues: const [
  //   //   'id',
  //   //   'propertyType',
  //   //   'cover',
  //   //   'price',
  //   //   'space',
  //   //   'roomCount',
  //   //   'address',
  //   //   'announceDate'
  //   // ],
  // );
  return Houses(
    id: json['id'] ?? '0',
    propertyType: json['propertyType'] ?? '0',
    cover: json['cover'] ?? '0',
    price: json['price'] ?? '0',
    space: json['space'] ?? '0',
    roomCount: json['roomCount'] ?? '0',
    address: json['address'] ?? '0',
    announceDate: json['announceDate'] ?? '0',
  );
}

Map<String, dynamic> _$HousesToJson(Houses instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('propertyType', instance.propertyType);
  writeNotNull('cover', instance.cover);
  val['price'] = instance.price;
  writeNotNull('space', instance.space);
  writeNotNull('roomCount', instance.roomCount);
  writeNotNull('address', instance.address);
  writeNotNull('announceDate', instance.announceDate);
  return val;
}
