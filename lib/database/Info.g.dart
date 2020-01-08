// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Info.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class SchoolInfo extends DataClass implements Insertable<SchoolInfo> {
  final int id;
  final String name;
  final String address;
  final String email;
  final String phone;
  SchoolInfo(
      {@required this.id,
      @required this.name,
      @required this.address,
      @required this.email,
      @required this.phone});
  factory SchoolInfo.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return SchoolInfo(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      address:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}address']),
      email:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}email']),
      phone:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}phone']),
    );
  }
  factory SchoolInfo.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return SchoolInfo(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      address: serializer.fromJson<String>(json['address']),
      email: serializer.fromJson<String>(json['email']),
      phone: serializer.fromJson<String>(json['phone']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'address': serializer.toJson<String>(address),
      'email': serializer.toJson<String>(email),
      'phone': serializer.toJson<String>(phone),
    };
  }

  @override
  SchoolInfosCompanion createCompanion(bool nullToAbsent) {
    return SchoolInfosCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
    );
  }

  SchoolInfo copyWith(
          {int id, String name, String address, String email, String phone}) =>
      SchoolInfo(
        id: id ?? this.id,
        name: name ?? this.name,
        address: address ?? this.address,
        email: email ?? this.email,
        phone: phone ?? this.phone,
      );
  @override
  String toString() {
    return (StringBuffer('SchoolInfo(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('email: $email, ')
          ..write('phone: $phone')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(name.hashCode,
          $mrjc(address.hashCode, $mrjc(email.hashCode, phone.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is SchoolInfo &&
          other.id == this.id &&
          other.name == this.name &&
          other.address == this.address &&
          other.email == this.email &&
          other.phone == this.phone);
}

class SchoolInfosCompanion extends UpdateCompanion<SchoolInfo> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> address;
  final Value<String> email;
  final Value<String> phone;
  const SchoolInfosCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
  });
  SchoolInfosCompanion.insert({
    @required int id,
    @required String name,
    @required String address,
    @required String email,
    @required String phone,
  })  : id = Value(id),
        name = Value(name),
        address = Value(address),
        email = Value(email),
        phone = Value(phone);
  SchoolInfosCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> address,
      Value<String> email,
      Value<String> phone}) {
    return SchoolInfosCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }
}

class $SchoolInfosTable extends SchoolInfos
    with TableInfo<$SchoolInfosTable, SchoolInfo> {
  final GeneratedDatabase _db;
  final String _alias;
  $SchoolInfosTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _addressMeta = const VerificationMeta('address');
  GeneratedTextColumn _address;
  @override
  GeneratedTextColumn get address => _address ??= _constructAddress();
  GeneratedTextColumn _constructAddress() {
    return GeneratedTextColumn(
      'address',
      $tableName,
      false,
    );
  }

  final VerificationMeta _emailMeta = const VerificationMeta('email');
  GeneratedTextColumn _email;
  @override
  GeneratedTextColumn get email => _email ??= _constructEmail();
  GeneratedTextColumn _constructEmail() {
    return GeneratedTextColumn(
      'email',
      $tableName,
      false,
    );
  }

  final VerificationMeta _phoneMeta = const VerificationMeta('phone');
  GeneratedTextColumn _phone;
  @override
  GeneratedTextColumn get phone => _phone ??= _constructPhone();
  GeneratedTextColumn _constructPhone() {
    return GeneratedTextColumn(
      'phone',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, address, email, phone];
  @override
  $SchoolInfosTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'school_infos';
  @override
  final String actualTableName = 'school_infos';
  @override
  VerificationContext validateIntegrity(SchoolInfosCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.address.present) {
      context.handle(_addressMeta,
          address.isAcceptableValue(d.address.value, _addressMeta));
    } else if (address.isRequired && isInserting) {
      context.missing(_addressMeta);
    }
    if (d.email.present) {
      context.handle(
          _emailMeta, email.isAcceptableValue(d.email.value, _emailMeta));
    } else if (email.isRequired && isInserting) {
      context.missing(_emailMeta);
    }
    if (d.phone.present) {
      context.handle(
          _phoneMeta, phone.isAcceptableValue(d.phone.value, _phoneMeta));
    } else if (phone.isRequired && isInserting) {
      context.missing(_phoneMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SchoolInfo map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return SchoolInfo.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(SchoolInfosCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.address.present) {
      map['address'] = Variable<String, StringType>(d.address.value);
    }
    if (d.email.present) {
      map['email'] = Variable<String, StringType>(d.email.value);
    }
    if (d.phone.present) {
      map['phone'] = Variable<String, StringType>(d.phone.value);
    }
    return map;
  }

  @override
  $SchoolInfosTable createAlias(String alias) {
    return $SchoolInfosTable(_db, alias);
  }
}

abstract class _$MyDB extends GeneratedDatabase {
  _$MyDB(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $SchoolInfosTable _schoolInfos;
  $SchoolInfosTable get schoolInfos => _schoolInfos ??= $SchoolInfosTable(this);
  SchoolInfoDao _schoolInfoDao;
  SchoolInfoDao get schoolInfoDao =>
      _schoolInfoDao ??= SchoolInfoDao(this as MyDB);
  @override
  List<TableInfo> get allTables => [schoolInfos];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$SchoolInfoDaoMixin on DatabaseAccessor<MyDB> {
  $SchoolInfosTable get schoolInfos => db.schoolInfos;
}
