// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:hotel_booking/models/hotel.dart';
// import 'package:hotel_booking/models/room_model.dart';

// import 'package:hotel_booking/utils/http/http_client.dart';

// class RoomApi {
//   static Future<RoomListResponseEntityCollection> getPopulaires() async {
//     var response = await HttpUtil().get(
//       '/rooms/populaires',
//       // queryParameters: params,
//     );

//     print(' get reooms${response}');

//     return RoomListResponseEntityCollection.fromJson(response);
//   }

//   static Future<RoomModel?> getRoomDetail({required int roomId}) async {
//     var response = await HttpUtil().get(
//       '/rooms/$roomId',
//       // queryParameters: params,
//     );

//     print(response);

//     if (response['code'] == 0) {
//       return RoomModel.fromJson(response['data']);
//     }

//     return null;
//   }

//   static Future<HotelModel?> getHoteDetail({required int hotelId}) async {
//     try {
//       var response = await HttpUtil().get(
//         '/hotels/$hotelId',
//         // queryParameters: params,
//       );

//       print(response);

//       if (response['code'] == 0) {
//         return HotelModel.fromJson(response['data']);
//       }

//       return null;
//     } catch (e) {
//       EasyLoading.showError(e.toString());
//       return null;
//     }
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
