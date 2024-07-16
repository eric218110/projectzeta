// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again
// with `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'infra/object_box/schema/balance_schema.dart';
import 'infra/object_box/schema/card_schema.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(2, 4977839204764079953),
      name: 'BalanceSchema',
      lastPropertyId: const obx_int.IdUid(3, 2031495081324159860),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 8238025760809294974),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 626095700283820421),
            name: 'userId',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 2031495081324159860),
            name: 'value',
            type: 8,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(3, 7101468216828986967),
      name: 'CardSchema',
      lastPropertyId: const obx_int.IdUid(6, 4966538968427175033),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 1720055982385338645),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 8278710789487419143),
            name: 'color',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 5029399664390977987),
            name: 'name',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 5950943913500378479),
            name: 'lastNumbers',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 6084685927884743042),
            name: 'cardType',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 4966538968427175033),
            name: 'userId',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[])
];

/// Shortcut for [obx.Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [obx.Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
Future<obx.Store> openStore(
    {String? directory,
    int? maxDBSizeInKB,
    int? maxDataSizeInKB,
    int? fileMode,
    int? maxReaders,
    bool queriesCaseSensitiveDefault = true,
    String? macosApplicationGroup}) async {
  await loadObjectBoxLibraryAndroidCompat();
  return obx.Store(getObjectBoxModel(),
      directory: directory ?? (await defaultStoreDirectory()).path,
      maxDBSizeInKB: maxDBSizeInKB,
      maxDataSizeInKB: maxDataSizeInKB,
      fileMode: fileMode,
      maxReaders: maxReaders,
      queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
      macosApplicationGroup: macosApplicationGroup);
}

/// Returns the ObjectBox model definition for this project for use with
/// [obx.Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
      entities: _entities,
      lastEntityId: const obx_int.IdUid(3, 7101468216828986967),
      lastIndexId: const obx_int.IdUid(0, 0),
      lastRelationId: const obx_int.IdUid(0, 0),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [3388540122753542328],
      retiredIndexUids: const [],
      retiredPropertyUids: const [
        3132494809649263712,
        2052778508074584234,
        4929350653394655104
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    BalanceSchema: obx_int.EntityDefinition<BalanceSchema>(
        model: _entities[0],
        toOneRelations: (BalanceSchema object) => [],
        toManyRelations: (BalanceSchema object) => {},
        getId: (BalanceSchema object) => object.id,
        setId: (BalanceSchema object, int id) {
          object.id = id;
        },
        objectToFB: (BalanceSchema object, fb.Builder fbb) {
          final userIdOffset = fbb.writeString(object.userId);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, userIdOffset);
          fbb.addFloat64(2, object.value);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final userIdParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final valueParam =
              const fb.Float64Reader().vTableGet(buffer, rootOffset, 8, 0);
          final object = BalanceSchema(
              id: idParam, userId: userIdParam, value: valueParam);

          return object;
        }),
    CardSchema: obx_int.EntityDefinition<CardSchema>(
        model: _entities[1],
        toOneRelations: (CardSchema object) => [],
        toManyRelations: (CardSchema object) => {},
        getId: (CardSchema object) => object.id,
        setId: (CardSchema object, int id) {
          object.id = id;
        },
        objectToFB: (CardSchema object, fb.Builder fbb) {
          final colorOffset = fbb.writeString(object.color);
          final nameOffset = fbb.writeString(object.name);
          final lastNumbersOffset = fbb.writeString(object.lastNumbers);
          final cardTypeOffset = fbb.writeString(object.cardType);
          final userIdOffset = fbb.writeString(object.userId);
          fbb.startTable(7);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, colorOffset);
          fbb.addOffset(2, nameOffset);
          fbb.addOffset(3, lastNumbersOffset);
          fbb.addOffset(4, cardTypeOffset);
          fbb.addOffset(5, userIdOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final userIdParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 14, '');
          final colorParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final lastNumbersParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 10, '');
          final cardTypeParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 12, '');
          final object = CardSchema(
              id: idParam,
              userId: userIdParam,
              color: colorParam,
              name: nameParam,
              lastNumbers: lastNumbersParam,
              cardType: cardTypeParam);

          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [BalanceSchema] entity fields to define ObjectBox queries.
class BalanceSchema_ {
  /// See [BalanceSchema.id].
  static final id =
      obx.QueryIntegerProperty<BalanceSchema>(_entities[0].properties[0]);

  /// See [BalanceSchema.userId].
  static final userId =
      obx.QueryStringProperty<BalanceSchema>(_entities[0].properties[1]);

  /// See [BalanceSchema.value].
  static final value =
      obx.QueryDoubleProperty<BalanceSchema>(_entities[0].properties[2]);
}

/// [CardSchema] entity fields to define ObjectBox queries.
class CardSchema_ {
  /// See [CardSchema.id].
  static final id =
      obx.QueryIntegerProperty<CardSchema>(_entities[1].properties[0]);

  /// See [CardSchema.color].
  static final color =
      obx.QueryStringProperty<CardSchema>(_entities[1].properties[1]);

  /// See [CardSchema.name].
  static final name =
      obx.QueryStringProperty<CardSchema>(_entities[1].properties[2]);

  /// See [CardSchema.lastNumbers].
  static final lastNumbers =
      obx.QueryStringProperty<CardSchema>(_entities[1].properties[3]);

  /// See [CardSchema.cardType].
  static final cardType =
      obx.QueryStringProperty<CardSchema>(_entities[1].properties[4]);

  /// See [CardSchema.userId].
  static final userId =
      obx.QueryStringProperty<CardSchema>(_entities[1].properties[5]);
}