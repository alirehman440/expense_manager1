class ModalStudent {
  int id;
  String name;

  ModalStudent({required this.id, required this.name});

  Map<String, dynamic> toMap() => {"id": id, "name": name};

  factory ModalStudent.ModalObjectFromMap(Map<String, dynamic> map_value) =>
      ModalStudent(id: map_value["id"], name: map_value["name"]);
}

class ModalUser {
  ModalStudent mm = ModalStudent(id: 1, name: "ali");
}
