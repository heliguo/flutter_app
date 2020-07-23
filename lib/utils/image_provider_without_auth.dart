import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui show Codec;
import 'dart:ui' show Size, Locale, TextDirection, hashValues;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

///解决HTTPS证书验证问题
class NetworkImageWithoutAuth extends ImageProvider<NetworkImageWithoutAuth> {
  /// Creates an object that fetches the image at the given URL.
  ///
  /// The arguments must not be null.
  const NetworkImageWithoutAuth(this.url, {this.scale = 1.0, this.headers})
      : assert(url != null),
        assert(scale != null);

  /// The URL from which the image will be fetched.
  final String url;

  /// The scale to place in the [ImageInfo] object of the image.
  final double scale;

  /// The HTTP headers that will be used with [HttpClient.get] to fetch image from network.
  final Map<String, String> headers;

  @override
  Future<NetworkImageWithoutAuth> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture<NetworkImageWithoutAuth>(this);
  }

  @override
  ImageStreamCompleter load(NetworkImageWithoutAuth key, decode) {
    return MultiFrameImageStreamCompleter(
      codec: _loadAsync(key),
      scale: key.scale,
      informationCollector: () sync* {
        yield DiagnosticsProperty<ImageProvider>('Image provider', this);
        yield DiagnosticsProperty<NetworkImageWithoutAuth>('Image key', key);
      },
    );
  }

//  @override
//  ImageStreamCompleter load(NetworkImageWithoutAuth key) {
//    return MultiFrameImageStreamCompleter(
//      codec: _loadAsync(key),
//      scale: key.scale,
//      informationCollector: () sync* {
//        yield DiagnosticsProperty<ImageProvider>('Image provider', this);
//        yield DiagnosticsProperty<NetworkImageWithoutAuth>('Image key', key);
//      },
//    );
//  }

  static final HttpClient _httpClient = HttpClient();

  Future<ui.Codec> _loadAsync(NetworkImageWithoutAuth key) async {
    assert(key == this);
    //解决不安全证书校验通不过的问题
    _httpClient.badCertificateCallback =
        (X509Certificate cert, String host, int port) {
      return true;
    };
    final Uri resolved = Uri.base.resolve(key.url);
    //todo:打开https请求
    final HttpClientRequest request = await _httpClient.getUrl(resolved);
    //todo:设置请求头
    request.headers.add("token", "token");
    final HttpClientResponse response = await request.close();
    if (response.statusCode != HttpStatus.ok)
      throw Exception(
          'HTTP request failed, statusCode: ${response?.statusCode}, $resolved');

    final Uint8List bytes = await consolidateHttpClientResponseBytes(response);
    if (bytes.lengthInBytes == 0)
      throw Exception('NetworkImage is an empty file: $resolved');

    return PaintingBinding.instance.instantiateImageCodec(bytes);
  }

  @override
  bool operator ==(dynamic other) {
    if (other.runtimeType != runtimeType) return false;
    final NetworkImageWithoutAuth typedOther = other;
    return url == typedOther.url && scale == typedOther.scale;
  }

  @override
  int get hashCode => hashValues(url, scale);

  @override
  String toString() => '$runtimeType("$url", scale: $scale)';
}
