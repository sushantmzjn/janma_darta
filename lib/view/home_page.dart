import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:janma_darta/provider/auth_provider.dart';
import 'package:janma_darta/view/janma_darta/info_page.dart';

import '../common widget/card_item.dart';
import '../constant/colors.dart';
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    ref.watch(authProvider);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (){
              ref.read(authProvider.notifier).userLogOut();
            },
            splashColor: Colors.green,
            icon: Icon(Icons.exit_to_app),)
        ],
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          alignment: Alignment.topCenter,
          padding:const EdgeInsets.symmetric(vertical: 10.0),
          child: Wrap(
            spacing: 4,
            runSpacing: 4,
            children: [
              CardItem(
                cardImage: Image.asset('assets/darta/birth.png', height: 60.h, color: primaryColor,),
                text: 'जन्म दर्ता',
                onTap: () {Get.to(()=> InfoPage());},
              )
            ],
          ),
        ),
      ),
    );
  }
}
