import 'package:chopper/chopper.dart';
import 'package:http/http.dart' show MultipartFile;
import 'package:m2mobile/models/responses/file_upload_response.dart';

part 'file_upload_service.chopper.dart';

@ChopperApi(baseUrl: '/file')
abstract class FileUploadService extends ChopperService {
  static FileUploadService create([ChopperClient client]) =>
      _$FileUploadService(client);

  @Post(path: '/upload/profile')
  @Multipart()
  Future<Response<FileUploadResponse>> uploadProfileImage(
    @PartFile("image") MultipartFile imageFile,
  );

  @Post(path: '/upload/pay_order')
  @Multipart()
  Future<Response<FileUploadResponse>> uploadSlipImage(
    @PartFile("image") MultipartFile imageFile,
  );
}
