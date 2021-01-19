class UserModel {
  int id;
  String name;
  String lastname;
  String genre;
  String bornDate;
  String latitude;
  String longitude;
  String urlProfilePicture;
  String createdAt;
  String updatedAt;

  UserModel(
      {this.id,
      this.name,
      this.lastname,
      this.genre,
      this.bornDate,
      this.latitude,
      this.longitude,
      this.urlProfilePicture,
      this.createdAt,
      this.updatedAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastname = json['lastname'];
    genre = json['genre'];
    bornDate = json['born_date'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    urlProfilePicture =
        (json['url_profile_picture']).toString().replaceAll('\\\/', '/');
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['lastname'] = this.lastname;
    data['genre'] = this.genre;
    data['born_date'] = this.bornDate;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['url_profile_picture'] = this.urlProfilePicture;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
