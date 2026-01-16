import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeliveryAddressesRecord extends FirestoreRecord {
  DeliveryAddressesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "modified_at" field.
  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _modifiedAt;
  bool hasModifiedAt() => _modifiedAt != null;

  // "default_address" field.
  bool? _defaultAddress;
  bool get defaultAddress => _defaultAddress ?? false;
  bool hasDefaultAddress() => _defaultAddress != null;

  // "address_label" field.
  String? _addressLabel;
  String get addressLabel => _addressLabel ?? '';
  bool hasAddressLabel() => _addressLabel != null;

  // "address_string" field.
  String? _addressString;
  String get addressString => _addressString ?? '';
  bool hasAddressString() => _addressString != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "archived" field.
  bool? _archived;
  bool get archived => _archived ?? false;
  bool hasArchived() => _archived != null;

  // "address" field.
  AddressStruct? _address;
  AddressStruct get address => _address ?? AddressStruct();
  bool hasAddress() => _address != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _owner = snapshotData['owner'] as DocumentReference?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _modifiedAt = snapshotData['modified_at'] as DateTime?;
    _defaultAddress = snapshotData['default_address'] as bool?;
    _addressLabel = snapshotData['address_label'] as String?;
    _addressString = snapshotData['address_string'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _archived = snapshotData['archived'] as bool?;
    _address = snapshotData['address'] is AddressStruct
        ? snapshotData['address']
        : AddressStruct.maybeFromMap(snapshotData['address']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('delivery_addresses')
          : FirebaseFirestore.instance.collectionGroup('delivery_addresses');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('delivery_addresses').doc(id);

  static Stream<DeliveryAddressesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DeliveryAddressesRecord.fromSnapshot(s));

  static Future<DeliveryAddressesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => DeliveryAddressesRecord.fromSnapshot(s));

  static DeliveryAddressesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DeliveryAddressesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DeliveryAddressesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DeliveryAddressesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DeliveryAddressesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DeliveryAddressesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDeliveryAddressesRecordData({
  DocumentReference? owner,
  DateTime? createdAt,
  DateTime? modifiedAt,
  bool? defaultAddress,
  String? addressLabel,
  String? addressString,
  LatLng? location,
  bool? archived,
  AddressStruct? address,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'owner': owner,
      'created_at': createdAt,
      'modified_at': modifiedAt,
      'default_address': defaultAddress,
      'address_label': addressLabel,
      'address_string': addressString,
      'location': location,
      'archived': archived,
      'address': AddressStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "address" field.
  addAddressStructData(firestoreData, address, 'address');

  return firestoreData;
}

class DeliveryAddressesRecordDocumentEquality
    implements Equality<DeliveryAddressesRecord> {
  const DeliveryAddressesRecordDocumentEquality();

  @override
  bool equals(DeliveryAddressesRecord? e1, DeliveryAddressesRecord? e2) {
    return e1?.owner == e2?.owner &&
        e1?.createdAt == e2?.createdAt &&
        e1?.modifiedAt == e2?.modifiedAt &&
        e1?.defaultAddress == e2?.defaultAddress &&
        e1?.addressLabel == e2?.addressLabel &&
        e1?.addressString == e2?.addressString &&
        e1?.location == e2?.location &&
        e1?.archived == e2?.archived &&
        e1?.address == e2?.address;
  }

  @override
  int hash(DeliveryAddressesRecord? e) => const ListEquality().hash([
        e?.owner,
        e?.createdAt,
        e?.modifiedAt,
        e?.defaultAddress,
        e?.addressLabel,
        e?.addressString,
        e?.location,
        e?.archived,
        e?.address
      ]);

  @override
  bool isValidKey(Object? o) => o is DeliveryAddressesRecord;
}
