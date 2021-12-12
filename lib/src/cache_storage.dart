// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:cache_storage/src/cache_storage_impl.dart';

/// This class provides a simple and intuitive way to handle the cache.
///
/// The cache managed by this [CacheStorage] has a key and a value whose
/// specification is associated with any number of subkeys.
///
/// The cache key and value are required to be specified, but the subkey is not required.
/// Subkeys can be used mainly to express structures that are difficult to express
/// with keys alone. The key and subkeys of the cache are strings, and the value
/// can be set to any type, but you need to pay attention to the original type
/// when getting this value.
///
/// To get a value from the cache, use the [match] method.
/// By specifying a key or subkey associated with the cache, you can get the value of
/// the cache associated with it. If there is no cache associated with the specified key
/// and subkey, null will be returned. Use the [has] method to check if there is
/// a cache associated with the key before get the value.
///
/// When deleting a cache that is no longer needed, there are two methods.
/// [deleteBy] method that executes by specifying the key or subkey associated with
/// the cache, and [delete] method that deletes all caches at once.
///
/// **_Example_**
///
/// ```dart
/// void main() {
///   final cacheStorage = CacheStorage.open();
///
///   // You can save any objects with key.
///   cacheStorage.save(
///     key: 'testKey',
///     value: ['spmething1', 'something2'],
///   );
///
///   // Also you can save any objects with key and sub keys.
///   cacheStorage.save(
///     key: 'testKey',
///     subKeys: ['key1', 'key2'],
///     value: 'something',
///   );
///
///   // It returns value 'something' linked to key and sub keys.
///   cacheStorage.match(key: 'testKey', subKeys: ['key1', 'key2']);
///
///   // You can delete cache by key and sub keys.
///   cacheStorage.deleteBy(key: 'testKey', subKeys: ['key1', 'key2']);
///   // You can delete all at the same time.
///   cacheStorage.delete();
///
///   // You can check storage has cache linked to
///   // key and sub keys or not.
///   if (cacheStorage.has(key: 'testKey')) {
///     // Do something.
///   }
/// }
/// ```
abstract class CacheStorage {
  /// Returns the singleton instance of [CacheStorage].
  factory CacheStorage.open() => CacheStorageImpl.instance;

  /// Returns cache value linked to [key] and [subKeys].
  ///
  /// If there are multiple caches associated with a key in the storage
  /// and only [key] is specified as an argument, the value of the first matching cache
  /// will be returned.
  ///
  /// If there is no cache associated with the [key] and [subKeys], null will be returned.
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
