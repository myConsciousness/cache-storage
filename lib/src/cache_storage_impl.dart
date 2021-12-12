// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:cache_storage/cache_storage.dart';

class CacheStorageImpl implements CacheStorage {
  /// The internal constructor for singleton.
  CacheStorageImpl._internal();

  /// Returns the singleton instance of [CacheStorageImpl].
  static CacheStorageImpl get instance => _singletonInstance;

  /// The singleton instance of [CacheStorageImpl].
  static final _singletonInstance = CacheStorageImpl._internal();
}
