class SemanaModel {
  bool isSegunda, isTerca, isQuarta, isQuinta, isSexta, isSabado, isDomingo;

  SemanaModel({
    this.isSegunda = false,
    this.isTerca = false,
    this.isQuarta = false,
    this.isQuinta = false,
    this.isSexta = false,
    this.isSabado = false,
    this.isDomingo = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'isSegunda': isSegunda,
      'isTerca': isTerca,
      'isQuarta': isQuarta,
      'isQuinta': isQuinta,
      'isSexta': isSexta,
      'isSabado': isSabado,
      'isDomingo': isDomingo
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'isSegunda': isSegunda,
      'isTerca': isTerca,
      'isQuarta': isQuarta,
      'isQuinta': isQuinta,
      'isSexta': isSexta,
      'isSabado': isSabado,
      'isDomingo': isDomingo
    };
  }

  factory SemanaModel.fromMap(dynamic map) {
    return SemanaModel(
      isSegunda: map['isSegunda'] ?? false,
      isTerca: map['isTerca'] ?? false,
      isQuarta: map['isQuarta'] ?? false,
      isQuinta: map['isQuinta'] ?? false,
      isSexta: map['isSexta'] ?? false,
      isSabado: map['isSabado'] ?? false,
      isDomingo: map['isDomingo'] ?? false,
    );
  }
}
