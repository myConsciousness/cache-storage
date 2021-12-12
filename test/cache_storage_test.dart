// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

// Project imports:
import 'package:cache_storage/cache_storage.dart';

void main() {
  test('Test singleton instance.', () {
    final cacheStorage = CacheStorage.open();
    expect(cacheStorage == CacheStorage.open(), true);
  });

  group('Test match method.', () {
    test('Test when matches key.', () {
      final cacheStorage = CacheStorage.open();
      cacheStorage.save(key: 'test', value: true);

      expect(cacheStorage.match(key: 'test'), true);
    });

    test('Test when matches key and sub keys.', () {
      final cacheStorage = CacheStorage.open();
      cacheStorage.save(
        key: 'test',
        subKeys: ['test4', 'test5'],
        value: true,
      );

      expect(
          cacheStorage.match(key: 'test', subKeys: ['test4', 'test5']), true);
    });

    test('Test when does not matches key.', () {
      final cacheStorage = CacheStorage.open();
      cacheStorage.save(
        key: 'test',
        subKeys: ['test4', 'test5'],
        value: true,
      );

      expect(cacheStorage.match(key: 'not_exist', subKeys: ['test4', 'test5']),
          null);
    });
  });

  group('Test save method.', () {
    test('Test for a new cache.', () {
      final cacheStorage = CacheStorage.open();
      cacheStorage.save(key: 'test', value: true);
      expect(cacheStorage.match(key: 'test'), true);
    });

    test('Test for a duplicate cache.', () {
      final cacheStorage = CacheStorage.open();
      cacheStorage.save(key: 'test', value: true);
      expect(cacheStorage.match(key: 'test'), true);

      cacheStorage.save(key: 'test', value: false);
      expect(cacheStorage.match(key: 'test'), false);
    });
  });

  group('Test deleteBy method.', () {
    test('Test delete by key.', () {
      final cacheStorage = CacheStorage.open();
      cacheStorage.save(key: 'test', value: true);
      expect(cacheStorage.match(key: 'test'), true);

      cacheStorage.deleteBy(key: 'test');
      expect(cacheStorage.match(key: 'test'), null);
    });

    test('Test delete by key and sub keys.', () {
      final cacheStorage = CacheStorage.open();
      cacheStorage.save(key: 'test', subKeys: ['test', 'test3'], value: true);
      expect(cacheStorage.match(key: 'test', subKeys: ['test', 'test3']), true);

      cacheStorage.deleteBy(key: 'test', subKeys: ['test', 'test3']);
      expect(cacheStorage.match(key: 'test', subKeys: ['test', 'test3']), null);
    });

    test('Test when does not match with key and sub keys.', () {
      final cacheStorage = CacheStorage.open();
      cacheStorage.save(key: 'test', subKeys: ['test', 'test3'], value: true);
      expect(cacheStorage.match(key: 'test', subKeys: ['test', 'test3']), true);

      cacheStorage.deleteBy(key: 'not_exist', subKeys: ['test', 'test3']);
      expect(cacheStorage.match(key: 'test', subKeys: ['test', 'test3']), true);
    });
  });

  group('Test delete method.', () {
    test('Test simple case.', () {
      final cacheStorage = CacheStorage.open();
      cacheStorage.save(key: 'test', subKeys: ['test', 'test3'], value: true);
      cacheStorage.save(key: 'test2', subKeys: ['test', 'test3'], value: true);
      cacheStorage.save(key: 'test3', subKeys: ['test', 'test3'], value: true);
      cacheStorage.save(key: 'test4', subKeys: ['test', 'test3'], value: true);
      expect(cacheStorage.match(key: 'test', subKeys: ['test', 'test3']), true);
      expect(
          cacheStorage.match(key: 'test2', subKeys: ['test', 'test3']), true);
      expect(
          cacheStorage.match(key: 'test3', subKeys: ['test', 'test3']), true);
      expect(
          cacheStorage.match(key: 'test4', subKeys: ['test', 'test3']), true);

      cacheStorage.delete();

      expect(cacheStorage.match(key: 'test', subKeys: ['test', 'test3']), null);
      expect(
          cacheStorage.match(key: 'test2', subKeys: ['test', 'test3']), null);
      expect(
          cacheStorage.match(key: 'test3', subKeys: ['test', 'test3']), null);
      expect(
          cacheStorage.match(key: 'test4', subKeys: ['test', 'test3']), null);
    });
  });

  group('Test has method.', () {
    test('Test when storage has cache linked to key.', () {
      final cacheStorage = CacheStorage.open();
      cacheStorage.save(key: 'test', value: true);

      expect(cacheStorage.has(key: 'test'), true);
    });

    test('Test when storage has cache linked to key and sub keys.', () {
      final cacheStorage = CacheStorage.open();
      cacheStorage.save(key: 'test', subKeys: ['test2', 'test3'], value: true);

      expect(cacheStorage.has(key: 'test', subKeys: ['test2', 'test3']), true);
    });

    test('Test when storage has not cache linked to key.', () {
      final cacheStorage = CacheStorage.open();
      cacheStorage.save(key: 'test', subKeys: ['test2', 'test3'], value: true);

      expect(cacheStorage.has(key: 'not_exist', subKeys: ['test2', 'test3']),
          false);
    });
  });
}
