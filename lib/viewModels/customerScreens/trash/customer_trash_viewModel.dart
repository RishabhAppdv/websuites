import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

class CustomerTrashViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> customerTrash (BuildContext context) async {
    loading.value = true;

    _api.customersTrashApi().then((value) {

      if(value.items!= null){
        Utils.snackbarSuccess('customer trash fetched');
        loading.value = false;

      }else{
        Utils.snackbarFailed('customer trash not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    );
  }
}