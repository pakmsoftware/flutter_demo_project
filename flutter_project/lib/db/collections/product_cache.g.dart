// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_cache.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetProductCacheCollection on Isar {
  IsarCollection<ProductCache> get productCaches => this.collection();
}

const ProductCacheSchema = CollectionSchema(
  name: r'ProductCache',
  id: 7068963636942527906,
  properties: {
    r'cacheKey': PropertySchema(
      id: 0,
      name: r'cacheKey',
      type: IsarType.string,
    ),
    r'expirationDate': PropertySchema(
      id: 1,
      name: r'expirationDate',
      type: IsarType.dateTime,
    ),
    r'productIdList': PropertySchema(
      id: 2,
      name: r'productIdList',
      type: IsarType.longList,
    )
  },
  estimateSize: _productCacheEstimateSize,
  serialize: _productCacheSerialize,
  deserialize: _productCacheDeserialize,
  deserializeProp: _productCacheDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _productCacheGetId,
  getLinks: _productCacheGetLinks,
  attach: _productCacheAttach,
  version: '3.0.5',
);

int _productCacheEstimateSize(
  ProductCache object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.cacheKey.length * 3;
  bytesCount += 3 + object.productIdList.length * 8;
  return bytesCount;
}

void _productCacheSerialize(
  ProductCache object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.cacheKey);
  writer.writeDateTime(offsets[1], object.expirationDate);
  writer.writeLongList(offsets[2], object.productIdList);
}

ProductCache _productCacheDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ProductCache(
    cacheKey: reader.readString(offsets[0]),
    expirationDate: reader.readDateTime(offsets[1]),
    productIdList: reader.readLongList(offsets[2]) ?? [],
  );
  object.id = id;
  return object;
}

P _productCacheDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readLongList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _productCacheGetId(ProductCache object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _productCacheGetLinks(ProductCache object) {
  return [];
}

void _productCacheAttach(
    IsarCollection<dynamic> col, Id id, ProductCache object) {
  object.id = id;
}

extension ProductCacheQueryWhereSort
    on QueryBuilder<ProductCache, ProductCache, QWhere> {
  QueryBuilder<ProductCache, ProductCache, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ProductCacheQueryWhere
    on QueryBuilder<ProductCache, ProductCache, QWhereClause> {
  QueryBuilder<ProductCache, ProductCache, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ProductCache, ProductCache, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<ProductCache, ProductCache, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ProductCache, ProductCache, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ProductCache, ProductCache, QAfterWhereClause> idBetween(
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

extension ProductCacheQueryFilter
    on QueryBuilder<ProductCache, ProductCache, QFilterCondition> {
  QueryBuilder<ProductCache, ProductCache, QAfterFilterCondition>
      cacheKeyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cacheKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCache, ProductCache, QAfterFilterCondition>
      cacheKeyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cacheKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCache, ProductCache, QAfterFilterCondition>
      cacheKeyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cacheKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCache, ProductCache, QAfterFilterCondition>
      cacheKeyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cacheKey',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCache, ProductCache, QAfterFilterCondition>
      cacheKeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cacheKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCache, ProductCache, QAfterFilterCondition>
      cacheKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cacheKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCache, ProductCache, QAfterFilterCondition>
      cacheKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cacheKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCache, ProductCache, QAfterFilterCondition>
      cacheKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cacheKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCache, ProductCache, QAfterFilterCondition>
      cacheKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cacheKey',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductCache, ProductCache, QAfterFilterCondition>
      cacheKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cacheKey',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductCache, ProductCache, QAfterFilterCondition>
      expirationDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expirationDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductCache, ProductCache, QAfterFilterCondition>
      expirationDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expirationDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductCache, ProductCache, QAfterFilterCondition>
      expirationDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expirationDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductCache, ProductCache, QAfterFilterCondition>
      expirationDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expirationDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductCache, ProductCache, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductCache, ProductCache, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ProductCache, ProductCache, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ProductCache, ProductCache, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ProductCache, ProductCache, QAfterFilterCondition>
      productIdListElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productIdList',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductCache, ProductCache, QAfterFilterCondition>
      productIdListElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productIdList',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductCache, ProductCache, QAfterFilterCondition>
      productIdListElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productIdList',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductCache, ProductCache, QAfterFilterCondition>
      productIdListElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productIdList',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductCache, ProductCache, QAfterFilterCondition>
      productIdListLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'productIdList',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ProductCache, ProductCache, QAfterFilterCondition>
      productIdListIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'productIdList',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ProductCache, ProductCache, QAfterFilterCondition>
      productIdListIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'productIdList',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ProductCache, ProductCache, QAfterFilterCondition>
      productIdListLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'productIdList',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ProductCache, ProductCache, QAfterFilterCondition>
      productIdListLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'productIdList',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ProductCache, ProductCache, QAfterFilterCondition>
      productIdListLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'productIdList',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension ProductCacheQueryObject
    on QueryBuilder<ProductCache, ProductCache, QFilterCondition> {}

extension ProductCacheQueryLinks
    on QueryBuilder<ProductCache, ProductCache, QFilterCondition> {}

extension ProductCacheQuerySortBy
    on QueryBuilder<ProductCache, ProductCache, QSortBy> {
  QueryBuilder<ProductCache, ProductCache, QAfterSortBy> sortByCacheKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cacheKey', Sort.asc);
    });
  }

  QueryBuilder<ProductCache, ProductCache, QAfterSortBy> sortByCacheKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cacheKey', Sort.desc);
    });
  }

  QueryBuilder<ProductCache, ProductCache, QAfterSortBy>
      sortByExpirationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expirationDate', Sort.asc);
    });
  }

  QueryBuilder<ProductCache, ProductCache, QAfterSortBy>
      sortByExpirationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expirationDate', Sort.desc);
    });
  }
}

extension ProductCacheQuerySortThenBy
    on QueryBuilder<ProductCache, ProductCache, QSortThenBy> {
  QueryBuilder<ProductCache, ProductCache, QAfterSortBy> thenByCacheKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cacheKey', Sort.asc);
    });
  }

  QueryBuilder<ProductCache, ProductCache, QAfterSortBy> thenByCacheKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cacheKey', Sort.desc);
    });
  }

  QueryBuilder<ProductCache, ProductCache, QAfterSortBy>
      thenByExpirationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expirationDate', Sort.asc);
    });
  }

  QueryBuilder<ProductCache, ProductCache, QAfterSortBy>
      thenByExpirationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expirationDate', Sort.desc);
    });
  }

  QueryBuilder<ProductCache, ProductCache, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ProductCache, ProductCache, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension ProductCacheQueryWhereDistinct
    on QueryBuilder<ProductCache, ProductCache, QDistinct> {
  QueryBuilder<ProductCache, ProductCache, QDistinct> distinctByCacheKey(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cacheKey', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductCache, ProductCache, QDistinct>
      distinctByExpirationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expirationDate');
    });
  }

  QueryBuilder<ProductCache, ProductCache, QDistinct>
      distinctByProductIdList() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productIdList');
    });
  }
}

extension ProductCacheQueryProperty
    on QueryBuilder<ProductCache, ProductCache, QQueryProperty> {
  QueryBuilder<ProductCache, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ProductCache, String, QQueryOperations> cacheKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cacheKey');
    });
  }

  QueryBuilder<ProductCache, DateTime, QQueryOperations>
      expirationDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expirationDate');
    });
  }

  QueryBuilder<ProductCache, List<int>, QQueryOperations>
      productIdListProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productIdList');
    });
  }
}
