import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:m2mobile/models/force_update.dart';
import 'package:m2mobile/models/responses/force_update_response.dart';
import 'package:m2mobile/models/responses/help_response.dart';
import 'package:m2mobile/models/help.dart';
import 'package:m2mobile/models/product.dart';
import 'package:m2mobile/models/responses/product_response.dart';
import 'package:m2mobile/models/company_info.dart';
import 'package:m2mobile/models/responses/company_info_response.dart';
import 'package:built_collection/built_collection.dart';
import 'package:m2mobile/models/m2_category.dart';
import 'package:m2mobile/models/responses/m2_category_response.dart';
import 'package:m2mobile/models/responses/sub_category_response.dart';
import 'package:m2mobile/models/sub_category.dart';
part 'serializers.g.dart';

@SerializersFor([
  Product,
  ProductResponse,
  HelpResponse,
  Help,
  ForceUpdate,
  ForceUpdateResponse,
  CompanyInfo,
  CompanyInfoResponse,
  M2Category,
  M2CategoryResponse,
  SubCategory,
  SubCategoryResponse
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
