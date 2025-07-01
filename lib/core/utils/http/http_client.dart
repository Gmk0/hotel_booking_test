// import 'dart:async';
// import 'dart:io';

// import 'package:dio/io.dart';
// import 'package:flutter/material.dart';

// import 'package:dio/dio.dart';


// class HttpUtil {
//   // Singleton pour garantir une seule instance de HttpUtil
//   static HttpUtil _instance = HttpUtil._internal();
//   factory HttpUtil() => _instance;

//   late Dio dio;
//   CancelToken cancelToken = new CancelToken();

//   // Constructeur interne privé
//   HttpUtil._internal() {
//     // Configuration des options de base pour Dio
//     BaseOptions options = new BaseOptions(
//       // URL de base pour les requêtes
//       baseUrl: SERVER_API_URL,
//       // Temps maximum pour établir une connexion
//       connectTimeout: Duration(seconds: 60),
//       // Temps maximum pour recevoir une réponse
//       receiveTimeout: Duration(seconds: 60),
//       // En-têtes par défaut
//       headers: {},
//       // Type de contenu pour les requêtes
//       contentType: 'application/json; charset=utf-8',
//       // Type de réponse attendue (JSON)
//       responseType: ResponseType.json,
//     );

//     // Initialisation de Dio avec les options configurées
//     dio = new Dio(options);

//     // Configuration du client HTTP pour ignorer les certificats non valides
//     dio.httpClientAdapter = IOHttpClientAdapter(
//       createHttpClient: () {
//         // Création d'un client HTTP avec un contexte de sécurité personnalisé
//         final HttpClient client =
//             HttpClient(context: SecurityContext(withTrustedRoots: false));
//         // Accepte tous les certificats, même ceux non validés
//         client.badCertificateCallback =
//             ((X509Certificate cert, String host, int port) => true);
//         return client;
//       },
//     );

//     // Ajout des interceptors pour gérer les événements de requête/réponse/erreur
//     dio.interceptors.add(InterceptorsWrapper(
//       // Intercepte les requêtes avant qu'elles soient envoyées
//       onRequest: (options, handler) {
//         // Peut être utilisé pour ajouter des headers ou modifier les options de requête
//         return handler.next(options); // Continuer
//       },
//       // Intercepte les réponses avant qu'elles soient renvoyées à l'appelant
//       onResponse: (response, handler) {
//         return handler.next(response); // Continuer
//       },
//       // Intercepte les erreurs avant qu'elles soient renvoyées
//       onError: (DioException e, ErrorInterceptorHandler handler) {
//         // Création d'une entité d'erreur pour simplifier la gestion des erreurs
//         ErrorEntity eInfo = createErrorEntity(e);
//         // Gestion des erreurs spécifiques (comme l'expiration de session)

//         onError(eInfo);
//         return handler.next(e); // Continuer
//       },
//     ));
//   }

//   // Fonction de gestion des erreurs spécifiques
//   Future<void> onError(ErrorEntity eInfo) async {
//     print('code d\'erreur -> ' +
//         eInfo.code.toString() +
//         ', message -> ' +
//         eInfo.message);

//     switch (eInfo.code) {
//       case 401:
//         // Supprimer les informations utilisateur stockées
//         await Global.hiveService.remove(STORAGE_USER_PROFILE_KEY);
//         await Global.hiveService.remove(STORAGE_USER_TOKEN_KEY);

//         if (Global.navigatorKey.currentContext != null) {
//           // Vérifiez si l'utilisateur est déjà sur la page de login
//           final currentRouteName =
//               ModalRoute.of(Global.navigatorKey.currentContext!)?.settings.name;

//           if (currentRouteName != AppRoutes.signIn) {
//             // Redirigez uniquement si vous n'êtes pas déjà sur la page de login
//             Navigator.of(Global.navigatorKey.currentContext!)
//                 .pushNamedAndRemoveUntil(
//               AppRoutes.signIn,
//               (Route<dynamic> route) => false,
//             );
//             // EasyLoading.showError("Token expiré, veuillez vous reconnecter !");
//           }
//         }
//         break;

