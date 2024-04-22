import 'package:cloud_firestore/cloud_firestore.dart';

class Person {
  //personal info
  String? profileImage;
  String? password;
  String? name;
  String? email;
  String? age;
  String? phone;
  String? city;
  String? country;
  String? profileHeading;
  String? whatAreYouLookingFor;
  int? publishedDateTime;

  //apearance
  String? height;
  String? weight;
  String? bodyType;
  


  //lifestyle
  String? drink;
  String? smoke;
  String? maritalStatus;
  String? haveChildren;
  String? noOfChildren;
  String? profession;
  String? employementStatus;
  String? relationShipLookingFor;

  // background
  String? nationality;
  String? education;
  String? language;
  String? religion;


  Person({ 
    this.profileImage,
    this.password,
    this.name,
    this.age,
    this.education,
    this.email,
    this.employementStatus,
    this.weight,
    this.haveChildren,
    this.height,
    this.profileHeading,
    this.whatAreYouLookingFor,
    this.nationality,
    this.noOfChildren,
    this.relationShipLookingFor,
    this.religion,
    this.language,
    this.phone,
    this.profession,
    this.publishedDateTime,
    this.drink,
    this.smoke,
    this.maritalStatus,
    this.bodyType,
    this.city,
    this.country,

  });

  static Person fromDataSnapshot(DocumentSnapshot snapshot){
    var dataSnapshot = snapshot.data() as Map<String, dynamic>;
    return Person(
      password: dataSnapshot["password"],
      name : dataSnapshot["name"],
      profileImage : dataSnapshot["profileImage"],
      age : dataSnapshot["age"],
      education : dataSnapshot["education"],
      email : dataSnapshot["email"],
      employementStatus : dataSnapshot["employementStatus"],
      weight : dataSnapshot["weight"],
      profileHeading : dataSnapshot["profileHeading"],
      whatAreYouLookingFor : dataSnapshot["whatAreYouLookingFor"],
      nationality : dataSnapshot["nationality"],
      noOfChildren : dataSnapshot["noOfChildren"],
      relationShipLookingFor : dataSnapshot["relationShipLookingFor"],
      religion : dataSnapshot["religion"],
      language : dataSnapshot["language"],
      phone : dataSnapshot["phone"],
      profession : dataSnapshot["profession"],
      publishedDateTime : dataSnapshot["publishedDateTime"],
      drink : dataSnapshot["drink"],
      smoke : dataSnapshot["smoke"],
      maritalStatus : dataSnapshot["maritalStatus"],
      bodyType : dataSnapshot["bodyType"],
      city : dataSnapshot["city"],
      country : dataSnapshot["country"],
      


    );
  }


// save into firebase as json format
Map<String, dynamic> toJson() => 
{
"name": name,
"password": password,
"profile_image": profileImage,
    "age": age,
    "education" : education,
    "email": email,
    "employementStatus": employementStatus,
    "weight": weight,
    "haveChildren": haveChildren,
    "height":height,
    "profileHeading": profileHeading,
    "whatAreYouLookingFor":whatAreYouLookingFor,
    "nationality": nationality,
    "noOfChildren":noOfChildren,
    "relationShipLookingFor":relationShipLookingFor,
    "religion": religion,
    "language":language,
    "phone":phone,
    "profession":profession,
    "publishedDateTime": publishedDateTime,
    "drink": drink,
    "smoke": smoke,
    "maritalStatus": maritalStatus,
    "bodyType": bodyType,
    "city": city,
    "country": country,


};
}