import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_challenge/core/data/models/card_model.dart';
import 'package:store_challenge/core/enums/data_type.dart';

class SharedPreferenceRepositories {
  static SharedPreferences globalSharedPreferences = Get.find();
  //!----Keys----
  String PREF_CART_LIST = 'cart_list';

  void setCartList(List<CartModel> list) {
    setPreference(
      dataType: DataType.STRING,
      key: PREF_CART_LIST,
      value: CartModel.encode(list),
    );
  }
  List<CartModel> getCartList() {
    if (globalSharedPreferences.containsKey(PREF_CART_LIST)) {
      return CartModel.decode(getPreference(key: PREF_CART_LIST));
    } else {
      return [];
    }
  }



  setPreference(
      {required DataType dataType,
      required String key,
      required dynamic value}) async {
    switch (dataType) {
      case DataType.INT:
        await globalSharedPreferences.setInt(key, value);
        break;
      case DataType.DOUBLE:
        await globalSharedPreferences.setDouble(key, value);
        break;
      case DataType.STRING:
        await globalSharedPreferences.setString(key, value);
        break;
      case DataType.BOOL:
        await globalSharedPreferences.setBool(key, value);
        break;

      case DataType.LISTSTRING:
        await globalSharedPreferences.setStringList(key, value);
        break;
    }
  }

  dynamic getPreference({required String key}) {
    return globalSharedPreferences.get(key);
  }
  clearPreference() {
    globalSharedPreferences.clear();
  }
}