//       case 422:
//         //   toastInfo(eInfo.message);

//         break;
//       default:
//         // Gestion d'autres erreurs si nécessaire
//         // EasyLoading.showError('Erreur inconnue');
//         break;
//     }
//   }

//   // Fonction pour créer une entité d'erreur personnalisée en fonction du type d'exception
//   ErrorEntity createErrorEntity(DioException error) {
//     switch (error.type) {
//       case DioExceptionType.cancel:
//         return ErrorEntity(code: 101, message: "Requête annulée");
//       case DioExceptionType.connectionTimeout:
//         return ErrorEntity(code: 102, message: "Temps de connexion dépassé");
//       case DioExceptionType.sendTimeout:
//         return ErrorEntity(code: 103, message: "Temps d'envoi dépassé");
//       case DioExceptionType.receiveTimeout:
//         return ErrorEntity(code: 104, message: "Temps de réception dépassé");
//       case DioExceptionType.connectionError:
//         return ErrorEntity(code: 105, message: "Erreur de connexion");
//       case DioExceptionType.badCertificate:
//         return ErrorEntity(code: 106, message: "Certificat invalide");
//       case DioExceptionType.unknown:
//         return ErrorEntity(code: 107, message: "Erreur inconnue");
//       case DioExceptionType.badResponse:
//         {
//           try {
//             int errCode =
//                 error.response != null ? error.response!.statusCode! : -1;

//             String serverMessage = '';

//             // Si la réponse contient un message, on l'extrait
//             if (error.response != null && error.response!.data != null) {
//               if (error.response!.data is Map<String, dynamic> &&
//                   error.response!.data['message'] != null) {
//                 serverMessage = error.response!
//                     .data['message']; // Extraction du message du serveur
//               } else {
//                 serverMessage = error.response!.data
//                     .toString(); // Sinon, on convertit les données en texte brut
//               }
//             }
//             switch (errCode) {
//               case 302:
//                 return ErrorEntity(
//                     code: errCode,
//                     message:
//                         serverMessage.isNotEmpty ? serverMessage : 'message');
//               case 400:
//                 return ErrorEntity(
//                     code: errCode,
//                     message:
//                         serverMessage.isNotEmpty ? serverMessage : 'message');
//               case 401:
//                 return ErrorEntity(
//                     code: errCode,
//                     message: serverMessage.isNotEmpty
//                         ? serverMessage
//                         : "Accès refusé");
//               case 403:
//                 return ErrorEntity(
//                     code: errCode,
//                     message: serverMessage.isNotEmpty
//                         ? serverMessage
//                         : "Le serveur refuse d'exécuter");
//               case 404:
//                 return ErrorEntity(
//                     code: errCode,
//                     message: serverMessage.isNotEmpty
//                         ? serverMessage
//                         : "Serveur introuvable");
//               case 405:
//                 return ErrorEntity(
//                     code: errCode,
//                     message: serverMessage.isNotEmpty
//                         ? serverMessage
//                         : "Méthode interdite");
//               case 422:
//                 return ErrorEntity(
//                     code: errCode,
//                     message: serverMessage.isNotEmpty
//                         ? serverMessage
//                         : "Validator error");
//               case 500:
//                 return ErrorEntity(
//                     code: errCode,
//                     message: serverMessage.isNotEmpty
//                         ? serverMessage
//                         : "Erreur interne du serveur");
//               case 502:
//                 return ErrorEntity(
//                     code: errCode,
//                     message: serverMessage.isNotEmpty
//                         ? serverMessage
//                         : "Mauvaise requête");
//               case 503:
//                 return ErrorEntity(
//                     code: errCode,
//                     message: serverMessage.isNotEmpty
//                         ? serverMessage
//                         : "Le serveur est hors service");
//               case 505:
//                 return ErrorEntity(
//                     code: errCode,
//                     message: "Le protocole HTTP n'est pas supporté");
//               default:
//                 return ErrorEntity(
//                     code: errCode,
//                     message: error.response != null
//                         ? error.response!.statusMessage!
//                         : "");
//             }
//           } catch (_) {
//             return ErrorEntity(code: 108, message: "Erreur inconnue");
//           }
//         }
//       default:
//         {
//           return ErrorEntity(
//               code: -1,
//               message:
//                   error.response != null ? error.response!.statusMessage! : "");
//         }
//     }
//   }

