import 'dart:convert';

//import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/presentation/contact_top_up_screen/models/contact_top_up_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_helper.dart';
import '../../../core/values/app_space.dart';
import '../../../core/values/app_url.dart';
import '../../../data/apiClient/api_client.dart';
import '../../../data/apiClient/stripe_config.dart';
import '../../../main.dart';
import 'package:flutter/cupertino.dart';


/// A controller class for the ContactTopUpScreen.
///
/// This class manages the state of the ContactTopUpScreen, including the
/// current contactTopUpModelObj
class ContactTopUpController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController emailController = TextEditingController();

  String? name = localStoreSRF.getString('name');
  String? accNo =  localStoreSRF.getString('accNo');
  String? email =  localStoreSRF.getString('email');
  TextEditingController subjectoneController = TextEditingController();

  TextEditingController messageController = TextEditingController();
  /// Stripe Controller
  TextEditingController topUpPaymentController = TextEditingController();
  TextEditingController cardNameHolderController = TextEditingController();

  Rx<ContactTopUpModel> contactTopUpModelObj = ContactTopUpModel().obs;
  late ApiClient _apiClient;

  @override
  void onInit() {
    // TODO: implement onInit
    emailController.text=email.toString();
    fullNameController.text=name.toString();
    _apiClient = ApiClient();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    fullNameController.dispose();
    emailController.dispose();
    subjectoneController.dispose();
    messageController.dispose();
  }


/*
  contactSubmit()async{
    print('fullNameController ${fullNameController.text}');
    print('fullNameController ${emailController.text}');
    print('fullNameController ${subjectoneController.text}');
    print('fullNameController ${messageController.text}');

    String? token = await localStoreSRF.getString('token');
    final response = await _apiClient.connection(
      API_TYPE: 'MAKE',
      apiType: 'POST',
      REQUEST_TYPE: '',
      REQUEST_DATA: {
        "name":name.toString(),
        "email":email.toString(),
        "subject":subjectoneController.text,
        "message":messageController.text,

      },
      customheader: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      apiUrl: ApiURL.contactSubmitUrl,
      PARAM: {},
    );

    if (response != null) {
      Helpers.snackbarForSucess(titleText: 'Successful Alert', bodyText:response.data['response']['message'] );
    } else {
      print('ContactTopUpController.contactSubmit');
      Helpers.snackbarForErorr(titleText: 'Error Alert', bodyText: 'Contact submit has failed');

    }
  }


  Future<void> makePayment(BuildContext context) async {
    if(topUpPaymentController.text==''){
      Helpers.snackbarForErorr(titleText: 'Alert', bodyText: 'Please enter your top up amount ');
    }
    else{
    try {
      final paymentIntentData =
      await createPaymentIntent(topUpPaymentController.text, 'GBP'); //json.decode(response.body);
      print('Response body==>${paymentIntentData}');
      print('client_secret==>${paymentIntentData['client_secret']}');

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          setupIntentClientSecret: paymentIntentData['client_secret'],
          customFlow: false,

          merchantDisplayName: 'Stripe Payment GetWay Method',
          paymentIntentClientSecret: paymentIntentData['client_secret'],
          customerEphemeralKeySecret: paymentIntentData['ephemeralKey'],
          customerId: paymentIntentData['customer'],
          style: ThemeMode.dark,
        ),
      )
          .then((value) {
        print('value :$value');
      });

      ///now finally display payment sheeet
      displayPaymentSheet(paymentIntentData,context);
    } catch (e, s) {
      print('Payment exception:$e$s');
    }
    }
  }

  displayPaymentSheet(paymentIntentData, BuildContext context) async {

    try {
      await Stripe.instance
          .presentPaymentSheet()
          .then((newValue) async{
       // pDialog.show();
        print('payment intent' + paymentIntentData!['id'].toString());
        print('payment intent' + paymentIntentData!['client_secret'].toString());
        print('payment intent' + paymentIntentData!['amount'].toString());
        print('payment intent' + paymentIntentData.toString());
        //orderPlaceApi(paymentIntentData!['id'].toString());

        cardNameHolderController.text='';
        topUpPaymentController.text='';
        messageController.text='';

        /// API  To Server Data Pass
        await  stripePaymentToServer();

        topUpPaymentController.clear();
        cardNameHolderController.clear();
        paymentIntentData = null;
      }).onError((error, stackTrace) {
        print('Exception==> $error $stackTrace');
      });
    } on StripeException catch (e) {
      print('Exception==> $e');
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
            content: Text("Cancelled "),
          ));
    } catch (e) {
      print('$e');
    }
  }

  // Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    String payment=(int.parse(amount.toString())*100).toString();
    print('payment :: ${payment}');
    try {
      Map<String, dynamic> body = {
        "amount": payment, //(int.parse(amount)) * 100,
        "currency": currency,
        "payment_method_types[]": "card",
      };
      print(body);
      var response = await http
          .post(Uri.parse(StripeConfig.stripeUrl), body: body, headers: {
        'Authorization': 'Bearer ' + StripeConfig.secretKey,
        'Content-Type': 'application/x-www-form-urlencoded'
      });
      print('Create Intent reponse ===> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }


  Future stripePaymentToServer() async {
    print('Url :: ${ApiURL.createStripeTopUpUrl}');
    String? token = await localStoreSRF.getString('token');
    int? donorId = await localStoreSRF.getInt('donorId');
      final response = await _apiClient.connection(
        API_TYPE: '',
        apiType: 'POST',
        REQUEST_TYPE: '',
        REQUEST_DATA: {
          "amount": topUpPaymentController.text.toString(),
          "donor_id": donorId.toString()
        },
        customheader: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },

        apiUrl: ApiURL.createStripeTopUpUrl,
        PARAM: {},
      );


      if (response != null) {

        Helpers.snackbarForSucess(
            titleText: 'Successful Alert',
            bodyText: "Payment has been  successful!.");
      } else {

        Helpers.snackbarForErorr(
            titleText: ' Error Alert',
            bodyText: 'Payment has Field');
      }
    }
*/

}



class DBHelper {
  static DBHelper object = DBHelper._();

  DBHelper._();

  static ProgressDialog? pr;

  static dynamic loadingDialog(BuildContext context) {
    pr = ProgressDialog(context);
    pr = ProgressDialog(context,
        type: ProgressDialogType.normal, isDismissible: false, showLogs: true);
    pr!.style(
        message: "Wait for a few seconds ...",
        borderRadius: 5.0,
        backgroundColor: Colors.white,
        progressWidget: Container(
          padding: const EdgeInsets.all(10),
          child:  CircularProgressIndicator(
            backgroundColor: Colors.grey,
            color: AppColors.secondaryColor,
          ),
        ),
        elevation: 10.0,
        insetAnimCurve: Curves.fastOutSlowIn,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: const TextStyle(
          color: Colors.red,
          fontSize: 13.0,
          fontWeight: FontWeight.w400,
        ),
        messageTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
        ));
    return pr;
  }

}