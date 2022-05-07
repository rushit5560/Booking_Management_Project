import 'package:flutter/material.dart';
import '../../../common_modules/custom_appbar/custom_appbar.dart';
import 'user_category_list_screen_widgets.dart';


class UserCategoryListScreen extends StatelessWidget {
  const UserCategoryListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            CommonAppBarModule(title: 'Categories'),
            SizedBox(height: 10),
            Expanded(child: CategoryListModule()),
          ],
        ),
      ),
    );
  }
}
