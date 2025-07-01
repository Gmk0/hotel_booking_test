// import 'package:hotel_booking/models/hotel.dart';
// import 'package:hotel_booking/models/media_model.dart';

// class RoomModel {
//   final int id;
//   final int hotelId;
//   final String name;

//   String? location;
//   String? rate;

//   HotelModel? hotel;

//   final String description;
//   final double pricePerNight;

//   final int capacity;
//   late List<MediaModel>? media;

//   final String status; // Disponible, Réservée, etc.

//   RoomModel({
//     required this.id,
//     required this.hotelId,
//     required this.name,
//     this.rate,
//     this.hotel,
//     this.location,
//     // required this.type,
//     required this.description,
//     required this.pricePerNight,
//     required this.capacity,
//     this.media,
//     required this.status,
//   });

//   factory RoomModel.fromJson(Map<String, dynamic> json) {
//     return RoomModel(
//         id: json['id'],
//         hotelId: json['hotel_id'],
//         // type: json['type'],
//         name: json['name'],
//         location: json['location'],
//         rate: json['rate'],
//         description: json['description'],
//         pricePerNight: json['price_per_night'].toDouble(),
//         capacity: json['capacity'],
//         status: json['status'],
//         hotel: json.containsKey('hotel')
//             ? HotelModel.fromJson(json['hotel'])
//             : null,
//         media: (json['media'] as List<dynamic>?)
//                 ?.map((media) => MediaModel.fromJson(media))
//                 .toList() ??
//             []);
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'hotel_id': hotelId,
//       'name': name,
//       'description': description,
//       'price_per_night': pricePerNight,
//       'capacity': capacity,
//       'status': status,
//     };
//   }
// }

// class RoomResponseEntity {
//   int? code;
//   String? msg;
//   String? token;
//   List<RoomModel>? data;

//   RoomResponseEntity({
//     this.code,
//     this.msg,
//     this.data,
//     this.token,
//   });

//   factory RoomResponseEntity.fromJson(Map<String, dynamic> json) =>
//       RoomResponseEntity(
//         code: json["code"],
//         msg: json["message"],
//         data: json["data"] == null
//             ? []
//             : List<RoomModel>.from(
//                 json["data"].map((x) => RoomModel.fromJson(x))),
//       );
// }

// class RoomListResponseEntityCollection {
//   int? code;
//   String? msg;
//   List<RoomModel>? data;
//   int? currentPage;
//   int? lastPage;

//   RoomListResponseEntityCollection({
//     this.code,
//     this.msg,
//     this.data,
//     this.currentPage,
//     this.lastPage,
//   });

//   factory RoomListResponseEntityCollection.fromJson(
//           Map<String, dynamic> json) =>
//       RoomListResponseEntityCollection(
//         code: json["code"],
//         msg: json["message"],
//         currentPage: json['current_page'],
//         lastPage: json['last_page'],
//         data: json["data"] == null
//             ? []
//             : List<RoomModel>.from(
//                 json["data"].map((x) => RoomModel.fromJson(x))),
//       );
// }
