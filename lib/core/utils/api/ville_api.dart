// import 'package:hotel_booking/models/commune_model.dart';
// import 'package:hotel_booking/models/user_model.dart';
// import 'package:hotel_booking/models/ville_model.dart';
// import 'package:hotel_booking/utils/api/base_entities.dart';
// import 'package:hotel_booking/utils/http/http_client.dart';

// class VilleApi {
//   static Future<CommuneResponseEntity> getCommunes() async {
//     var response = await HttpUtil().get(
//       '/communes',
//       // queryParameters: params,
//     );

//     return CommuneResponseEntity.fromJson(response);
//   }

//   // static Future<BaseResponseEntity> testNotification() async {
//   //   var response = await HttpUtil().post(
//   //     'testnotification',
//   //   );

//   //   print(response);
//   //   return BaseResponseEntity.fromJson(response);
//   // }

//   // static Future<UserResponseEntity> verifyCode(
//   //   params,
//   // ) async {
//   //   var response = await HttpUtil().post(
//   //     'verifyCode',
//   //     queryParameters: params,
//   //   );

//   //   print(response);

//   //   return UserResponseEntity.fromJson(response);
//   // }

//   // static Future<UserResponseEntity> updateProfileImage(
//   //   data,
//   // ) async {
//   //   var response = await HttpUtil().post(
//   //     '/update-img',
//   //     data: data,
//   //   );

//   //   print(response);

//   //   return UserResponseEntity.fromJson(response);
//   // }

//   // static Future<UserResponseEntity> get_profile() async {
//   //   var response = await HttpUtil().post(
//   //     'api/get_profile',
//   //   );
//   //   return UserResponseEntity.fromJson(response);
//   // }

//   // static Future<UserResponseEntity> UpdateProfile(
//   //     Map<String, String> data) async {
//   //   var response = await HttpUtil().post(
//   //     'update-profile',
//   //     queryParameters: data,
//   //   );

//   //   print(" user data $response");
//   //   return UserResponseEntity.fromJson(response);
//   // }

//   // static Future<UserModel> getUserById(String id) async {
//   //   var response = await HttpUtil().get(
//   //     'getUserById/${id}',
//   //   );

//   //   print("fetch most user $response");
//   //   return UserModel.fromJson(response['user']);
//   // }

//   // static Future<FreelanceModel> getFreelanceById(String id) async {
//   //   var response = await HttpUtil().get(
//   //     'getFreelanceById/${id}',
//   //   );

//   //   print("user freelance $response");
//   //   return FreelanceModel.fromJson(response['freelance']);
//   // }

//   // static Future<void> bindfcmtoken({BindFcmTokenRequestEntity? params}) async {
//   //   var response = await HttpUtil().post(
//   //     'bind_fcmtoken',
//   //     queryParameters: params?.toJson(),
//   //   );
//   // }
// }
