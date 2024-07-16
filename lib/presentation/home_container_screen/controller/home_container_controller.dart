import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/core/values/app_space.dart';
import 'package:tenvini/data/models/home/dashboard_model.dart';
import 'package:tenvini/presentation/all_transaction_screen/all_transaction_screen.dart';
import 'package:tenvini/presentation/home_container_screen/models/home_container_model.dart';
import 'package:tenvini/presentation/transafer_tdf_screen/transfer_tdf_screen.dart';

import '../../../core/values/app_assets.dart';
import '../../../data/apiClient/repo.dart';
import '../../donation_record_screen/donation_record_screen.dart';
import '../../home_page/controller/home_controller.dart';
import '../../home_page/home_page.dart';
import '../../my_profile_screen/my_profile_screen.dart';

class HomeContainerController extends GetxController {
  Rx<HomeContainerModel> homeContainerModelObj = HomeContainerModel().obs;
  List<Alltransaction> dashboardData =[];
  List<Widget>? screens =  [
    HomePage(),
   // DonationRecordScreen(),
    //DonationRecordScreen(),
    //MyProfileScreen()
    //AllTransactionScreen()
  //  TransferTDFScreen()
    CompanyInfoScreen()
  ];

  final  loadingData=false.obs;

  @override
  void onInit() async{

  fetchData();
  super.onInit();
  }


  fetchData() async {
    await Future.delayed(Duration(seconds: 6), () async{
      HomeController controller = Get.put(HomeController());
        await controller.allSync();
      loadingData.value = true;
    });
  }

}


class CompanyInfoScreen extends StatelessWidget {
  const CompanyInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(

      padding: EdgeInsets.all(20),
      child:  SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
          Image.asset(AppAssets.appLogo,width: 100,height: 70,),

          Text('You care too',style:  CustomTextStyles.displaySmallBlackA700,),
            AppSpace.spaceH6,
          Text('''As a responsible donor, you want to make sure your hard-earned money goes as far as possible to support the causes you care about. In fact, we care so much that all Tevini profits go to charity.''',style:  CustomTextStyles.titleLargeBlackA700,),
            AppSpace.spaceH10,
          Text('Making it easy',style:  CustomTextStyles.displaySmallBlackA700,),
            AppSpace.spaceH6,
          Text('At Tevini, we excel at customer service and take care of all the tedious legalities for you, so you can focus on what matters most: supporting the charities that are important to you. We work with a large range of reputable organizations, both big and small.',style:  CustomTextStyles.titleLargeBlackA700,),
            AppSpace.spaceH10,
            Text('The best of all worlds',style:  CustomTextStyles.displaySmallBlackA700,),
            AppSpace.spaceH6,
            Text('With Tevini, you benefit from the flexibility of a local provider and the professionalism of experts who have been helping people with their charity accounts for many years.',style:  CustomTextStyles.titleLargeBlackA700,),

          ],
        ),
      ),
    );
  }
}

