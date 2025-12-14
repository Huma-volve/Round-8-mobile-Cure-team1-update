import 'package:cross_file/src/types/interface.dart';
import 'package:cure_team_1_update/core/app/upload_image/data_source/upload_image_data_source.dart';

class UploadImageRepo {
  const UploadImageRepo(this._dataSource);

  final UploadImageDataSource _dataSource;

  Future<dynamic> uploadImage(XFile pickedImage) async {}
}
