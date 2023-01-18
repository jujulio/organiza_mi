import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:organiza_mi/interfaces/i_rotina.dart';
import 'package:organiza_mi/models/rotina_model.dart';

class RotinaRepository implements IRotina {
  final collectionPath = "rotina";

  @override
  Future<void> addRotina(RotinaModel rotina) async {
    DocumentReference doc =
        FirebaseFirestore.instance.collection(collectionPath).doc();
    rotina.id = doc.id;
    await doc.set(rotina.toMap());
  }

  @override
  Future<List<RotinaModel>> getAllRotina() async {
    throw UnimplementedError();
  }

  @override
  Future<List<RotinaModel>> removeRotina(RotinaModel rotina) async {
    throw UnimplementedError();
  }
}
