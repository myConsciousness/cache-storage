// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:collection/collection.dart';

// Project imports:
import 'package:cache_storage/cache_storage.dart';
import 'package:cache_storage/src/cache.dart';

class CacheStorageImpl implements CacheStorage {
  /// The internal constructor for singleton.
  CacheStorageImpl._internal();

  /// Returns the singleton instance of [CacheStorageImpl].
  static CacheStorageImpl get instance => _singletonInstance;

  /// The singleton instance of [CacheStorageImpl].
  static final _singletonInstance = CacheStorageImpl._internal();

  /// The caches
  final List<Cache> _caches = [];

  @override
  dynamic match({
    required String key,
    List<String> subKeys = const [],
  }) {
    for (final cache in _caches) {
      if (cache.key == key && ListEquality().equals(cache.subKeys, subKeys)) {
        return cache.value;
      }
    }

    return null;
  }

  @override
  void save({
    required String key,
    List<String> subKeys = const [],
    required dynamic value,
  }) {
    if (has(key: key, subKeys: subKeys)) {
      // Delete old cache.
      deleteBy(key: key, subKeys: subKeys);
    }

    _caches.add(
      Cache.from(
        key: key,
        subKeys: subKeys,
        value: value,
      ),
    );
  }

  @override
  void deleteBy({
    required String key,
    List<String> subKeys = const [],
  }) {
    int cacheIndex = 0;
    for (final cache in _caches) {
      if (cache.key != key || !ListEquality().equals(cache.subKeys, subKeys)) {
        cacheIndex++;
        continue;
      }

      _caches.removeAt(cacheIndex);
      return;
    }
  }

  @override
  void delete() {
    _caches.clear();
  }

  @override
  bool has({
    required String key,
    List<String> subKeys = const [],
  }) =>
      match(key: key, subKeys: subKeys) != null;
}
