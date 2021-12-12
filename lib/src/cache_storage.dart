// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:cache_storage/src/cache_storage_impl.dart';

abstract class CacheStorage {
  factory CacheStorage.open() => CacheStorageImpl.instance;
}
