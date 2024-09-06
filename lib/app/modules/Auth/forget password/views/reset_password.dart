import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../signin/view/signinpage.dart';
import '../controller/forget_password_controller.dart';




class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: ()=>Get.back(), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(24.0),
          child: Column(children: [
            // Image
            Image(image:  const AssetImage("assets/images/sammy-line-man-receives-a-mail.png"),width: MediaQuery.of(context).size.width*0.6,),
            const SizedBox(height: 32,),

            //Text ,Title and Subtitle
            Text(email,style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.center,),
            Text("Password Reset Email Sent",style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),

            const SizedBox(height: 32,),
            Text("Your Account Security is Our Priority! We've Sent You a Security Link to Safely Change Your Password and Keep Your Account Protected",style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
            const SizedBox(height: 32,),

            // Button
            SizedBox(width: double.infinity,child: ElevatedButton(onPressed: ()=>Get.offAll(()=> Signinpage()), child: const Text("Done")),),
            const SizedBox(height: 32,),
            SizedBox(width: double.infinity,child: TextButton(onPressed: ()=>controller.resetPassword(), child: const Text("Resend Email")),),
          ],),
        ),
      ),
    );
  }
}
