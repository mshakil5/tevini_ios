import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/presentation/order_voucher_books_screen/models/order_voucher_books_model.dart';

import '../../../core/values/app_helper.dart';
import '../../../core/values/app_url.dart';
import '../../../data/apiClient/api_client.dart';
import '../../../main.dart';
import '../../home_page/controller/home_controller.dart';
import '../../order_record_screen/controller/order_record_controller.dart';
import '../order_voucher_books_screen.dart';

class OrderVoucherBooksController extends GetxController {
  OrderRecordController orderRecordController=Get.put(OrderRecordController());
  final totalSummery = 0.00.obs;
  late ApiClient _apiClient;
  final finalAmount = 0.0.obs;
  final total = 0.0.obs;
  final temp3PointAdd = 3.5.obs;
  final isTemp3PointAdd = false.obs;
  Rx<bool> isCheckExpressDelivery = false.obs;
  Rx<bool> isCheckCollection = false.obs;

  var textEditingControllers = <TextEditingController>[];
  final totalOrderController = TextEditingController().obs;

  /// List
  final totalList = [].obs;
  RxList<OrderVoucherBookModel1> OrderVoucherDataList =
      List<OrderVoucherBookModel1>.empty(growable: true).obs;
  RxList<VoucherStoreModel> totalCal =
      List<VoucherStoreModel>.empty(growable: true).obs;
  RxList<VoucherStoreModel> RRList =
      List<VoucherStoreModel>.empty(growable: true).obs;
  RxList<VoucherStoreModel> RRListTemp =
      List<VoucherStoreModel>.empty(growable: true).obs;

  RxList<VoucherStoreModel> vouchers =
      List<VoucherStoreModel>.empty(growable: true).obs;

  @override
  void onInit() async {
    _apiClient = ApiClient();
    await getOrderVoucherBooksCTR();
    //initSQLController();
    super.onInit();
  }


  initValueClean(){
    print('OrderVoucherBooksController.initValueClean');
    textEditingControllers.clear();
    totalOrderController.close();
    totalList.clear();
    totalCal.close();
    RRList.close();
    RRListTemp.close();

    finalAmount.value=0.0;
    isCheckCollection.value=false;
    isCheckExpressDelivery.value=false;
    totalOrderController.value.clear();
    totalSummery.value=0.00;
    total.value=0.00;
  }

  initSQLController() {
    OrderVoucherDataList.forEach((OrderVoucherBookModel1 str) {
      var textEditingController = TextEditingController(text: ''.toString());
      RRList.add(VoucherStoreModel(
          voucherIds: str.id.toString(), qtys: textEditingController.text));
      textEditingControllers.add(textEditingController);
    });
  }

