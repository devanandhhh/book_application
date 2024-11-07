import 'package:books_app/core/colors.dart';
import 'package:books_app/presentation/widgets/icon_widget.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});

  final formKey =GlobalKey<FormState>();
  final nameController =TextEditingController();
  final passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20,),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 108, bottom: 113),
                child: iconContainer(),
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //user name
                    Text(
                      'User Name',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, color: kGrey600),
                    ),
                    kHeight10,
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          hintText: 'Enter your name',
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: kOrange, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    kHeight20,
                    //password
                    Text(
                      'Password',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, color: kGrey600),
                    ),
                    kHeight10,
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        hintText: 'Enter your password',
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: kOrange, width: 2.0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            // state.isVisible
                            1 < 2 ? Icons.visibility_off : Icons.visibility,
                            color: kGrey600,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    kHeight20,
                    //confirm password
                    Text(
                      'Confirm password',
                      style:
                          TextStyle(color: kGrey600, fontWeight: FontWeight.bold),
                    ),
                    kHeight10,
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        hintText: 'Enter your confirm password',
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: kOrange, width: 2.0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            // state.isVisible
                            1 < 2 ? Icons.visibility_off : Icons.visibility,
                            color: kGrey600,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    kHeight20,
                    authButton("Register"),
                    kHeight20
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Container authButton(String? text) {
  return Container(
    width: double.infinity,
    height: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(11),
      color: Colors.orange[800],
    ),
    child: Center(
        child: Text(
      text!,
      style: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),
    )),
  );
}