//   // Annulation des requêtes en cours
//   void cancelRequests(CancelToken token) {
//     token.cancel("Requête annulée");
//   }

//   // Lecture des en-têtes d'autorisation (par exemple, pour inclure le token d'authentification)
//   Map<String, dynamic>? getAuthorizationHeader() {
//     var headers = <String, dynamic>{
//       'Accept': 'application/json',
//       'X-Mobile-Request': 'true',
//     };
//     var token = Global.hiveService.getUserToken();
//     if (token.isNotEmpty) {
//       headers['Authorization'] = 'Bearer ${token}';
//     }
//     return headers;
//   }

//   Future get(
//     String path, {
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     bool refresh = false,
//     bool noCache = true,
//     bool list = false,
//     String cacheKey = '',
//     bool cacheDisk = false,
//     Duration? cacheDuration, // Ajout de la durée du cache
//   }) async {
//     // Configuration des options de requête
//     Options requestOptions = options ?? Options();
//     if (requestOptions.extra == null) {
//       requestOptions.extra = Map();
//     }

//     // Ajout des informations sur le cache dans les options
//     requestOptions.extra!.addAll({
//       "refresh": refresh,
//       "noCache": noCache,
//       "list": list,
//       "cacheKey": cacheKey,
//       "cacheDisk": cacheDisk,
//       "cacheDuration":
//           cacheDuration ?? Duration(minutes: 10), // Défaut à 10 min
//     });

//     // Ajout des en-têtes d'autorisation si disponibles
//     requestOptions.headers = requestOptions.headers ?? {};
//     Map<String, dynamic>? authorization = getAuthorizationHeader();
//     if (authorization != null) {
//       requestOptions.headers!.addAll(authorization);
//     }

//     // Exécution de la requête GET
//     var response = await dio.get(
//       path,
//       queryParameters: queryParameters,
//       options: requestOptions,
//       cancelToken: cancelToken,
//     );
//     return response.data;
//   }

//   // Méthode POST pour les requêtes HTTP
//   Future post(
//     String path, {
//     dynamic data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//   }) async {
//     // Configuration des options de requête POST

//     Options requestOptions = options ?? Options();
//     requestOptions.headers = requestOptions.headers ?? {};
//     Map<String, dynamic>? authorization = getAuthorizationHeader();
//     if (authorization != null) {
//       requestOptions.headers!.addAll(authorization);
//     }

//     // Si les données sont de type FormData, change le Content-Type à multipart/form-data

//     // Exécution de la requête POST

//     try {
//       var response = await dio.post(
//         path,
//         data: data,
//         queryParameters: queryParameters,
//         options: requestOptions,
//         cancelToken: cancelToken,
//       );
//       return response.data;
//     } catch (e) {
//       print(" post error  ${e.toString()}");
//     }
//   }
// }

// // Classe pour gérer les erreurs spécifiques aux requêtes HTTP
// class ErrorEntity implements Exception {
//   int code = -1;
//   String message = "";
//   ErrorEntity({required this.code, required this.message});

//   // Affichage des informations de l'erreur
//   String toString() {
//     if (message == "") return "Exception";
//     //  toastInfo(code.toString());
//     return "Exception: code $code, $message";
//   }
// }
