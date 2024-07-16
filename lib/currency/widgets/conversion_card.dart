
import 'package:flutter/material.dart';
import 'package:tenvini/core/values/app_space.dart';
import '../../core/values/app_helper.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../utils.dart';
import 'dropdown_row.dart';



import 'package:tenvini/core/app_export.dart';


class ConversionCard extends StatefulWidget {
  final dynamic rates;
  final Map currencies;
  const ConversionCard({
    Key? key,
    required this.rates,
    required this.currencies,
  }) : super(key: key);

  @override
  State<ConversionCard> createState() => _ConversionCardState();
}

class _ConversionCardState extends State<ConversionCard> {
  TextEditingController amountController = TextEditingController();
  //final GlobalKey<FormFieldState> formFieldKey = GlobalKey();
  String dropdownValue1 = 'GBP';
  String dropdownValue2 = 'USD';
  String conversion = '';
  String conversionInt = '';
  bool isLoading = false;

  void startLoading() {
    setState(() {
      isLoading = true;
    });
  }

  void stopLoading() {
    setState(() {
      isLoading = false;
    });
  }

  String sanitizeInput(String input) {
    return input.replaceAll(RegExp(r'[,\s]'), '');
  }

  void convertAndDisplay() {
    String sanitizedAmount = sanitizeInput(amountController.text);
    conversion =
        '$sanitizedAmount $dropdownValue1 = ${Utils.convert(widget.rates, sanitizedAmount, dropdownValue1, dropdownValue2)} $dropdownValue2';
    stopLoading();
  }

  void swapCurrencies() {
    setState(() {
      String temp = dropdownValue1;
      dropdownValue1 = dropdownValue2;
      dropdownValue2 = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    conversionInt =
    '1 $dropdownValue1 = ${Utils.convert(widget.rates, '1', dropdownValue1, dropdownValue2)} $dropdownValue2';
    return  Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
          children: [

            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: DropdownRow(
                    label: 'From:',
                    value: dropdownValue1,

                    currencies: widget.currencies,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue1 = newValue!;
                      });
                    },
                  ),
                ),
                IconButton(
                   alignment: Alignment.center,
                    color: Colors.teal,
                    icon: const Icon(Icons.swap_horiz,color: Colors.teal,),
                    onPressed: () {
                      if (amountController.text.isEmpty) {
                        swapCurrencies();
                      } else {
                        swapCurrencies();
                        convertAndDisplay();
                      }
                    },
                  ),

                Expanded(
                  flex: 3,
                  child: DropdownRow(
                    label: 'To:',
                    value: dropdownValue2,
                    currencies: widget.currencies,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue2 = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
            AppSpace.spaceH10,
            CustomTextFormField(

              width: Get.width / 2.5,
            //  key: formFieldKey,
              controller: amountController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter an amount';
                }
                return null;
              },
           //   textStyle: TextStyle(fontSize: 15),
              hintText: "Enter Currency Account",
              hintStyle:
              CustomTextStyles.labelLargeErrorContainer,
              textInputType: TextInputType.number,

            ),
            AppSpace.spaceH10,
            amountController.value.text==''?
            Text(
              conversionInt,
              style: const TextStyle(fontSize: 16,color: Colors.teal),
              textAlign: TextAlign.center,
            ): Text(
              conversion,
              style: const TextStyle(fontSize: 16,color: Colors.teal),
              textAlign: TextAlign.center,
            ),
            AppSpace.spaceH10,

            CustomElevatedButton(

                width: Get.width / 1.5,
                text:

                "Currency Convert",
                onTap: () {
                  if(amountController.value.text==''){
                    return Helpers.snackbarForErorr(
                        titleText: 'Error Alert',
                        bodyText: 'Please Fill out this field');
                  }else{

                    startLoading();
                    conversion = '';
                    convertAndDisplay();
                    FocusManager.instance.primaryFocus?.unfocus();

                  }
                },
                alignment: Alignment.center)
          ],
        ),
    );
  }
}
