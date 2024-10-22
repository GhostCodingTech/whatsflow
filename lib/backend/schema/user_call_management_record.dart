import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserCallManagementRecord extends FirestoreRecord {
  UserCallManagementRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "incomming" field.
  bool? _incomming;
  bool get incomming => _incomming ?? false;
  bool hasIncomming() => _incomming != null;

  // "video_call_request" field.
  bool? _videoCallRequest;
  bool get videoCallRequest => _videoCallRequest ?? false;
  bool hasVideoCallRequest() => _videoCallRequest != null;

  // "in_call" field.
  bool? _inCall;
  bool get inCall => _inCall ?? false;
  bool hasInCall() => _inCall != null;

  // "activeCallRef" field.
  DocumentReference? _activeCallRef;
  DocumentReference? get activeCallRef => _activeCallRef;
  bool hasActiveCallRef() => _activeCallRef != null;

  void _initializeFields() {
    _active = snapshotData['active'] as bool?;
    _incomming = snapshotData['incomming'] as bool?;
    _videoCallRequest = snapshotData['video_call_request'] as bool?;
    _inCall = snapshotData['in_call'] as bool?;
    _activeCallRef = snapshotData['activeCallRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('UserCallManagement');

  static Stream<UserCallManagementRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserCallManagementRecord.fromSnapshot(s));

  static Future<UserCallManagementRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => UserCallManagementRecord.fromSnapshot(s));

  static UserCallManagementRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserCallManagementRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserCallManagementRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserCallManagementRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserCallManagementRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserCallManagementRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserCallManagementRecordData({
  bool? active,
  bool? incomming,
  bool? videoCallRequest,
  bool? inCall,
  DocumentReference? activeCallRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'active': active,
      'incomming': incomming,
      'video_call_request': videoCallRequest,
      'in_call': inCall,
      'activeCallRef': activeCallRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserCallManagementRecordDocumentEquality
    implements Equality<UserCallManagementRecord> {
  const UserCallManagementRecordDocumentEquality();

  @override
  bool equals(UserCallManagementRecord? e1, UserCallManagementRecord? e2) {
    return e1?.active == e2?.active &&
        e1?.incomming == e2?.incomming &&
        e1?.videoCallRequest == e2?.videoCallRequest &&
        e1?.inCall == e2?.inCall &&
        e1?.activeCallRef == e2?.activeCallRef;
  }

  @override
  int hash(UserCallManagementRecord? e) => const ListEquality().hash([
        e?.active,
        e?.incomming,
        e?.videoCallRequest,
        e?.inCall,
        e?.activeCallRef
      ]);

  @override
  bool isValidKey(Object? o) => o is UserCallManagementRecord;
}
