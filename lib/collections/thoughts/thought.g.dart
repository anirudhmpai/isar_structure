// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thought.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetThoughtCollection on Isar {
  IsarCollection<Thought> get thoughts => this.collection();
}

const ThoughtSchema = CollectionSchema(
  name: r'Thought',
  id: 6929868275815929257,
  properties: {
    r'thought': PropertySchema(
      id: 0,
      name: r'thought',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 1,
      name: r'userId',
      type: IsarType.long,
    )
  },
  estimateSize: _thoughtEstimateSize,
  serialize: _thoughtSerialize,
  deserialize: _thoughtDeserialize,
  deserializeProp: _thoughtDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _thoughtGetId,
  getLinks: _thoughtGetLinks,
  attach: _thoughtAttach,
  version: '3.0.5',
);

int _thoughtEstimateSize(
  Thought object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.thought;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _thoughtSerialize(
  Thought object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.thought);
  writer.writeLong(offsets[1], object.userId);
}

Thought _thoughtDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Thought();
  object.id = id;
  object.thought = reader.readStringOrNull(offsets[0]);
  object.userId = reader.readLongOrNull(offsets[1]);
  return object;
}

P _thoughtDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _thoughtGetId(Thought object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _thoughtGetLinks(Thought object) {
  return [];
}

void _thoughtAttach(IsarCollection<dynamic> col, Id id, Thought object) {
  object.id = id;
}

extension ThoughtQueryWhereSort on QueryBuilder<Thought, Thought, QWhere> {
  QueryBuilder<Thought, Thought, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ThoughtQueryWhere on QueryBuilder<Thought, Thought, QWhereClause> {
  QueryBuilder<Thought, Thought, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Thought, Thought, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Thought, Thought, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Thought, Thought, QAfterWhereClause> idBetween(
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

extension ThoughtQueryFilter
    on QueryBuilder<Thought, Thought, QFilterCondition> {
  QueryBuilder<Thought, Thought, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Thought, Thought, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Thought, Thought, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Thought, Thought, QAfterFilterCondition> thoughtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'thought',
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> thoughtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'thought',
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> thoughtEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thought',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> thoughtGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'thought',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> thoughtLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'thought',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> thoughtBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'thought',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> thoughtStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'thought',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> thoughtEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'thought',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> thoughtContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'thought',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> thoughtMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'thought',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> thoughtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thought',
        value: '',
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> thoughtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'thought',
        value: '',
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> userIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> userIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> userIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> userIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> userIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ThoughtQueryObject
    on QueryBuilder<Thought, Thought, QFilterCondition> {}

extension ThoughtQueryLinks
    on QueryBuilder<Thought, Thought, QFilterCondition> {}

extension ThoughtQuerySortBy on QueryBuilder<Thought, Thought, QSortBy> {
  QueryBuilder<Thought, Thought, QAfterSortBy> sortByThought() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thought', Sort.asc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> sortByThoughtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thought', Sort.desc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension ThoughtQuerySortThenBy
    on QueryBuilder<Thought, Thought, QSortThenBy> {
  QueryBuilder<Thought, Thought, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> thenByThought() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thought', Sort.asc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> thenByThoughtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thought', Sort.desc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension ThoughtQueryWhereDistinct
    on QueryBuilder<Thought, Thought, QDistinct> {
  QueryBuilder<Thought, Thought, QDistinct> distinctByThought(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'thought', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Thought, Thought, QDistinct> distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }
}

extension ThoughtQueryProperty
    on QueryBuilder<Thought, Thought, QQueryProperty> {
  QueryBuilder<Thought, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Thought, String?, QQueryOperations> thoughtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'thought');
    });
  }

  QueryBuilder<Thought, int?, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
