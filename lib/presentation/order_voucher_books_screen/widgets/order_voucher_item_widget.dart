import '../../../widgets/custom_text_form_field.dart';
import '../controller/order_voucher_books_controller.dart';
import '../models/order_voucher_books_model.dart';
import '../models/order_voucher_item_model.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OrderVoucherItemWidget extends StatelessWidget {
  OrderVoucherItemWidget(
    this.orderVoucherItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  OrderVoucherBookModel1 orderVoucherItemModelObj;

 // var controller = Get.find<OrderVoucherBooksController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      margin: EdgeInsets.all(0),
      color: appTheme.teal50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Container(
        height: 96.v,
        width: 188.h,
        decoration: AppDecoration.fillTeal.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder8,
        ),

        
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('£'+orderVoucherItemModelObj.singleAmount.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.displaySmall,
                    ),
                    Text(
                      '${orderVoucherItemModelObj.note.toString()}=${double.parse(orderVoucherItemModelObj.singleAmount.toString())*double.parse(orderVoucherItemModelObj.amount.toString())}',
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.titleSmallBlack900,
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(

                padding: EdgeInsets.symmetric(horizontal: 12.h),
                decoration: AppDecoration.fillOnError.copyWith(
                  color: orderVoucherItemModelObj.type.toString() =='Prepaid'? Colors.teal : Colors.indigo,
                  borderRadius: BorderRadiusStyle.customBorderBL4,
                ),
                child:Text(
                  orderVoucherItemModelObj.type.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.labelLargeWhiteA700SemiBold,
                )
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(
                  right: 12.h,
                  bottom: 5.v,
                  top: 5.v
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 40.v,
                      width: 38.h,
                      decoration: BoxDecoration(
                        color: appTheme.whiteA700,
                      ),
                      child:

                      CustomTextFormField(
                          textInputType:TextInputType.number,
                        // isReadOnly: controller.isReadOnly.value,
                      //  textStyle: TextStyle(fontSize: 16),

                       // controller: controller.incomeoneController,
                        hintText: "0".tr,
                        hintStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.grey),

                        validator: (value) {

                          return null;
                        },
                      ),

               /*       CustomTextFormField(
                        textInputType: TextInputType.number,
                        controller: TextEditingController(),
                        hintText: "",
                        hintStyle:
                        CustomTextStyles.labelLargeErrorContainer,
                        validator: (value) {
                         *//* if (!isText(value)) {
                            return "Please enter valid text";
                          }*//*
                          return null;
                        },
                      ),*/
                    ),
                    SizedBox(height: 2.v),
                    Text(
                      "lbl_qty".tr,
                      style: theme.textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
