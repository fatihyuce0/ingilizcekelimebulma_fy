class Gorev {
  final int id;
  final int ilerleme;

  Gorev({this.id, this.ilerleme});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ilerleme': ilerleme,

    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Gorev{id: $id, ilerleme: $ilerleme}';
  }
}