// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:cache_storage/cache_storage.dart';

void main() {
  // Get singleton instance of cache storage.
  final cacheStorage = CacheStorage.open();

  // You can save any objects with key.
  cacheStorage.save(
    key: 'testKey',
    value: ['spmething1', 'something2'],
  );

  // Also you can save any objects with key and sub keys.
  cacheStorage.save(
    key: 'testKey',
    subKeys: ['key1', 'key2'],
    value: 'something',
  );

  // It returns value 'something' linked to key and sub keys.
  cacheStorage.match(key: 'testKey', subKeys: ['key1', 'key2']);

  // You can delete cache by key and sub keys.
  cacheStorage.deleteBy(key: 'testKey', subKeys: ['key1', 'key2']);
  // You can delete all at the same time.
  cacheStorage.delete();

  // You can check storage has cache linked to
  // key and sub keys or not.
  if (cacheStorage.has(key: 'testKey')) {
    // Do something.
  }
}
