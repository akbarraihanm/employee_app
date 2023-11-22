class RegisterResponse {
  String? name;
  String? job;
  String? id;
  String? createdAt;

  RegisterResponse.fromJsonMap(Map<String, dynamic> map) {
    name = map['name'];
    job = map['job'];
    id = map['id'];
    createdAt = map['createdAt'];
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'job': job,
    'id': id,
    'createdAt': createdAt,
  };
}