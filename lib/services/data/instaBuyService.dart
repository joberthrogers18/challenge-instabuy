import 'package:dio/dio.dart';
import 'package:challengeinstabuy/models/BannerResult.dart';
import 'dart:io';

class InstaBuyService {
  final Dio dio = Dio();

  Future<BannerResult> search(String term) async {
    try {
      Response response =
          await dio.get("https://api.instabuy.com.br/apiv3/layout?subdomain=bigboxdelivery");

      return BannerResult.fromJson(response.data);
    } catch (e) {
      throw SocketException(e);
    }
  }
}