class RegisterBody {
  String? name;
  String? job;
  String? staffId;
  String? hobby;
  String? password;
  String? confirmPassword;

  RegisterBody({
    this.name,
    this.job = "Flutter Engineer",
    this.staffId,
    this.hobby,
    this.password,
    this.confirmPassword,
  });

  Map<String, dynamic> toJson() => {
    if (name != null) "name": name,
    "job": job,
  };
}