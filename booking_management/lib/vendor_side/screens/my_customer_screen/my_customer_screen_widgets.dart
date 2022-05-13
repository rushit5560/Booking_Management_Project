import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/vendor_side/controllers/vendor_my_customer_list_screen_controller/vendor_my_customer_list_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/vendor_my_customer_model/vendor_my_customer_model.dart';



class CustomerList extends StatelessWidget {
  CustomerList({Key? key}) : super(key: key);
  final screenController = Get.find<VendorMyCustomerScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: screenController.allCustomerList.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, i) {
          CustomerDatum singleItem = screenController.allCustomerList[i];
          return Container(
            margin:
                const EdgeInsets.only(bottom: 17, left: 5, right: 5, top: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 3,
                  blurRadius: 5,
                  color: Colors.grey.shade300,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    //_userImageModule(i),
                    //const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _userNameModule(singleItem),
                        const SizedBox(height: 8),

                        _userEmailModule(singleItem),
                        const SizedBox(height: 8),

                        _userMobileNoModule(singleItem),
                        // const SizedBox(height: 8),
                        // _statusModule(i),
                      ],
                    ),
                  ],
                ),

                const SizedBox(width: 5),

                //_viewButton(),
              ],
            ).commonAllSidePadding(10),
          );
        });
  }

  // Widget _userImageModule(i) {
  //   return ClipRRect(
  //     borderRadius: BorderRadius.circular(10),
  //     //child: Image.network(ApiUrl.apiMainPath + screenController.pendingList[i].customerBooking.image),
  //     child: Image.asset(AppImages.vendorImg, scale: 15,),
  //   );
  // }

  Widget _userNameModule(CustomerDatum singleItem) {
    return Text(
      singleItem.customer.userName,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _userEmailModule(CustomerDatum singleItem) {
    return Text(
      singleItem.customer.email,
      style: const TextStyle(fontSize: 12),
    );
  }

  Widget _userMobileNoModule(CustomerDatum singleItem) {
    return Text(
      singleItem.customer.phoneNo,
      style: const TextStyle(fontSize: 12),
    );
  }

  /*Widget _statusModule(i) {
    return const Text(
      "Status - Pending",
      style: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    );
  }*/

/*Widget _viewButton() {
    return GestureDetector(
      onTap: () => Get.to(()=> VendorUserDetailsScreen(), transition: Transition.zoom),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 2,
              color: Colors.grey.shade300,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            'View',
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

      ),
    );
  }*/
}
