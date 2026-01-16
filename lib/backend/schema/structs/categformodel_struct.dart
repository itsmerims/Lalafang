// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CategformodelStruct extends FFFirebaseStruct {
  CategformodelStruct({
    int? id,
    String? image,
    String? name,
    String? price,
    String? description,
    String? catetype,
    bool? isfav,
    bool? iscart,
    String? size,
    String? subtotal,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _image = image,
        _name = name,
        _price = price,
        _description = description,
        _catetype = catetype,
        _isfav = isfav,
        _iscart = iscart,
        _size = size,
        _subtotal = subtotal,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "price" field.
  String? _price;
  String get price => _price ?? '';
  set price(String? val) => _price = val;

  bool hasPrice() => _price != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "catetype" field.
  String? _catetype;
  String get catetype => _catetype ?? '';
  set catetype(String? val) => _catetype = val;

  bool hasCatetype() => _catetype != null;

  // "isfav" field.
  bool? _isfav;
  bool get isfav => _isfav ?? false;
  set isfav(bool? val) => _isfav = val;

  bool hasIsfav() => _isfav != null;

  // "iscart" field.
  bool? _iscart;
  bool get iscart => _iscart ?? false;
  set iscart(bool? val) => _iscart = val;

  bool hasIscart() => _iscart != null;

  // "size" field.
  String? _size;
  String get size => _size ?? '';
  set size(String? val) => _size = val;

  bool hasSize() => _size != null;

  // "subtotal" field.
  String? _subtotal;
  String get subtotal => _subtotal ?? '';
  set subtotal(String? val) => _subtotal = val;

  bool hasSubtotal() => _subtotal != null;

  static CategformodelStruct fromMap(Map<String, dynamic> data) =>
      CategformodelStruct(
        id: castToType<int>(data['id']),
        image: data['image'] as String?,
        name: data['name'] as String?,
        price: data['price'] as String?,
        description: data['description'] as String?,
        catetype: data['catetype'] as String?,
        isfav: data['isfav'] as bool?,
        iscart: data['iscart'] as bool?,
        size: data['size'] as String?,
        subtotal: data['subtotal'] as String?,
      );

  static CategformodelStruct? maybeFromMap(dynamic data) => data is Map
      ? CategformodelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'image': _image,
        'name': _name,
        'price': _price,
        'description': _description,
        'catetype': _catetype,
        'isfav': _isfav,
        'iscart': _iscart,
        'size': _size,
        'subtotal': _subtotal,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'catetype': serializeParam(
          _catetype,
          ParamType.String,
        ),
        'isfav': serializeParam(
          _isfav,
          ParamType.bool,
        ),
        'iscart': serializeParam(
          _iscart,
          ParamType.bool,
        ),
        'size': serializeParam(
          _size,
          ParamType.String,
        ),
        'subtotal': serializeParam(
          _subtotal,
          ParamType.String,
        ),
      }.withoutNulls;

  static CategformodelStruct fromSerializableMap(Map<String, dynamic> data) =>
      CategformodelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        catetype: deserializeParam(
          data['catetype'],
          ParamType.String,
          false,
        ),
        isfav: deserializeParam(
          data['isfav'],
          ParamType.bool,
          false,
        ),
        iscart: deserializeParam(
          data['iscart'],
          ParamType.bool,
          false,
        ),
        size: deserializeParam(
          data['size'],
          ParamType.String,
          false,
        ),
        subtotal: deserializeParam(
          data['subtotal'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CategformodelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CategformodelStruct &&
        id == other.id &&
        image == other.image &&
        name == other.name &&
        price == other.price &&
        description == other.description &&
        catetype == other.catetype &&
        isfav == other.isfav &&
        iscart == other.iscart &&
        size == other.size &&
        subtotal == other.subtotal;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        image,
        name,
        price,
        description,
        catetype,
        isfav,
        iscart,
        size,
        subtotal
      ]);
}

CategformodelStruct createCategformodelStruct({
  int? id,
  String? image,
  String? name,
  String? price,
  String? description,
  String? catetype,
  bool? isfav,
  bool? iscart,
  String? size,
  String? subtotal,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CategformodelStruct(
      id: id,
      image: image,
      name: name,
      price: price,
      description: description,
      catetype: catetype,
      isfav: isfav,
      iscart: iscart,
      size: size,
      subtotal: subtotal,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CategformodelStruct? updateCategformodelStruct(
  CategformodelStruct? categformodel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    categformodel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCategformodelStructData(
  Map<String, dynamic> firestoreData,
  CategformodelStruct? categformodel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (categformodel == null) {
    return;
  }
  if (categformodel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && categformodel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final categformodelData =
      getCategformodelFirestoreData(categformodel, forFieldValue);
  final nestedData =
      categformodelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = categformodel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCategformodelFirestoreData(
  CategformodelStruct? categformodel, [
  bool forFieldValue = false,
]) {
  if (categformodel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(categformodel.toMap());

  // Add any Firestore field values
  categformodel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCategformodelListFirestoreData(
  List<CategformodelStruct>? categformodels,
) =>
    categformodels
        ?.map((e) => getCategformodelFirestoreData(e, true))
        .toList() ??
    [];
