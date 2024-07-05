// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_info_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDeviceInfoModelCollection on Isar {
  IsarCollection<DeviceInfoModel> get deviceInfoModels => this.collection();
}

const DeviceInfoModelSchema = CollectionSchema(
  name: r'DeviceInformation',
  id: -3510827506819624570,
  properties: {
    r'fcmToken': PropertySchema(
      id: 0,
      name: r'fcmToken',
      type: IsarType.string,
    )
  },
  estimateSize: _deviceInfoModelEstimateSize,
  serialize: _deviceInfoModelSerialize,
  deserialize: _deviceInfoModelDeserialize,
  deserializeProp: _deviceInfoModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _deviceInfoModelGetId,
  getLinks: _deviceInfoModelGetLinks,
  attach: _deviceInfoModelAttach,
  version: '3.1.0+1',
);

int _deviceInfoModelEstimateSize(
  DeviceInfoModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.fcmToken;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _deviceInfoModelSerialize(
  DeviceInfoModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.fcmToken);
}

DeviceInfoModel _deviceInfoModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DeviceInfoModel(
    fcmToken: reader.readStringOrNull(offsets[0]),
  );
  return object;
}

P _deviceInfoModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _deviceInfoModelGetId(DeviceInfoModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _deviceInfoModelGetLinks(DeviceInfoModel object) {
  return [];
}

void _deviceInfoModelAttach(
    IsarCollection<dynamic> col, Id id, DeviceInfoModel object) {}

extension DeviceInfoModelQueryWhereSort
    on QueryBuilder<DeviceInfoModel, DeviceInfoModel, QWhere> {
  QueryBuilder<DeviceInfoModel, DeviceInfoModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DeviceInfoModelQueryWhere
    on QueryBuilder<DeviceInfoModel, DeviceInfoModel, QWhereClause> {
  QueryBuilder<DeviceInfoModel, DeviceInfoModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DeviceInfoModel, DeviceInfoModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<DeviceInfoModel, DeviceInfoModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DeviceInfoModel, DeviceInfoModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DeviceInfoModel, DeviceInfoModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DeviceInfoModelQueryFilter
    on QueryBuilder<DeviceInfoModel, DeviceInfoModel, QFilterCondition> {
  QueryBuilder<DeviceInfoModel, DeviceInfoModel, QAfterFilterCondition>
      fcmTokenIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fcmToken',
      ));
    });
  }

  QueryBuilder<DeviceInfoModel, DeviceInfoModel, QAfterFilterCondition>
      fcmTokenIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fcmToken',
      ));
    });
  }

  QueryBuilder<DeviceInfoModel, DeviceInfoModel, QAfterFilterCondition>
      fcmTokenEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fcmToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfoModel, DeviceInfoModel, QAfterFilterCondition>
      fcmTokenGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fcmToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfoModel, DeviceInfoModel, QAfterFilterCondition>
      fcmTokenLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fcmToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfoModel, DeviceInfoModel, QAfterFilterCondition>
      fcmTokenBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fcmToken',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfoModel, DeviceInfoModel, QAfterFilterCondition>
      fcmTokenStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fcmToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfoModel, DeviceInfoModel, QAfterFilterCondition>
      fcmTokenEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fcmToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfoModel, DeviceInfoModel, QAfterFilterCondition>
      fcmTokenContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fcmToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfoModel, DeviceInfoModel, QAfterFilterCondition>
      fcmTokenMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fcmToken',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfoModel, DeviceInfoModel, QAfterFilterCondition>
      fcmTokenIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fcmToken',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceInfoModel, DeviceInfoModel, QAfterFilterCondition>
      fcmTokenIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fcmToken',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceInfoModel, DeviceInfoModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DeviceInfoModel, DeviceInfoModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DeviceInfoModel, DeviceInfoModel, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DeviceInfoModel, DeviceInfoModel, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DeviceInfoModelQueryObject
    on QueryBuilder<DeviceInfoModel, DeviceInfoModel, QFilterCondition> {}

extension DeviceInfoModelQueryLinks
    on QueryBuilder<DeviceInfoModel, DeviceInfoModel, QFilterCondition> {}

extension DeviceInfoModelQuerySortBy
    on QueryBuilder<DeviceInfoModel, DeviceInfoModel, QSortBy> {
  QueryBuilder<DeviceInfoModel, DeviceInfoModel, QAfterSortBy>
      sortByFcmToken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fcmToken', Sort.asc);
    });
  }

  QueryBuilder<DeviceInfoModel, DeviceInfoModel, QAfterSortBy>
      sortByFcmTokenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fcmToken', Sort.desc);
    });
  }
}

extension DeviceInfoModelQuerySortThenBy
    on QueryBuilder<DeviceInfoModel, DeviceInfoModel, QSortThenBy> {
  QueryBuilder<DeviceInfoModel, DeviceInfoModel, QAfterSortBy>
      thenByFcmToken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fcmToken', Sort.asc);
    });
  }

  QueryBuilder<DeviceInfoModel, DeviceInfoModel, QAfterSortBy>
      thenByFcmTokenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fcmToken', Sort.desc);
    });
  }

  QueryBuilder<DeviceInfoModel, DeviceInfoModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DeviceInfoModel, DeviceInfoModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension DeviceInfoModelQueryWhereDistinct
    on QueryBuilder<DeviceInfoModel, DeviceInfoModel, QDistinct> {
  QueryBuilder<DeviceInfoModel, DeviceInfoModel, QDistinct> distinctByFcmToken(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fcmToken', caseSensitive: caseSensitive);
    });
  }
}

extension DeviceInfoModelQueryProperty
    on QueryBuilder<DeviceInfoModel, DeviceInfoModel, QQueryProperty> {
  QueryBuilder<DeviceInfoModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DeviceInfoModel, String?, QQueryOperations> fcmTokenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fcmToken');
    });
  }
}
