import 'package:cloud_firestore/cloud_firestore.dart';

class Person {
  //personal info
  String? uid;
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
    this.uid,
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
      uid: dataSnapshot["uid"],
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
  "uid": uid,
"name": name,
"password": password,
"profile_image": profileImage,
    "age": age,
    "education" : education,
    "email": email,
    "employement_status": employementStatus,
    "weight": weight,
    "have_children": haveChildren,
    "height":height,
    "profile_heading": profileHeading,
    "what-are_you_looking_for":whatAreYouLookingFor,
    "nationality": nationality,
    "no_of_children":noOfChildren,
    "relation_ship_lookingFor":relationShipLookingFor,
    "religion": religion,
    "language":language,
    "phone":phone,
    "profession":profession,
    "published_date_time": publishedDateTime,
    "drink": drink,
    "smoke": smoke,
    "marital_status": maritalStatus,
    "body_type": bodyType,
    "city": city,
    "country": country,


};
}