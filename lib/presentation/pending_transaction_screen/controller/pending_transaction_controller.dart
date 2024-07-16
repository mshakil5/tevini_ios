import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/presentation/pending_transaction_screen/models/pending_transaction_model.dart';

/// A controller class for the PendingTransactionScreen.
///
/// This class manages the state of the PendingTransactionScreen, including the
/// current pendingTransactionModelObj
class PendingTransactionController extends GetxController {


  Rx<PendingTransactionModel> pendingTransactionModelObj =
      PendingTransactionModel().obs;
}
