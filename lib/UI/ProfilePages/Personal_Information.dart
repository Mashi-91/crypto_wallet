import 'package:country_list_pick/country_list_pick.dart';
import 'package:crypto_wallet/model/UserModel.dart';
import 'package:crypto_wallet/provider/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Utils/CustomButton.dart';
import '../../Utils/const_colors.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({Key? key}) : super(key: key);
  static const routename = 'personalinformation';

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  @override
  Widget build(BuildContext context) {
    final authProv = Provider.of<AuthProvider>(context,listen: false);
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: 'Personal Information'.text.make(),
        ),
        body: FutureBuilder(
          future: authProv.getUserData(context),
            builder: (_, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasData){
              final data = snapshot.data as UserModel;
              return SingleChildScrollView(
                child: SizedBox(
                  height: size.height * 0.89,
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          'We get your personal information from the\nverification process. If you want to make changes\non your personal information, contact our support.',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      (size.height * 0.05).heightBox,
                      Flexible(
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20))),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 25, right: 25, top: 25),
                                child: Form(
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        initialValue: data.fullName,
                                        decoration: InputDecoration(
                                          labelText: "Full name",
                                          labelStyle: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: ConstColors.darkGrey),
                                        ),
                                      ),
                                      TextFormField(
                                        initialValue: data.streetAddress,
                                        decoration: InputDecoration(
                                          labelText: "Street address",
                                          labelStyle: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: ConstColors.darkGrey),
                                        ),
                                      ),
                                      TextFormField(
                                        initialValue: data.city,
                                        decoration: InputDecoration(
                                          labelText: "City",
                                          labelStyle: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: ConstColors.darkGrey),
                                        ),
                                      ),
                                      TextFormField(
                                        initialValue: data.areaCode.toString(),
                                        decoration: InputDecoration(
                                          labelText: "Zip/Area code",
                                          labelStyle: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: ConstColors.darkGrey),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 18),
                                child: CountryListPick(
                                  initialSelection: data.citizenship,
                                  useSafeArea: false,
                                  onChanged: (e) {
                                    setState(() {});
                                  },
                                  pickerBuilder: (context, dynamic countryCode) {
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        "Citizenship"
                                            .text
                                            .color(ConstColors.darkGrey)
                                            .make(),
                                        Row(
                                          children: [
                                            Image.asset(
                                              countryCode.flagUri,
                                              package: 'country_list_pick',
                                              scale: 15,
                                            ),
                                            5.widthBox,
                                            Text(countryCode.name,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 19)),
                                          ],
                                        ),
                                        Divider(
                                          thickness: 1.5,
                                          color: Colors.black.withOpacity(0.3),
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }else if(snapshot.hasError){
              ScaffoldMessenger(child: SnackBar(content: Text(snapshot.hasError.toString()),),);
            } else{
              Text('Something, went wrong!');
            }
          }
          return Center(child: CircularProgressIndicator(),);
        }
        ));
  }
}
