// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// This class represents a cache whose value is linked to keys and sub keys.
class Cache {
  /// Returns the new instance of [Cache] based on arguments.
  Cache.from({
    required this.key,
    required this.subKeys,
    required this.value,
  });

  /// The key
  final String key;

  /// The sub keys
  final List<String> subKeys;

  /// The value
  final dynamic value;
}
