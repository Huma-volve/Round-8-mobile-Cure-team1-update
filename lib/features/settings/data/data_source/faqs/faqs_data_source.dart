import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/features/settings/data/models/faqs/faqs_response.dart';

class FaqsDataSource {
  const FaqsDataSource(this._api);

  final ApiServices _api;

  Future<FaqsResponse> getFAQS() async {
    print('rrrrrr');
    try {
      print('before');
      final response = await _api.get(
        'faqs',
      );
      print(
          'faqsDataSource: Sending faqs request with data: ${response.toString()}');

      return FaqsResponse.fromJson(response);
    } catch (e) {
      print(e);
    }
    throw Exception('Failed to edit profile');
  }
}
