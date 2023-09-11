class GetProfile {
  GetProfile({
    required this.address,
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.phone,
    required this.v,
  });

  final Address? address;
  final int? id;
  final String? email;
  final String? username;
  final String? password;
  final Name? name;
  final String? phone;
  final int? v;

  factory GetProfile.fromJson(Map<String, dynamic> json){
    return GetProfile(
      address: json["address"] == null ? null : Address.fromJson(json["address"]),
      id: json["id"],
      email: json["email"],
      username: json["username"],
      password: json["password"],
      name: json["name"] == null ? null : Name.fromJson(json["name"]),
      phone: json["phone"],
      v: json["__v"],
    );
  }

}

class Address {
  Address({
    required this.geolocation,
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
  });

  final Geolocation? geolocation;
  final String? city;
  final String? street;
  final int? number;
  final String? zipcode;

  factory Address.fromJson(Map<String, dynamic> json){
    return Address(
      geolocation: json["geolocation"] == null ? null : Geolocation.fromJson(json["geolocation"]),
      city: json["city"],
      street: json["street"],
      number: json["number"],
      zipcode: json["zipcode"],
    );
  }

}

class Geolocation {
  Geolocation({
    required this.lat,
    required this.long,
  });

  final String? lat;
  final String? long;

  factory Geolocation.fromJson(Map<String, dynamic> json){
    return Geolocation(
      lat: json["lat"],
      long: json["long"],
    );
  }

}

class Name {
  Name({
    required this.firstname,
    required this.lastname,
  });

  final String? firstname;
  final String? lastname;

  factory Name.fromJson(Map<String, dynamic> json){
    return Name(
      firstname: json["firstname"],
      lastname: json["lastname"],
    );
  }

}
