class House {
  final String? addr1;
  final String? addr2;
  final int? point;
  final int? accommodationDay;
  final String? date;
  final int? responseRate;
  final String? poster;

  House.fromMap(Map<String, dynamic> map)
      : addr1 = map['add1'],
        addr2 = map['addr2'],
        point = map['point'],
        accommodationDay = map['accommodationDay'],
        date = map['date'],
        responseRate = map['responseRate'],
        poster = map['poster'];

  @override
  String toString() => "House <주소: $addr1+$addr2>";
}
