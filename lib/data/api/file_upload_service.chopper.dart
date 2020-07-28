// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_upload_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$FileUploadService extends FileUploadService {
  _$FileUploadService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = FileUploadService;

  @override
  Future<Response<FileUploadResponse>> uploadProfileImage(
      MultipartFile imageFile) {
    final $url = '/file/upload/profile';
    final $parts = <PartValue>[
      PartValueFile<MultipartFile>('image', imageFile)
    ];
    final $request =
        Request('POST', $url, client.baseUrl, parts: $parts, multipart: true);
    return client.send<FileUploadResponse, FileUploadResponse>($request);
  }
}
