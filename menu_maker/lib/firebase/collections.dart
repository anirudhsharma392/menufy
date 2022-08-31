import 'package:cloud_firestore/cloud_firestore.dart';

class Collection {
  static final CollectionReference items =
      FirebaseFirestore.instance.collection('items');
}
