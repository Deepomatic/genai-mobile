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

import 'rag/engine.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(1, 5911036239171600757),
      name: 'InternalDoc',
      lastPropertyId: const obx_int.IdUid(3, 8668920910156642289),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 2893954332393227798),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 2917185864104047775),
            name: 'embedding',
            type: 28,
            flags: 8,
            indexId: const obx_int.IdUid(1, 943994291960045020),
            hnswParams: obx_int.ModelHnswParams(
              dimensions: 384,
            )),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 8668920910156642289),
            name: 'uid',
            type: 9,
            flags: 2048,
            indexId: const obx_int.IdUid(2, 4035030762124604165))
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
      lastEntityId: const obx_int.IdUid(1, 5911036239171600757),
      lastIndexId: const obx_int.IdUid(2, 4035030762124604165),
      lastRelationId: const obx_int.IdUid(0, 0),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    InternalDoc: obx_int.EntityDefinition<InternalDoc>(
        model: _entities[0],
        toOneRelations: (InternalDoc object) => [],
        toManyRelations: (InternalDoc object) => {},
        getId: (InternalDoc object) => object.id,
        setId: (InternalDoc object, int id) {
          object.id = id;
        },
        objectToFB: (InternalDoc object, fb.Builder fbb) {
          final embeddingOffset = object.embedding == null
              ? null
              : fbb.writeListFloat32(object.embedding!);
          final uidOffset = fbb.writeString(object.uid);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, embeddingOffset);
          fbb.addOffset(2, uidOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final uidParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final embeddingParam =
              const fb.ListReader<double>(fb.Float32Reader(), lazy: false)
                  .vTableGetNullable(buffer, rootOffset, 6);
          final object = InternalDoc(uidParam, embeddingParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [InternalDoc] entity fields to define ObjectBox queries.
class InternalDoc_ {
  /// See [InternalDoc.id].
  static final id =
      obx.QueryIntegerProperty<InternalDoc>(_entities[0].properties[0]);

  /// See [InternalDoc.embedding].
  static final embedding =
      obx.QueryHnswProperty<InternalDoc>(_entities[0].properties[1]);

  /// See [InternalDoc.uid].
  static final uid =
      obx.QueryStringProperty<InternalDoc>(_entities[0].properties[2]);
}
