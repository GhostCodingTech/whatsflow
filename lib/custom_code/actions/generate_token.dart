// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:typed_data';
import 'dart:convert' show utf8;
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'dart:math';

const version = '006';

class AccessToken {
  AccessToken({
    required this.appId,
    required this.appCertificate,
    required this.channelName,
    required this.uid,
  });

  /// App ID issued to you by Agora.
  final String appId;

  /// App Certificate issued to you by Agora.
  final String appCertificate;

  /// Name of the Agora Channel you wish to join.
  final String channelName;

  /// User ID of the user joining the Agora Channel.
  final String uid;

  /// Timestamps when the privileges will expire.
  final Map<RtcPrivilege, int> privilegeTimestamps = {};

  /// Salt required to generate a signature.
  final int salt = (Random().nextDouble() * 0xffffffff).floor();

  /// Timestamp when the token will expire.
  final int timestamp =
      DateTimeExtensions(DateTime.now()).secondsSinceEpoch + 24 * 3600;

  /// Builds the token with the given properties.
  String build() {
    final message = ByteBuf()
        .putUint32(salt)
        .putUint32(timestamp)
        .putUint32Map(privilegeTimestamps.map(
          (privilege, timestamp) => MapEntry(privilege.id, timestamp),
        ))
        .pack();

    final toSign = Uint8List.fromList([
      ...appId.codeUnits,
      ...channelName.codeUnits,
      ...uid.codeUnits,
      ...message,
    ]);

    final signature = Uint8List.fromList(
      Hmac(sha256, appCertificate.codeUnits).convert(toSign).bytes,
    );

    final crcChannel = Crc32.calculate(channelName.codeUnits);
    final crcUid = Crc32.calculate(uid.codeUnits);

    final content = ByteBuf()
        .putBytes(signature)
        .putUint32(crcChannel)
        .putUint32(crcUid)
        .putBytes(message)
        .pack();

    return version + appId + base64.encode(content);
  }
}

extension DateTimeExtensions on DateTime {
  int get secondsSinceEpoch => millisecondsSinceEpoch ~/ 1000;
}

class ByteBuf {
  ByteBuf() {
    buffer.fillRange(0, buffer.length, 0);
  }

  final buffer = Uint8List(1024);
  int position = 0;

  Uint8List pack() {
    final out = Uint8List(position);
    out.setAll(0, buffer.sublist(0, position));
    return out;
  }

  ByteBuf putUint16(int v) {
    final bytes = ByteData(2);
    bytes.setUint16(0, v, Endian.little);
    buffer.setAll(position, bytes.buffer.asUint8List());
    position += 2;
    return this;
  }

  ByteBuf putUint32(int v) {
    final bytes = ByteData(4);
    bytes.setUint32(0, v, Endian.little);
    buffer.setAll(position, bytes.buffer.asUint8List());
    position += 4;
    return this;
  }

  ByteBuf putBytes(Uint8List bytes) {
    putUint16(bytes.length);
    buffer.setAll(position, bytes);
    position += bytes.length;
    return this;
  }

  ByteBuf putUint32Map(Map<int, int> map) {
    putUint16(map.length);
    map.forEach((key, value) {
      putUint16(key);
      putUint32(value);
    });
    return this;
  }
}

/// Computes Cyclic Redundancy Check values using the CRC32 algorithm.
/// Computes Cyclic Redundancy Check values using the CRC32 algorithm.
class Crc32 {
  Crc32._();

  /// Calculates a CRC32 value for the given input.
  ///
  /// The return value is an unsigned integer.
  ///
  /// You may optionally specify the beginning CRC value.
  static int calculate(var input, [int crc = 0]) {
    if (input == null) throw ArgumentError.notNull('input');
    if (input is String) input = utf8.encode(input);

    crc = crc ^ (0xffffffff);

    for (var byte in input) {
      if (!(byte >= -128 && byte <= 255)) {
        throw FormatException('Invalid value in input: $byte');
      }

      var x = _haxListTable[(crc ^ byte) & 0xff];
      crc = (crc & 0xffffffff) >> 8; // crc >>> 8 (32-bit unsigned integer)
      crc ^= x;
    }

    crc = crc ^ (0xffffffff);

    // Turns the signed integer into an unsigned integer.
    return crc & 0xffffffff;
  }

