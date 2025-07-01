import 'package:hotel_booking/core/utils/constants/image_strings.dart';

var profile = {
  "name": "Sangvaleap",
  "image": "https://avatars.githubusercontent.com/u/86506519?v=4",
  "email": "sangvaleap.vanny@gmail.com",
};

List categories = [
  {"name": "Tout", "icon": "assets/icons/home.svg"},
  {"name": "Chambre Simple", "icon": "assets/icons/home.svg"},
  {"name": "Chambre Double", "icon": "assets/icons/home.svg"},
  {"name": "Chambre Familiale", "icon": "assets/icons/home.svg"},
  {"name": "Chambre Queen", "icon": "assets/icons/home.svg"},
  {"name": "Chambre King", "icon": "assets/icons/home.svg"},
  {"name": "Bungalow", "icon": "assets/icons/home.svg"},
  {"name": "Villa Individuelle", "icon": "assets/icons/home.svg"},
  {"name": "Appartement", "icon": "assets/icons/home.svg"},
];

List cities = [
  {"name": "Gombe", "icon": "assets/icons/home.svg"},
  {"name": "Limete", "icon": "assets/icons/home.svg"},
  {"name": "Kintambo", "icon": "assets/icons/home.svg"},
  {"name": "Ngaliema", "icon": "assets/icons/home.svg"},
  {"name": "Kalamu", "icon": "assets/icons/home.svg"},
  {"name": "Kasa-Vubu", "icon": "assets/icons/home.svg"},
  {"name": "Matete", "icon": "assets/icons/home.svg"},
  {"name": "Ngiri-Ngiri", "icon": "assets/icons/home.svg"},
];

List<String> albumImages = [
  "https://images.unsplash.com/photo-1598928636135-d146006ff4be?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1505692952047-1a78307da8f2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1618221118493-9cfa1a1c00da?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1571508601891-ca5e7a713859?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
];
List<String> albumImagesAsste = [
  CustomImageAssets.hotel1,
  CustomImageAssets.hotel2,
  CustomImageAssets.hotel3,
  CustomImageAssets.hotel4,
];

