import 'dart:convert';

LogIn LogInFromJson(String str) => LogIn.fromJson(json.decode(str));

String LogInToJson(LogIn data) => json.encode(data.toJson());

class LogIn {
  LogIn({
    required this.firstName,
    required this.inviteeFirstName,
    required this.userInfo,
    required this.resetPasswordRequired,
    required this.memberProfile,
  });

  String firstName;
  String inviteeFirstName;
  UserInfo userInfo;
  bool resetPasswordRequired;
  MemberProfile memberProfile;

  factory LogIn.fromJson(Map<String, dynamic> json) => LogIn(
    firstName: json["first_name"],
    inviteeFirstName: json["invitee_first_name"],
    userInfo: UserInfo.fromJson(json["user_info"]),
    resetPasswordRequired: json["reset_password_required"],
    memberProfile: MemberProfile.fromJson(json["member_profile"]),
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "invitee_first_name": inviteeFirstName,
    "user_info": userInfo.toJson(),
    "reset_password_required": resetPasswordRequired,
    "member_profile": memberProfile.toJson(),
  };
}

class MemberProfile {
  MemberProfile({
    required this.id,
    required this.memberId,
    required this.firstName,
    required this.lastName,
    required this.countryCode,
    required this.phone,
    required this.location,
    required this.summary,
    required this.gender,
    required this.latitude,
    required this.longitude,
    required this.membershipTierLevel,
    required this.industries,
    required this.profileImage,
    required this.connection,
  });

  int id;
  int memberId;
  String firstName;
  String lastName;
  String countryCode;
  String phone;
  String location;
  String summary;
  String gender;
  String latitude;
  String longitude;
  MembershipTierLevel membershipTierLevel;
  List<dynamic> industries;
  ProfileImage profileImage;
  Connection connection;

  factory MemberProfile.fromJson(Map<String, dynamic> json) => MemberProfile(
    id: json["id"],
    memberId: json["member_id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    countryCode: json["country_code"],
    phone: json["phone"],
    location: json["location"],
    summary: json["summary"],
    gender: json["gender"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    membershipTierLevel: MembershipTierLevel.fromJson(json["membership_tier_level"]),
    industries: List<dynamic>.from(json["industries"].map((x) => x)),
    profileImage: ProfileImage.fromJson(json["profile_image"]),
    connection: Connection.fromJson(json["connection"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "member_id": memberId,
    "first_name": firstName,
    "last_name": lastName,
    "country_code": countryCode,
    "phone": phone,
    "location": location,
    "summary": summary,
    "gender": gender,
    "latitude": latitude,
    "longitude": longitude,
    "membership_tier_level": membershipTierLevel.toJson(),
    "industries": List<dynamic>.from(industries.map((x) => x)),
    "profile_image": profileImage.toJson(),
    "connection": connection.toJson(),
  };
}

class Connection {
  Connection({
    required this.status,
    required this.note,
  });

  Status status;
  dynamic note;

  factory Connection.fromJson(Map<String, dynamic> json) => Connection(
    status: Status.fromJson(json["status"]),
    note: json["note"],
  );

  Map<String, dynamic> toJson() => {
    "status": status.toJson(),
    "note": note,
  };
}

class Status {
  Status();

  factory Status.fromJson(Map<String, dynamic> json) => Status(
  );

  Map<String, dynamic> toJson() => {
  };
}

class MembershipTierLevel {
  MembershipTierLevel({
    required this.id,
    required this.name,
    required this.communityId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  int communityId;
  DateTime createdAt;
  DateTime updatedAt;

  factory MembershipTierLevel.fromJson(Map<String, dynamic> json) => MembershipTierLevel(
    id: json["id"],
    name: json["name"],
    communityId: json["community_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "community_id": communityId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class ProfileImage {
  ProfileImage({
    required this.small,
    required this.medium,
    required this.large,
    required this.id,
  });

  String small;
  String medium;
  String large;
  int id;

  factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
    small: json["small"],
    medium: json["medium"],
    large: json["large"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "small": small,
    "medium": medium,
    "large": large,
    "id": id,
  };
}

class UserInfo {
  UserInfo({
    required this.email,
    required this.userId,
    required this.authToken,
    required this.refreshToken,
    required this.type,
    required this.isTempPassword,
  });

  String email;
  int userId;
  String authToken;
  String refreshToken;
  String type;
  bool isTempPassword;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    email: json["email"],
    userId: json["user_id"],
    authToken: json["auth_token"],
    refreshToken: json["refresh_token"],
    type: json["type"],
    isTempPassword: json["is_temp_password"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "user_id": userId,
    "auth_token": authToken,
    "refresh_token": refreshToken,
    "type": type,
    "is_temp_password": isTempPassword,
  };
}
