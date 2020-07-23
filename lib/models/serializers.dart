import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:m2mobile/models/responses/force_update.dart';
import 'package:m2mobile/models/responses/force_update_response.dart';
import 'package:m2mobile/models/responses/help.dart';
import 'package:m2mobile/models/responses/product.dart';
import 'package:m2mobile/models/responses/product_response.dart';
import 'package:built_collection/built_collection.dart';
part 'serializers.g.dart';

@SerializersFor(
    [Product, ProductResponse, Help, ForceUpdate, ForceUpdateResponse])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
