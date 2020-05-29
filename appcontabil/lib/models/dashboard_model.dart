import 'package:cloud_firestore/cloud_firestore.dart';

class Dashboard {
  getTotal() {
    {
      return Firestore.instance.collection("lancamento").snapshots();
    }
  }
}