List features = [
  {
    "id": 100,
    "name": "Superior Room",
    "image_asset": CustomImageAssets.hotel1,
    "image":
        "https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$210",
    "type": categories[1]["name"],
    "rate": "4.5",
    "location": "Phnom Penh",
    "is_favorited": false,
    "album_images": albumImages,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
  {
    "id": 101,
    "name": "Junior Suite",
    "image_asset": CustomImageAssets.hotel2,
    "image":
        "https://images.unsplash.com/photo-1505692952047-1a78307da8f2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$150",
    "type": categories[3]["name"],
    "rate": "4.5",
    "location": "Phnom Penh",
    "is_favorited": true,
    "album_images": albumImages,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
  {
    "id": 102,
    "name": "Classic Queen Room",
    "image_asset": CustomImageAssets.hotel3,
    "image":
        "https://images.unsplash.com/photo-1618221118493-9cfa1a1c00da?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$320",
    "type": categories[2]["name"],
    "rate": "4.5",
    "location": "Phnom Penh",
    "is_favorited": false,
    "album_images": albumImages,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
  {
    "id": 103,
    "name": "Luxury King",
    "image_asset": CustomImageAssets.hotel4,
    "image":
        "https://images.unsplash.com/photo-1571508601891-ca5e7a713859?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$350",
    "type": categories[2]["name"],
    "rate": "4.5",
    "location": "Phnom Penh",
    "is_favorited": false,
    "album_images": albumImages,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
  {
    "id": 104,
    "name": "Classic Room",
    "image_asset": CustomImageAssets.hotel5,
    "image":
        "https://images.unsplash.com/photo-1541123356219-284ebe98ae3b?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$180",
    "type": categories[4]["name"],
    "rate": "4.5",
    "location": "Phnom Penh",
    "is_favorited": false,
    "album_images": albumImages,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
  {
    "id": 105,
    "name": "Twin Room",
    "image_asset": CustomImageAssets.hotel6,
    "image":
        "https://images.unsplash.com/photo-1566195992011-5f6b21e539aa?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$250",
    "type": categories[1]["name"],
    "rate": "4.5",
    "location": "Phnom Penh",
    "is_favorited": false,
    "album_images": albumImages,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
];

List recommends = [
  {
    "id": 110,
    "name": "Luxury King",
    "image_asset": CustomImageAssets.hotel7,
    "image":
        "https://images.unsplash.com/photo-1541123356219-284ebe98ae3b?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$310",
    "type": categories[1]["name"],
    "rate": "4.5",
    "location": "Phnom Penh",
    "is_favorited": false,
    "album_images": albumImages,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
  {
    "id": 111,
    "name": "Classic Room",
    "image_asset": "assets/images/1.jpg",
    "image_asset": CustomImageAssets.hotel8,
    "image":
        "https://images.unsplash.com/photo-1611892440504-42a792e24d32?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$250",
    "type": categories[2]["name"],
    "rate": "4.5",
    "location": "Phnom Penh",
    "is_favorited": false,
    "album_images": albumImages,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
  {
    "id": 112,
    "name": "Twin Room",
    "image_asset": CustomImageAssets.hotel1,
    "image":
        "https://images.unsplash.com/photo-1596394516093-501ba68a0ba6?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$190",
    "type": categories[1]["name"],
    "rate": "4.5",
    "location": "Phnom Penh",
    "album_images": albumImages,
    "is_favorited": false,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
];

List rooms = [
  {
    "id": 1,
    "name": "Twin Room",
    "image_asset": CustomImageAssets.hotel1,
    "image":
        "https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$190",
    "type": categories[2]["name"],
    "rate": "4.5",
    "location": "Phnom Penh",
    "is_favorited": false,
    "album_images": albumImages,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
  {
    "id": 2,
    "name": "Superior Room",
    "image_asset": CustomImageAssets.hotel2,
    "image":
        "https://images.unsplash.com/photo-1598928636135-d146006ff4be?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$110",
    "type": categories[1]["name"],
    "rate": "4.5",
    "location": "Phnom Penh",
    "is_favorited": true,
    "album_images": albumImages,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
  {
    "id": 3,
    "name": "Classic Room",
    "image":
        "https://images.unsplash.com/photo-1505692952047-1a78307da8f2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$220",
    "type": categories[1]["name"],
    "image_asset": CustomImageAssets.hotel3,
    "rate": "4.5",
    "location": "Phnom Penh",
    "is_favorited": false,
    "album_images": albumImages,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
  {
    "id": 4,
    "name": "Luxury King",
    "image":
        "https://images.unsplash.com/photo-1618221118493-9cfa1a1c00da?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$350",
    "type": categories[1]["name"],
    "image_asset": CustomImageAssets.hotel4,
    "rate": "4.5",
    "location": "Phnom Penh",
    "is_favorited": false,
    "album_images": albumImages,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
  {
    "id": 5,
    "name": "Junior Suite",
    "image_asset": CustomImageAssets.hotel5,
    "image":
        "https://images.unsplash.com/photo-1571508601891-ca5e7a713859?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$125",
    "type": categories[3]["name"],
    "rate": "4.5",
    "location": "Phnom Penh",
    "is_favorited": false,
    "album_images": albumImages,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
  {
    "id": 6,
    "name": "Queen Room",
    "image_asset": CustomImageAssets.hotel6,
    "image":
        "https://images.unsplash.com/photo-1541123356219-284ebe98ae3b?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$210",
    "type": categories[4]["name"],
    "rate": "4.5",
    "location": "Phnom Penh",
    "is_favorited": true,
    "album_images": albumImages,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
  {
    "id": 7,
    "name": "Twin Room",
    "image_asset": CustomImageAssets.hotel7,
    "image":
        "https://images.unsplash.com/photo-1566195992011-5f6b21e539aa?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$190",
    "type": categories[5]["name"],
    "rate": "4.5",
    "location": "Phnom Penh",
    "is_favorited": false,
    "album_images": albumImages,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
  {
    "id": 8,
    "name": "Single Room",
    "image_asset": CustomImageAssets.hotel8,
    "image":
        "https://images.unsplash.com/photo-1611892440504-42a792e24d32?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$110",
    "type": categories[6]["name"],
    "rate": "4.5",
    "location": "Phnom Penh",
    "is_favorited": false,
    "album_images": albumImages,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
  {
    "id": 9,
    "name": "Superior King",
    "image_asset": CustomImageAssets.hotel1,
    "image":
        "https://images.unsplash.com/photo-1596394516093-501ba68a0ba6?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$350",
    "type": categories[4]["name"],
    "rate": "4.5",
    "location": "Phnom Penh",
    "is_favorited": false,
    "album_images": albumImages,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
  {
    "id": 10,
    "name": "Superior Queen",
    "image_asset": CustomImageAssets.hotel3,
    "image":
        "https://images.unsplash.com/photo-1631048730670-ff5cd0d08f15?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$280",
    "type": categories[3]["name"],
    "rate": "4.5",
    "location": "Phnom Penh",
    "is_favorited": false,
    "album_images": albumImages,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
];

List nearbyHotels = [
  {
    "id": 106,
    "name": "Sofitel",
    "image_asset": CustomImageAssets.hotel1,
    "image":
        "https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$210",
    "type": categories[2]["name"],
    "rate": "4.5",
    "location": "Phnom Penh",
    "is_favorited": true,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
  {
    "id": 101,
    "name": "Rose Wood",
    "image_asset": CustomImageAssets.hotel2,
    "image":
        "https://images.unsplash.com/photo-1564501049412-61c2a3083791?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$210",
    "type": categories[1]["name"],
    "rate": "4.5",
    "location": "Phnom Penh",
    "is_favorited": false,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
  {
    "id": 102,
    "name": "The Bale",
    "image":
        "https://images.unsplash.com/photo-1615460549969-36fa19521a4f?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$110",
    "type": categories[1]["name"],
    "image_asset": CustomImageAssets.hotel3,
    "rate": "4.5",
    "location": "Phnom Penh",
    "is_favorited": false,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
  {
    "id": 104,
    "name": "Raffles",
    "image":
        "https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$120",
    "type": categories[2]["name"],
    "image_asset": CustomImageAssets.hotel4,
    "rate": "4.5",
    "location": "Phnom Penh",
    "is_favorited": true,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
  {
    "id": 100,
    "name": "La Rose",
    "image":
        "https://images.unsplash.com/photo-1566073771259-6a8506099945?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$130",
    "type": categories[2]["name"],
    "image_asset": CustomImageAssets.hotel5,
    "rate": "4.5",
    "location": "Phnom Penh",
    "is_favorited": false,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
  {
    "id": 105,
    "name": "Sokha PP",
    "image":
        "https://images.unsplash.com/photo-1587213811864-46e59f6873b1?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$150",
    "type": categories[1]["name"],
    "rate": "4.5",
    "image_asset": CustomImageAssets.hotel6,
    "location": "Phnom Penh",
    "is_favorited": false,
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  },
];

List<String> reviewers = [
  // "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fHByb2ZpbGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
  // "https://images.unsplash.com/photo-1622253692010-333f2da6031d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=928&q=80",
  // "https://images.unsplash.com/photo-1564460576398-ef55d99548b2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTZ8fHByb2ZpbGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
  // "https://images.unsplash.com/photo-1545167622-3a6ac756afa4?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTB8fHByb2ZpbGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
  // "https://images.unsplash.com/photo-1617069470302-9b5592c80f66?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Z2lybHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
  "https://avatars.githubusercontent.com/u/86506519?v=4",
  "https://avatars.githubusercontent.com/u/86506519?v=4",
  "https://avatars.githubusercontent.com/u/86506519?v=4",
  "https://avatars.githubusercontent.com/u/86506519?v=4",
  "https://avatars.githubusercontent.com/u/86506519?v=4",
];

final List<Map<String, dynamic>> reservations = [
  {
    "id": "R001",
    "hotel": "Hôtel Royal Palm",
    "room": "Suite Luxe",
    "image_asset": CustomImageAssets.hotel1,
    "image":
        "https://images.unsplash.com/photo-1587213811864-46e59f6873b1?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": 120.00,
    "status": "confirmed",
    "date": "2024-06-15",
    "payment": "Carte bancaire",
    "location": {
      "lat": -4.325, // Exemple de latitude
      "lng": 15.322, // Exemple de longitude
    },
  },
  {
    "id": "R002",
    "hotel": "Hôtel Belle Vue",
    "room": "Chambre Standard",
    "image_asset": CustomImageAssets.hotel2,
    "image":
        "https://images.unsplash.com/photo-1587213811864-46e59f6873b1?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": 75.50,
    "status": "pending",
    "date": "2024-07-01",
    "payment": "Mobile Money",
    "location": {"lat": -4.320, "lng": 15.315},
  },
  {
    "id": "R003",
    "hotel": "Hôtel du Soleil",
    "image_asset": CustomImageAssets.hotel3,
    "room": "Chambre Deluxe",
    "image":
        "https://images.unsplash.com/photo-1587213811864-46e59f6873b1?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": 98.99,
    "status": "canceled",
    "date": "2024-05-20",
    "payment": "Sur place",
    "location": {"lat": -4.330, "lng": 15.310},
  },
];
