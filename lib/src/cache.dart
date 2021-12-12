// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:collection/collection.dart';

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

  @override
  String toString() => 'Cache(key: $key, subKeys: $subKeys, value: $value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Cache &&
        other.key == key &&
        listEquals(other.subKeys, subKeys) &&
        other.value == value;
  }

  @override
  int get hashCode => key.hashCode ^ subKeys.hashCode ^ value.hashCode;
}
