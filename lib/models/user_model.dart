class UserDetails {
  String ip_address;
  String name;
  bool driver;
  String license;
  String email;
  String occupation;
  String hobbies;
  String skills;
  String interests;
  String others;
  UserDetails({
    required this.name,
    required this.ip_address,
    required this.interests,
    required this.driver,
    required this.license,
    required this.others,
    required this.skills,
    required this.hobbies,
    required this.occupation,
    required this.email,
  });
}
