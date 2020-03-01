import 'dart:convert';

class Uilist {
  final int uiNumber;
  final String uiName;
  Uilist({
    this.uiNumber,
    this.uiName,
  });

  Uilist copyWith({
    int uiNumber,
    String uiName,
  }) {
    return Uilist(
      uiNumber: uiNumber ?? this.uiNumber,
      uiName: uiName ?? this.uiName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uiNumber': uiNumber,
      'uiName': uiName,
    };
  }

  static Uilist fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Uilist(
      uiNumber: map['uiNumber'],
      uiName: map['uiName'],
    );
  }

  String toJson() => json.encode(toMap());

  static Uilist fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Uilist uiNumber: $uiNumber, uiName: $uiName';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Uilist && o.uiNumber == uiNumber && o.uiName == uiName;
  }

  @override
  int get hashCode => uiNumber.hashCode ^ uiName.hashCode;

  static List<Uilist> uilist = [
    Uilist(uiNumber: 1, uiName: "Login"),
  ];
}
