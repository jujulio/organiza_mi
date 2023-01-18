import 'package:organiza_mi/models/rotina_model.dart';

abstract class RotinaEvent {}

class LoadRotinaEvent extends RotinaEvent {}

class InsertOrUpdateRotinaEvent extends RotinaEvent {
  RotinaModel rotina;

  InsertOrUpdateRotinaEvent({
    required this.rotina,
  });
}

class RemoveRotinaEvent extends RotinaEvent {
  RotinaModel rotina;

  RemoveRotinaEvent({
    required this.rotina,
  });
}
