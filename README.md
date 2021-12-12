**_A most easily usable cache management library in Dart!_**

[![pub package](https://img.shields.io/pub/v/cache_storage.svg)](https://pub.dev/packages/cache_storage)
[![codecov](https://codecov.io/gh/myConsciousness/cache-storage/branch/main/graph/badge.svg?token=WITNPUI4TQ)](https://codecov.io/gh/myConsciousness/cache-storage)
[![Analyzer](https://github.com/myConsciousness/cache-storage/actions/workflows/analyzer.yml/badge.svg)](https://github.com/myConsciousness/cache-storage/actions/workflows/analyzer.yml)
[![Test](https://github.com/myConsciousness/cache-storage/actions/workflows/test.yml/badge.svg)](https://github.com/myConsciousness/cache-storage/actions/workflows/test.yml)

<!-- TOC -->

- [1. About](#1-about)
  - [1.1. Introduction](#11-introduction)
    - [1.1.1. Install Library](#111-install-library)
    - [1.1.2. Import It](#112-import-it)
    - [1.1.3. Use CacheStorage](#113-use-cachestorage)
  - [1.2. License](#12-license)
  - [1.3. More Information](#13-more-information)

<!-- /TOC -->

# 1. About

`CacheStorage` is an open-sourced Dart library.</br>
With `CacheStorage`, you can easily manage cache on your application.

## 1.1. Introduction

### 1.1.1. Install Library

**_With Dart:_**

```terminal
 dart pub add cache_storage
```

**_With Flutter:_**

```terminal
 flutter pub add cache_storage
```

### 1.1.2. Import It

```dart
import 'package:cache_storage/cache_storage.dart';
```

### 1.1.3. Use CacheStorage

```dart
import 'package:cache_storage/cache_storage.dart';

void main() {
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
```

## 1.2. License

```license
Copyright (c) 2021, Kato Shinya. All rights reserved.
Use of this source code is governed by a
BSD-style license that can be found in the LICENSE file.
```

## 1.3. More Information

`CacheStorage` was designed and implemented by **_Kato Shinya_**.

- [Creator Profile](https://github.com/myConsciousness)
- [License](https://github.com/myConsciousness/cache-storage/blob/main/LICENSE)
- [API Document](https://pub.dev/documentation/cache_storage/latest/cache_storage/cache_storage-library.html)
- [Release Note](https://github.com/myConsciousness/cache-storage/releases)
- [Bug Report](https://github.com/myConsciousness/cache-storage/issues)
