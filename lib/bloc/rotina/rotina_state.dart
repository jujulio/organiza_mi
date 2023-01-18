import 'package:organiza_mi/models/rotina_model.dart';

abstract class RotinaState {
  List<RotinaModel> rotina;

  RotinaState({
    required this.rotina,
  });
}

class RotinaInitialState extends RotinaState {
  RotinaInitialState() : super(rotina: []);
}

class RotinaSuccessState extends RotinaState {
  RotinaSuccessState({required List<RotinaModel> rotina})
      : super(rotina: rotina);
}

class RotinaErrorState extends RotinaState {
  RotinaErrorState() : super(rotina: []);
}
