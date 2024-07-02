

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:websuites/Data/models/Response_model/Dashboard_Screen/Db_Transactions_ResponseModel.dart';

import '../../../Data/repositories/repositories.dart';
import '../../../Data/response/status.dart';


class DbTransactionsViewmodel extends GetxController {
  final _api = Repositories();
  // RxBool loading = false.obs;


  final transactionList = DB_LatestTransaction_ResponseModel().obs;
  final rxStatus = Status.LOADING.obs;
  RxString error = ''.obs;

  void setRxStatus (Status _value) => rxStatus.value = _value;
  void setTransactionList (DB_LatestTransaction_ResponseModel _value) => transactionList.value = _value;
  void setError (String _value) =>  error.value = _value;


  Future<void> Db_transactions(BuildContext, context) async {
    // loading.value = true;


    _api.DB_TransactionApi().then((value){
      setRxStatus(Status.COMPLETED);
      setTransactionList(value);
      // if(value.items != null){
      //   Utils.SnackbarSuccess('transactions fetched');
      //
      // }else{
      //   Utils.SnackbarFailed('transactions not fetched');
      // }
      // // loading.value = false;

    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxStatus(Status.ERROR);
      if (kDebugMode) {
        print(error.toString());
      }
    }
    );
  }
}
