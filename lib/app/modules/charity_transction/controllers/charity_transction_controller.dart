import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/values/app_url.dart';
import '../../../../data/apiClient/api_client.dart';
import '../../../../data/models/home/dashboard_model.dart';
import '../../../../main.dart';

class CharityTransctionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement CharityTransctionController

  final List<Tab> myTabs = <Tab>[
    new Tab(

      iconMargin: EdgeInsets.only(bottom: 0),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          'In',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
    new Tab(
      iconMargin: EdgeInsets.only(bottom: 0),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          'Out',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
    new Tab(
      iconMargin: EdgeInsets.only(bottom: 0),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          'Pending',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  ];

  final count = 0.obs;
  late TabController tabController;
  late ApiClient _apiClient;
  final lbl_mm_dd_yyyy = 'lbl_mm_dd_yyyy'.obs;

  Rx<DateTime> startDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).obs;
  Rx<DateTime> endDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    _apiClient = ApiClient();
    tabController = TabController(
      length: 3,
      vsync: this,
    );

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  tabIndexClick() {
    print('TapIndex');
    print(myTabs[tabController.index]);
    print('TapIndex :: ${tabController.index}');
    return Container();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
  }

  void increment() => count.value++;

  onTapStartDateTime(context) async {
    print('start Date : ${startDate}');
    print('start lbl_mm_dd_yyyy : ${lbl_mm_dd_yyyy}');
    final DateTime? date = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.teal, // header background color
              onPrimary: Colors.black, // header text color
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                textStyle: TextStyle(fontSize: 16),
                //fixedSize: Size.square(14.3),
                foregroundColor: Colors.teal, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
      barrierColor: Colors.teal.withOpacity(0.8),
      context: context,
      initialDate: startDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (date != null) {
      startDate.value = date;
     // lbl_mm_dd_yyyy.value = startDate.toIso8601String();
      // getPromotionApplicationApprovalList();
    }
  }

  onTapEndDateTime(context) async {
    final DateTime? date = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.teal, // header background color
              onPrimary: Colors.black, // header text color
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                textStyle: TextStyle(fontSize: 16),
                //fixedSize: Size.square(14.3),
                foregroundColor: Colors.teal, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
      barrierColor: Colors.teal.withOpacity(0.8),
      context: context,
      initialDate: endDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (date != null) {
      endDate.value = date;
    //  lbl_mm_dd_yyyy.value = endDate.toIso8601String();

      if (kDebugMode) {
        print('SupportServiceController.onTapEndDateTime');
        print('end Date :${endDate}');
      }
    }
  }

  ///Date Format
  String getFormatedDate(DateTime date) =>
      DateFormat('dd-MMM-yyyy').format(date);
}
