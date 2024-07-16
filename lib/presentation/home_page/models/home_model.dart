import '../../../core/app_export.dart';
import 'donationrow_item_model.dart';

/// This class defines the variables used in the [home_page],
/// and is typically used to hold data that is passed between different parts of the application.
class HomeModel {

  Rx<List<DonationrowItemModel>> donationrowItemList = Rx(List.generate(6, (index) => DonationrowItemModel()));
}
