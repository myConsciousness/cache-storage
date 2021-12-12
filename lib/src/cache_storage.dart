// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:cache_storage/src/cache_storage_impl.dart';

abstract class CacheStorage {
  /// Returns the singleton instance of [CacheStorage].
  factory CacheStorage.open() => CacheStorageImpl.instance;

  dynamic match({
    required String key,
    List<String> subKeys,
  });

  /// Saves [value] as a cache linked to [key] and [subKeys].
  void save({
    required String key,
    List<String> subKeys,
    required dynamic value,
  });

  /// Deleted a cache linked to [key] and [subKeys].
  void deleteBy({
    required String key,
    List<String> subKeys,
  });

  /// Deletes all caches from storage.
  void delete();

  /// Returns true if cache storage has value linked to [key] and [subKeys], otherwise false.
  bool has({
    required String key,
    List<String> subKeys,
  });
}
