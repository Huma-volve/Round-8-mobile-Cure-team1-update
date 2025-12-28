import 'package:cure_team_1_update/core/services/api_result.dart';
import 'package:cure_team_1_update/features/settings/data/data_source/faqs/faqs_data_source.dart';
import 'package:cure_team_1_update/features/settings/data/models/faqs/faqs_response.dart';

class FaqsRepo {
  const FaqsRepo(this._dataSource);

  final FaqsDataSource _dataSource;

  // Get User Profile
  Future<ApiResult<FaqsResponse>> Faqs() async {
    try {
      print('dddddddddddddddddddddddddddddddddddddd');
      final response = await _dataSource.getFAQS();
      print('FaqsRepo: Received response: ${response.toString()}');
      return ApiResult.success(response);
    } catch (e) {
      print('FaqsRepo: Error occurred - ${e.toString()}');
      return ApiResult.failure(e.toString());
    }
  }
}
