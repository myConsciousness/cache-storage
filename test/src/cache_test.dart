// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

// Project imports:
import 'package:cache_storage/src/cache.dart';

void main() {
  test('Test simple case.', () {
    final cache = Cache.from(
      key: 'test',
      subKeys: ['test1', 'test2'],
      value: true,
    );

    expect(cache.key, 'test');
    expect(cache.subKeys, ['test1', 'test2']);
    expect(cache.value, true);
  });

  test('Test complicated case.', () {
    final value = ['test3', 'test4'];
    final cache = Cache.from(
      key: 'test',
      subKeys: ['test'],
      value: value,
    );

    expect(cache.key, 'test');
    expect(cache.subKeys, ['test']);
    expect(cache.value, value);
  });

  test('Test when key is empty.', () {
    final cache = Cache.from(
      key: '',
      subKeys: [],
      value: false,
    );

    expect(cache.key, '');
    expect(cache.subKeys, []);
    expect(cache.value, false);
  });

  test('Test when sub keys are empty.', () {
    final cache = Cache.from(
      key: 'test',
      subKeys: [],
      value: false,
    );

    expect(cache.key, 'test');
    expect(cache.subKeys, []);
    expect(cache.value, false);
  });
}