  static const _haxListTable = [
    0x00000000,
    0x77073096,
    0xEE0E612C,
    0x990951BA,
    0x076DC419,
    0x706AF48F,
    0xE963A535,
    0x9E6495A3,
    0x0EDB8832,
    0x79DCB8A4,
    0xE0D5E91E,
    0x97D2D988,
    0x09B64C2B,
    0x7EB17CBD,
    0xE7B82D07,
    0x90BF1D91,
    0x1DB71064,
    0x6AB020F2,
    0xF3B97148,
    0x84BE41DE,
    0x1ADAD47D,
    0x6DDDE4EB,
    0xF4D4B551,
    0x83D385C7,
    0x136C9856,
    0x646BA8C0,
    0xFD62F97A,
    0x8A65C9EC,
    0x14015C4F,
    0x63066CD9,
    0xFA0F3D63,
    0x8D080DF5,
    0x3B6E20C8,
    0x4C69105E,
    0xD56041E4,
    0xA2677172,
    0x3C03E4D1,
    0x4B04D447,
    0xD20D85FD,
    0xA50AB56B,
    0x35B5A8FA,
    0x42B2986C,
    0xDBBBC9D6,
    0xACBCF940,
    0x32D86CE3,
    0x45DF5C75,
    0xDCD60DCF,
    0xABD13D59,
    0x26D930AC,
    0x51DE003A,
    0xC8D75180,
    0xBFD06116,
    0x21B4F4B5,
    0x56B3C423,
    0xCFBA9599,
    0xB8BDA50F,
    0x2802B89E,
    0x5F058808,
    0xC60CD9B2,
    0xB10BE924,
    0x2F6F7C87,
    0x58684C11,
    0xC1611DAB,
    0xB6662D3D,
    0x76DC4190,
    0x01DB7106,
    0x98D220BC,
    0xEFD5102A,
    0x71B18589,
    0x06B6B51F,
    0x9FBFE4A5,
    0xE8B8D433,
    0x7807C9A2,
    0x0F00F934,
    0x9609A88E,
    0xE10E9818,
    0x7F6A0DBB,
    0x086D3D2D,
    0x91646C97,
    0xE6635C01,
    0x6B6B51F4,
    0x1C6C6162,
    0x856530D8,
    0xF262004E,
    0x6C0695ED,
    0x1B01A57B,
    0x8208F4C1,
    0xF50FC457,
    0x65B0D9C6,
    0x12B7E950,
    0x8BBEB8EA,
    0xFCB9887C,
    0x62DD1DDF,
    0x15DA2D49,
    0x8CD37CF3,
    0xFBD44C65,
    0x4DB26158,
    0x3AB551CE,
    0xA3BC0074,
    0xD4BB30E2,
    0x4ADFA541,
    0x3DD895D7,
    0xA4D1C46D,
    0xD3D6F4FB,
    0x4369E96A,
    0x346ED9FC,
    0xAD678846,
    0xDA60B8D0,
    0x44042D73,
    0x33031DE5,
    0xAA0A4C5F,
    0xDD0D7CC9,
    0x5005713C,
    0x270241AA,
    0xBE0B1010,
    0xC90C2086,
    0x5768B525,
    0x206F85B3,
    0xB966D409,
    0xCE61E49F,
    0x5EDEF90E,
    0x29D9C998,
    0xB0D09822,
    0xC7D7A8B4,
    0x59B33D17,
    0x2EB40D81,
    0xB7BD5C3B,
    0xC0BA6CAD,
    0xEDB88320,
    0x9ABFB3B6,
    0x03B6E20C,
    0x74B1D29A,
    0xEAD54739,
    0x9DD277AF,
    0x04DB2615,
    0x73DC1683,
    0xE3630B12,
    0x94643B84,
    0x0D6D6A3E,
    0x7A6A5AA8,
    0xE40ECF0B,
    0x9309FF9D,
    0x0A00AE27,
    0x7D079EB1,
    0xF00F9344,
    0x8708A3D2,
    0x1E01F268,
    0x6906C2FE,
    0xF762575D,
    0x806567CB,
    0x196C3671,
    0x6E6B06E7,
    0xFED41B76,
    0x89D32BE0,
    0x10DA7A5A,
    0x67DD4ACC,
    0xF9B9DF6F,
    0x8EBEEFF9,
    0x17B7BE43,
    0x60B08ED5,
    0xD6D6A3E8,
    0xA1D1937E,
    0x38D8C2C4,
    0x4FDFF252,
    0xD1BB67F1,
    0xA6BC5767,
    0x3FB506DD,
    0x48B2364B,
    0xD80D2BDA,
    0xAF0A1B4C,
    0x36034AF6,
    0x41047A60,
    0xDF60EFC3,
    0xA867DF55,
    0x316E8EEF,
    0x4669BE79,
    0xCB61B38C,
    0xBC66831A,
    0x256FD2A0,
    0x5268E236,
    0xCC0C7795,
    0xBB0B4703,
    0x220216B9,
    0x5505262F,
    0xC5BA3BBE,
    0xB2BD0B28,
    0x2BB45A92,
    0x5CB36A04,
    0xC2D7FFA7,
    0xB5D0CF31,
    0x2CD99E8B,
    0x5BDEAE1D,
    0x9B64C2B0,
    0xEC63F226,
    0x756AA39C,
    0x026D930A,
    0x9C0906A9,
    0xEB0E363F,
    0x72076785,
    0x05005713,
    0x95BF4A82,
    0xE2B87A14,
    0x7BB12BAE,
    0x0CB61B38,
    0x92D28E9B,
    0xE5D5BE0D,
    0x7CDCEFB7,
    0x0BDBDF21,
    0x86D3D2D4,
    0xF1D4E242,
    0x68DDB3F8,
    0x1FDA836E,
    0x81BE16CD,
    0xF6B9265B,
    0x6FB077E1,
    0x18B74777,
    0x88085AE6,
    0xFF0F6A70,
    0x66063BCA,
    0x11010B5C,
    0x8F659EFF,
    0xF862AE69,
    0x616BFFD3,
    0x166CCF45,
    0xA00AE278,
    0xD70DD2EE,
    0x4E048354,
    0x3903B3C2,
    0xA7672661,
    0xD06016F7,
    0x4969474D,
    0x3E6E77DB,
    0xAED16A4A,
    0xD9D65ADC,
    0x40DF0B66,
    0x37D83BF0,
    0xA9BCAE53,
    0xDEBB9EC5,
    0x47B2CF7F,
    0x30B5FFE9,
    0xBDBDF21C,
    0xCABAC28A,
    0x53B39330,
    0x24B4A3A6,
    0xBAD03605,
    0xCDD70693,
    0x54DE5729,
    0x23D967BF,
    0xB3667A2E,
    0xC4614AB8,
    0x5D681B02,
    0x2A6F2B94,
    0xB40BBE37,
    0xC30C8EA1,
    0x5A05DF1B,
    0x2D02EF8D
  ];
}

