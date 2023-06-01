import '../../core/strings/strings.dart';
import '../../infrastructure/api_key.dart';

class ApiEndpoints {
  static const downloads = "$kBaseUrl/trending/all/day?api_key=$apikey";
  static const search = "$kBaseUrl/search/movie?api_key=$apikey";
  static const hotAndNew = "$kBaseUrl/discover/movie?api_key=$apikey";
  static const homepage = "$kBaseUrl/trending/all/day?api_key=$apikey";
}
  //  "/trending/all/day?api_key=c2e2608024beabac09aa26c5fb840229"