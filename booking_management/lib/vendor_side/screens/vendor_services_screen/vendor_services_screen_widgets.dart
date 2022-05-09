import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddServicesButton extends StatelessWidget {
  const AddServicesButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //if(screenController.vendorProfileFormKey.currentState!.validate()){

       // }
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                spreadRadius: 3,
                blurRadius: 5,
                color: Colors.grey.shade300,
                blurStyle: BlurStyle.outer,
              ),
            ]
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 22, vertical: 8),
          child: Text(
            'Add Service',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}


class ServicesListModule extends StatelessWidget {
  const ServicesListModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 6,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, i){
          return Container(
            margin: const EdgeInsets.only(bottom: 17, left: 5, right: 5, top: 5),
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
                Expanded(
                  //flex: 68,
                  child: Row(
                    children: [
                      _userImageModule(i),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _categoryModule(i),
                            const SizedBox(height: 8),

                            _serviceModule(i),
                            const SizedBox(height: 8),

                            _userMobileNoModule(),
                            const SizedBox(height: 8),
                            _priceModule(),
                            const SizedBox(height: 8),
                            _timeDurationModule(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Row(
                  children: const [
                    Icon(Icons.edit),
                    SizedBox(width: 10),
                    Icon(Icons.delete)
                  ],
                ),

                 const SizedBox(width: 5),

                //_viewButton(),
              ],
            ).commonAllSidePadding(10),
          );
        });
  }

  Widget _userImageModule(i) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      //child: Image.network(ApiUrl.apiMainPath + screenController.pendingList[i].customerBooking.image),
      child: Image.asset(AppImages.vendorImg, scale: 15,),
    );
  }

  Widget _categoryModule(i) {
    return const Text(
      "Category Name",
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _serviceModule(i) {
    return const Text("Saloon",
        style: TextStyle(fontSize: 12));
  }

  Widget _userMobileNoModule(){
    return const Text("7875984532",
        style: TextStyle(fontSize: 12));
  }

  Widget _priceModule(){
    return const Text("Rs. 100.00",
        style: TextStyle(fontSize: 12));
  }

  Widget _timeDurationModule(){
    return const Text("1 Hour",
        style: TextStyle(fontSize: 12));
  }
}
