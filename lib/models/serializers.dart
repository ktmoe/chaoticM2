import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:m2mobile/models/cart_item.dart';
import 'package:m2mobile/models/force_update.dart';
import 'package:m2mobile/models/payloads/add_to_cart_request.dart';
import 'package:m2mobile/models/payloads/delete_cart_items_request.dart';
import 'package:m2mobile/models/payloads/update_cart_request.dart';
import 'package:m2mobile/models/responses/cart_list_response.dart';
import 'package:m2mobile/models/responses/favorite_id.dart';
import 'package:m2mobile/models/responses/force_update_response.dart';
import 'package:m2mobile/models/responses/help_response.dart';
import 'package:m2mobile/models/help.dart';
import 'package:m2mobile/models/product.dart';
import 'package:m2mobile/models/bank_account.dart';
import 'package:m2mobile/models/responses/login_response.dart';
import 'package:m2mobile/models/noti.dart';
import 'package:m2mobile/models/responses/noti_list_response.dart';
import 'package:m2mobile/models/responses/refresh_token_response.dart';
import 'package:m2mobile/models/responses/product_response.dart';
import 'package:m2mobile/models/company_info.dart';
import 'package:m2mobile/models/responses/company_info_response.dart';
import 'package:built_collection/built_collection.dart';
import 'package:m2mobile/models/m2_category.dart';
import 'package:m2mobile/models/responses/m2_category_response.dart';
import 'package:m2mobile/models/responses/sub_category_response.dart';
import 'package:m2mobile/models/sub_category.dart';
import 'package:m2mobile/models/payloads/update_item.dart';
import 'package:m2mobile/models/user_profile.dart';
import 'package:m2mobile/models/responses/file_upload_response.dart';
import 'package:m2mobile/models/responses/post_profile_response.dart';
import 'package:m2mobile/models/responses/favorite_operate_response.dart';
import 'package:m2mobile/models/responses/bank_info_response.dart';
import 'package:m2mobile/models/responses/post_order_response.dart';
import 'package:m2mobile/models/responses/order_payment_response.dart';
import 'package:m2mobile/models/responses/ads_response.dart';
import 'package:m2mobile/models/payloads/favorite_item.dart';
import 'package:m2mobile/models/payloads/favorite_item_payload.dart';
import 'package:m2mobile/models/payloads/delete_favorite_item_payload.dart';
import 'package:m2mobile/models/payloads/order_customer_info_payload.dart';
import 'package:m2mobile/models/payloads/order_customer_info.dart';
import 'package:m2mobile/models/payloads/pay_order_payload.dart';
import 'package:m2mobile/models/order.dart';
import 'package:m2mobile/models/responses/order_list_response.dart';
import 'package:m2mobile/models/responses/order_detail_response.dart';
import 'package:m2mobile/models/wrappers/order_item_wrapper.dart';
import 'package:m2mobile/models/wrappers/post_order_order_wrapper.dart';
import 'package:m2mobile/models/order_item.dart';
import 'package:m2mobile/models/error_message.dart';
import 'package:m2mobile/models/ads.dart';
part 'serializers.g.dart';

@SerializersFor([
  UserProfile,
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
  SubCategoryResponse,
  FileUploadResponse,
  PostProfileResponse,
  LoginResponse,
  FavoriteOperateResponse,
  RefreshTokenResponse,
  OrderPaymentResponse,
  BankAccount,
  BankInfoResponse,
  FavoriteItemPayload,
  FavoriteItem,
  DeleteFavoriteItemPayload,
  Order,
  OrderListResponse,
  FavoriteId,
  OrderDetailResponse,
  OrderItemWrapper,
  OrderItem,
  OrderCustomerInfoPayload,
  OrderCustomerInfo,
  PostOrderResponse,
  PostOrderOrderWrapper,
  PayOrderPayload,
  AddToCartRequest,
  CartItem,
  CartListResponse,
  UpdateCartRequest,
  UpdateItem,
  DeleteCartListRequest,
  ErrorMessage,
  Ads,
  AdsResponse,
  Noti,
  NotiListResponse
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
