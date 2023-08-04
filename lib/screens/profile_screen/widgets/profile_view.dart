import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iti_final_project/core/utils/app_assets.dart';
import 'package:iti_final_project/core/utils/app_colors.dart';
import 'package:iti_final_project/core/utils/app_strings.dart';
import 'package:iti_final_project/core/utils/size_config.dart';
import 'package:iti_final_project/core/utils/styles.dart';
import 'package:iti_final_project/logic/profile_cubit/profile_cubit.dart';
import 'package:iti_final_project/screens/profile_screen/widgets/bottom_model.dart';

class ProfileBody extends StatefulWidget {
  final String userId;

  const ProfileBody({super.key, required this.userId});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance.collection('users');
  bool isLoading = false;
  String emailAddress = '';
  String firstName = '';
  String lastName = '';
  String phoneNumber = '';
  bool isSameUser = false;

  bool isEnable = false;
  bool isEdit = false;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    try {
      final DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.userId)
          .get();
      if (userDoc == null) {
        return;
      } else {
        setState(() {
          emailAddress = userDoc.get('emailAddress');
          firstName = userDoc.get('firstName');
          lastName = userDoc.get('lastName');
          phoneNumber = userDoc.get('phoneNumber');
        });
        User? user = auth.currentUser;
        String uId = user!.uid;
        setState(() {
          isSameUser = uId == widget.userId;
        });
      }
    } catch (error) {
      // AwesomeDialog(
      //   context: context,
      //   padding: EdgeInsets.all(PaddingSize.padding20h),
      //   title: "Error",
      //   dialogType: DialogType.error,
      //   body: Text(
      //     "No Data to Show",
      //     style: Styles.textStyle16Semi.copyWith(
      //       color: kBlackColor,
      //     ),
      //   ),
      // ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: Builder(builder: (context) {
        final cubit = ProfileCubit.get(context);
        return Scaffold(
          backgroundColor: kWhiteColor,
          appBar: AppBar(
            elevation: 0,
            titleSpacing: PaddingSize.padding22h,
            backgroundColor: kWhiteColor,
            centerTitle: false,
            title: Text(
              AppStrings.profile,
              style: Styles.textStyle24Extra,
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: PaddingSize.padding21width),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.cartShopping,
                    color: kSecondaryFontColor,
                  ),
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: PaddingSize.padding21width),
              child: Column(
                children: [
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: PaddingSize.padding30h,
                                  bottom: PaddingSize.padding17h),
                              child: GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                      isScrollControlled: true,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(18),
                                          topRight: Radius.circular(18),
                                        ),
                                      ),
                                      context: context,
                                      builder: (context) {
                                        return SizedBox(
                                          height: 150.h,
                                          child: BottomModel(
                                            cubit: cubit,
                                          ),
                                        );
                                      });
                                },
                                child: Container(
                                  width: 200.w,
                                  height: 150.h,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                        AppAssets.profileImage,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    shape: BoxShape.rectangle,
                                    color: Colors.deepOrangeAccent
                                        .withOpacity(0.2),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(27.0.r)),
                                  ),
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      if (cubit.myImage != null)
                                        Image.file(
                                          cubit.myImage!,
                                          height: 200.h,
                                          width: 200.w,
                                          fit: BoxFit.cover,
                                        ),
                                      Container(
                                        width: 200.0.w,
                                        height: 23.h,
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.5)),
                                        child: Icon(
                                          Icons.camera_alt_outlined,
                                          color: cubit.myImage != null
                                              ? kWhiteColor
                                              : kWhiteColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: PaddingSize.padding21h,
                          ),
                          Text(
                            'Hi there ${firstName + lastName}',
                            style: Styles.textStyle12Regular,
                          ),
                          SizedBox(
                            height: PaddingSize.padding21h,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0.r)),
                              border: Border.all(
                                color: kPrimaryColor,
                                width: 2.0.w,
                              ),
                            ),
                            height: 200.0.h,
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '$emailAddress',
                                  style: Styles.textStyle14Semi.copyWith(
                                    color: kPrimaryColor,
                                  ),
                                ),
                                Text(
                                  'Integrate Data Here',
                                  style: Styles.textStyle14Semi.copyWith(
                                    color: kPrimaryColor,
                                  ),
                                ),
                                Text(
                                  '$phoneNumber',
                                  style: Styles.textStyle14Semi.copyWith(
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: PaddingSize.padding21h,
                          ),
                          TextButton(
                            onPressed: () {
                              cubit.signOut(context);
                            },
                            child: Text(
                              AppStrings.signOut,
                              style: Styles.textStyle16Bold.copyWith(
                                color: kPrimaryColor,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
