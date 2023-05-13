class User {
  Address? address;
  int? id;
  String? email;
  String? username;
  String? password;
  Name? name;
  String? phone;
  String? token;

  User();

  User.fromJson(Map<String, dynamic> data, String tokenData) {
    token = tokenData;
    address = Address.fromJson(data['address']);

    id = data['id'];
    email = data['email'];
    username = data['username'];
    password = data['password'];
    name = Name.fromJson(data['name']);
    phone = data['phone'];
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'address': address?.toJson(),
      'id': id,
      'email': email,
      'username': username,
      'password': password,
      'name': name,
      'phone': phone,
    };
  }
}

class Name {
  String? firstname;
  String? lastname;
  Name();
  Name.fromJson(Map<String, dynamic> data) {
    firstname = data['firstname'];
    lastname = data['lastname'];
  }

  Map<String, dynamic> toJson() {
    return {
      'firstname': firstname,
      'lastname': lastname,
    };
  }
}

class Address {
  Geolocation? geolocation;
  String? city;
  String? street;
  int? number;
  String? zipcode;
  Address();

  Address.fromJson(Map<String, dynamic> data) {
    geolocation = Geolocation.fromJson(data['geolocation']);
    city = data['city'];
    street = data['street'];
    number = data['number'];
    zipcode = data['zipcode'];
  }

  Map<String, dynamic> toJson() {
    return {
      'geolocation': geolocation?.toJson(),
      'city': city,
      'street': street,
      'number': number,
      'zipcode': zipcode,
    };
  }
}

class Geolocation {
  String? lat;
  String? long;

  Geolocation();

  Geolocation.fromJson(Map<String, dynamic> data) {
    lat = data['lat'];
    long = data['long'];
  }

  Map<String, dynamic> toJson() {
    return {'lat': lat, 'long': long};
  }
}
