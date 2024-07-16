import 'controller/get_pin_controller.dart';
import 'models/get_pin_model.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class GetPinPage extends StatelessWidget {
  GetPinPage({Key? key})
      : super(
          key: key,
        );

  GetPinController controller = Get.put(GetPinController(GetPinModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      body: SizedBox(
        width: mediaQueryData.size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 15.h,
                  top: 20.v,
                  right: 15.h,
                ),
                child: Column(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgImage1,
                      height: 223.v,
                      width: 398.h,
                      radius: BorderRadius.circular(
                        8.h,
                      ),
                    ),
                    SizedBox(height: 21.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "msg_credit_profile_id".tr,
                          style: theme.textTheme.titleLarge,
                        ),
                        Text(
                          "lbl_54".tr,
                          style: CustomTextStyles.titleLargeMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 2.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "lbl_account_number".tr,
                          style: theme.textTheme.titleLarge,
                        ),
                        Text(
                          "lbl_235223152151253".tr,
                          style: CustomTextStyles.titleLargeMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 1.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "lbl_profile_name".tr,
                          style: theme.textTheme.titleLarge,
                        ),
                        Text(
                          "lbl_shakil".tr,
                          style: CustomTextStyles.titleLargeMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 2.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "msg_available_balance".tr,
                          style: theme.textTheme.titleLarge,
                        ),
                        Text(
                          "lbl_02".tr,
                          style: CustomTextStyles.titleLargeMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 1.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "lbl_card_status".tr,
                          style: theme.textTheme.titleLarge,
                        ),
                        Text(
                          "lbl_ordered".tr,
                          style: CustomTextStyles.titleLargeMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 2.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 1.v),
                          child: Text(
                            "lbl_last_updated".tr,
                            style: theme.textTheme.titleLarge,
                          ),
                        ),
                        Text(
                          "msg_2023_08_28_19_23_32".tr,
                          style: CustomTextStyles.titleLargeMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 15.v),
                    CustomElevatedButton(
                      height: 40.v,
                      text: "lbl_card_activation".tr,
                      buttonStyle: CustomButtonStyles.fillGreen,
                      buttonTextStyle: CustomTextStyles.titleMediumBlack900,
                    ),
                    SizedBox(height: 20.v),
                    SizedBox(
                      width: 398.h,
                      child: Text(
                        "msg_the_tevini_prepaid".tr,
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        style: CustomTextStyles.titleMediumMedium_2.copyWith(
                          height: 1.44,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
