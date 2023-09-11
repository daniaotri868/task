import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:new_task/commen/constants/route.dart';
import 'package:new_task/feature/auth/presentation/models/get_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../feature/prodact/presentation/models/all_product.dart';
import 'cash_helper.dart';
import 'dio_main.dart';



class AuthRepo {
  late final Dio _dio;

  AuthRepo() {
    _dio = DioFactory.instance.get();
  }

  Future<Either<String, String>> loginUser({required String username, required String password}) async {
    try {
      final data = {
        'username': username,
        'password': password,
      };
      final result = await _dio.post(EndPoints.auth.login, data: data);
      dynamic jsonObject = jsonDecode(result.data);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', jsonObject["token"].toString());
      print("SuccessfulData");
      print("Token: ${jsonObject["token"]}");
      return Right(jsonObject["token"].toString());
    } catch (error) {
      print("Error: $error");
      return const Left("error");
    }
  }

//
  Future<Either<String, Map<String, dynamic>>> createUser({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final formData = FormData.fromMap({
        'username': username,
        'email': email,
        'password': password,
      });
      final response = await _dio.post(
        EndPoints.auth.createUser,
        data: formData,
      );
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      dynamic re=jsonDecode(response.data);
      print( re["id"]);
      await prefs.setInt('id',re["id"]);
      print("hhhhhhhhhher${response.data}");
      print("Cache id = ${CachHelper.sharedPreferences.getInt('id')}");
      print("SuccessfulData");
      return Right(re);
    } catch (error) {
      print("error =$error");
      return const Left("error");
    }
  }


  Future<Either<String, List<AllProduct>>> showProduct() async {
    try {
      final result = await _dio.get(EndPoints.product.getProductData);
      print("SuccessfulData");

      List<AllProduct> productList = [];
      List<dynamic> jsonResponse = json.decode(result.data.toString());
      print("${CachHelper.sharedPreferences.getString('token')}");
      for (var productJson in jsonResponse) {
        AllProduct allProduct = AllProduct.fromJson(productJson);
        productList.add(allProduct);
        print("nnnnn$productList");
      }
      print("SuccessfulDataProduct");
      return Right(productList);
    } catch (error, stackTrace) {
      print("showHouses error: $error, stackTrace: $stackTrace");
      return const Left("There was an error fetching the product. Please try again later.");
    }
  }



  Future<Either<String, List<GetProfile>>> getProfile() async {
    try {
      //  عند انشاء حساب يرجع id =11 و عند تمرير هنا ال  id يرجع في response قيمة Null
      // final result = await _dio.get('users/${CachHelper.sharedPreferences.getInt('id')}');

       // ف وضعت هنا يوز لا يرجع قيمة  null
      final result = await _dio.get('${EndPoints.profile.getUserData}1');
      print("SuccessfulData");

      List<GetProfile> listProfile = [];
      Map<String, dynamic> jsonResponse = json.decode(result.data.toString());
      GetProfile profile = GetProfile.fromJson(jsonResponse);
      listProfile.add(profile);

      print("SuccessfulDataProfile");
      return Right(listProfile);
    } catch (error, stackTrace) {
      print("showHouses error: $error, stackTrace: $stackTrace");
      return const Left("There was an error fetching the profile. Please try again later.");
    }
  }
}