enum RtcPrivilege {
  joinChannel(1),
  publishAudioStream(2),
  publishVideoStream(3),
  publishDataStream(4);

  const RtcPrivilege(this.id);

  final int id;
}

enum RtcRole {
  /// Recommended
  publisher(1),

  /// Only use this role if your scenario require authentication for [Hosting-in](https://docs.agora.io/en/Agora%20Platform/terms?platform=All%20Platforms#hosting-in).
  ///
  /// In order for this role to take effect, please contact our support team
  /// to enable authentication for Hosting-in for you. Otherwise,
  /// [subscriber] still has the same privileges as [publisher].
  subscriber(2);

  const RtcRole(this.id);

  final int id;
}

/// A helper class to build a token for Agora WebRTC connection.
class RtcTokenBuilder {
  RtcTokenBuilder._();

  /// Builds a token with the given properties.
  static String build({
    required String appId,
    required String appCertificate,
    required String channelName,
    required String uid,
    required RtcRole role,
    required int expireTimestamp,
  }) {
    final token = AccessToken(
      appId: appId,
      appCertificate: appCertificate,
      channelName: channelName,
      uid: uid,
    );

    token.privilegeTimestamps[RtcPrivilege.joinChannel] = expireTimestamp;
    if (role == RtcRole.publisher) {
      token.privilegeTimestamps[RtcPrivilege.publishAudioStream] =
          expireTimestamp;
      token.privilegeTimestamps[RtcPrivilege.publishVideoStream] =
          expireTimestamp;
      token.privilegeTimestamps[RtcPrivilege.publishDataStream] =
          expireTimestamp;
    }

    return token.build();
  }
}

Future<String> generateToken(
  String appId,
  String appCertificate,
  String channelName,
  String uid,
) async {
  final role = RtcRole.publisher;
  // Set the expiration time for the token
  final expirationTimeInSeconds = 3600; // Token expires in 1 hour
  final currentTimestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  final expireTimestamp = currentTimestamp + expirationTimeInSeconds;

  try {
    // Generate the token
    final token = RtcTokenBuilder.build(
      appId: appId,
      appCertificate: appCertificate,
      channelName: channelName,
      uid: uid, // Now uid is a String
      role: role,
      expireTimestamp: expireTimestamp,
    );

    return token;
  } catch (error) {
    throw Exception('Error generating token: $error');
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
