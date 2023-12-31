// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';

import 'objext_box/model.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 7331877606983578011),
      name: 'News',
      lastPropertyId: const IdUid(7, 5186628394958280596),
      flags: 2,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 2722578511425450493),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 8475613875164889386),
            name: 'title',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 6611827131286986229),
            name: 'description',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 136290239065577202),
            name: 'url',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 2476104349936919780),
            name: 'urlToImage',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 127862928846185675),
            name: 'publishedAt',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 5186628394958280596),
            name: 'author',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Shortcut for [Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [Store.new] for an explanation of all parameters.
Store openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) =>
    Store(getObjectBoxModel(),
        directory: directory,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// Returns the ObjectBox model definition for this project for use with
/// [Store.new].
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 7331877606983578011),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    News: EntityDefinition<News>(
        model: _entities[0],
        toOneRelations: (News object) => [],
        toManyRelations: (News object) => {},
        getId: (News object) => object.id,
        setId: (News object, int id) {
          object.id = id;
        },
        objectToFB: (News object, fb.Builder fbb) {
          final titleOffset = fbb.writeString(object.title);
          final descriptionOffset = fbb.writeString(object.description);
          final urlOffset = fbb.writeString(object.url);
          final urlToImageOffset = fbb.writeString(object.urlToImage);
          final publishedAtOffset = fbb.writeString(object.publishedAt);
          final authorOffset = fbb.writeString(object.author);
          fbb.startTable(8);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, titleOffset);
          fbb.addOffset(2, descriptionOffset);
          fbb.addOffset(3, urlOffset);
          fbb.addOffset(4, urlToImageOffset);
          fbb.addOffset(5, publishedAtOffset);
          fbb.addOffset(6, authorOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final titleParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final descriptionParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, '');
          final urlParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 10, '');
          final urlToImageParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 12, '');
          final publishedAtParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 14, '');
          final authorParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 16, '');
          final object = News(titleParam, descriptionParam, urlParam,
              urlToImageParam, publishedAtParam, authorParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [News] entity fields to define ObjectBox queries.
class News_ {
  /// see [News.id]
  static final id = QueryIntegerProperty<News>(_entities[0].properties[0]);

  /// see [News.title]
  static final title = QueryStringProperty<News>(_entities[0].properties[1]);

  /// see [News.description]
  static final description =
      QueryStringProperty<News>(_entities[0].properties[2]);

  /// see [News.url]
  static final url = QueryStringProperty<News>(_entities[0].properties[3]);

  /// see [News.urlToImage]
  static final urlToImage =
      QueryStringProperty<News>(_entities[0].properties[4]);

  /// see [News.publishedAt]
  static final publishedAt =
      QueryStringProperty<News>(_entities[0].properties[5]);

  /// see [News.author]
  static final author = QueryStringProperty<News>(_entities[0].properties[6]);
}
