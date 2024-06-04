import 'dart:convert';

import 'package:dio/dio.dart';

class MedicalSpecialtyRecommenderApi {
  static const String baseUrl =
      'https://1d6321c9-49e5-4f09-b5fd-dc4b86c64e33-00-2gf6maddwvn8i.spock.replit.dev:5173';

  Future<String> getSpecializations(String disease) async {
    final url = '$baseUrl/Specialty_Recommender?Specialty_Recommender=$disease';
    try {
      final response = await Dio().get(url);
      final jsonData = json.decode(response.data);
      final specializations = jsonData['Specialty'] as List<dynamic>;
      if (specializations.isNotEmpty) {
        return specializations.join(', ');
      } else {
        return 'No specializations found';
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to recommend specializations');
    }
  }
}