  void calculateSummery() {
    totalSummery.value = 0.00;
    double amount = 0.00;

    print('isCheckExpressDelivery :: ${isCheckExpressDelivery.value} ');
    print('isCheckCollection :: ${isCheckCollection.value} ');
    for (var element in OrderVoucherDataList) {
      if (element.type == 'Prepaid') {
        amount = double.parse(element.amount.toString());

        double cal = amount * double.parse(element.qty.toString());

        totalSummery.value = totalSummery.value + cal;

        print('isCheckExpressDelivery Cal :: ${totalSummery.value}');
      }
    }
    if (totalSummery.value < 200) {
      if (isCheckExpressDelivery.value == true && totalSummery.value>0 ) {
        totalSummery.value = totalSummery.value + temp3PointAdd.value;
      }
    }

    print('total :: ${totalSummery.value}');
  }

  
  voucherStore() async {
    vouchers.clear();
    print(isCheckExpressDelivery.value);
    print(isCheckCollection.value);
    if (isCheckCollection.value == true ||
        isCheckExpressDelivery.value == true) {
      for (var voucher in OrderVoucherDataList) {
        vouchers.add(VoucherStoreModel(
            voucherIds: voucher.id.toString(), qtys: voucher.qty.toString()));
      }

      print(jsonEncode(vouchers));

      Map<String, dynamic> vouchersStore = {
        "delivery": isCheckExpressDelivery.value.toString(),
        "collection": isCheckCollection.value.toString(),
        "vouchers": jsonEncode(vouchers),
      };

      print(vouchersStore);

        String? token = await localStoreSRF.getString('token');
    final response = await _apiClient.connectionNew(
      API_TYPE: '',
      apiType: 'POST',
      REQUEST_TYPE: '',
      REQUEST_DATA: vouchersStore,
      customheader: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      apiUrl: ApiURL.voucherStoreUrl,
      PARAM: {},
    );

    if (response != null) {
      Helpers.snackbarForSucess(
          titleText: 'Successful Alert',
          bodyText: 'Voucher order place successfully');
      vouchers.clear();
      isCheckCollection.value=false;
      isCheckExpressDelivery.value=false;
      totalSummery.value=0.0;
      OrderVoucherDataList.clear();
    await   getOrderVoucherBooksCTR();
      await orderRecordController.getOrderHistoryCTR();

     // RRList.clear();
      /*for(var textEditController in textEditingControllers ){
        textEditController.clear();
      }*/
      //textEditingControllers.clear();
    /*  finalAmount.value = 0.0;
      isCheckExpressDelivery.value = false;
      isCheckCollection.value = false;
      totalOrderController.value.clear();
      initSQLController();*/

    } else {
      print('ContactTopUpController.contactSubmit');
      Helpers.snackbarForErorr(
          titleText: 'Error Alert', bodyText: 'submit has failed');
    }
    }
  }

  /// done
  Future getOrderVoucherBooksCTR() async {
    String? token = await localStoreSRF.getString('token');
    final response = await _apiClient.connection(
      API_TYPE: 'GET',
      apiType: 'GET',
      REQUEST_TYPE: '',
      REQUEST_DATA: {},
      customheader: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      apiUrl: ApiURL.getOrderVoucherBookUrl,
      PARAM: {},
      enableLoading: false,
    );

    if (response != null) {
      final Map<String, dynamic> mapdata = response.data;

      final list = (mapdata['response']['data'] as List)
          .map((x) => OrderVoucherBookModel1.fromJson(x))
          .toList();
      OrderVoucherDataList.value = list;
    } else {
      print('HomeController.getOrderVoucherBooksCTR');
      OrderVoucherDataList.value = [];
    }

  }

  @override
  void dispose() {
    print('OrderVoucherBooksController.dispose-------------------------');


    textEditingControllers.clear();
    totalOrderController.close();
    totalList.clear();
    totalCal.close();
    RRList.close();
    RRListTemp.close();

    finalAmount.value=0.0;
    isCheckCollection.value=false;
    isCheckExpressDelivery.value=false;
    totalOrderController.value.clear();
    totalSummery.value=0.00;
    total.value=0.00;

    super.dispose();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    textEditingControllers.clear();
    totalOrderController.close();
    totalList.clear();
    totalCal.close();
    RRList.close();
    RRListTemp.close();
    print('OrderVoucherBooksController.onClose-------------------------');

    finalAmount.value=0.0;
    isCheckCollection.value=false;
    isCheckExpressDelivery.value=false;
    totalOrderController.value.clear();
    totalSummery.value=0.00;
    total.value=0.00;
    super.onClose();
  }
}

class VoucherStoreModel {
  final String voucherIds;
  String qtys;

  VoucherStoreModel({
    required this.voucherIds,
    required this.qtys,
  });

  VoucherStoreModel copyWith({
    String? voucherIds,
    String? qtys,
  }) =>
      VoucherStoreModel(
        voucherIds: voucherIds ?? this.voucherIds,
        qtys: qtys ?? this.qtys,
      );

  factory VoucherStoreModel.fromRawJson(String str) =>
      VoucherStoreModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VoucherStoreModel.fromJson(Map<String, dynamic> json) =>
      VoucherStoreModel(
        voucherIds: json["voucherIds"],
        qtys: json["qtys"],
      );

  Map<String, dynamic> toJson() => {
        "voucherIds": voucherIds,
        "qtys": qtys,
      };
}
