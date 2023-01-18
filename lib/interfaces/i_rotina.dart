import 'package:organiza_mi/models/rotina_model.dart';

abstract class IRotina {
  Future<List<RotinaModel>> getAllRotina();
  Future<void> addRotina(RotinaModel rotina);
  Future<List<RotinaModel>> removeRotina(RotinaModel rotina);
}
