import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/screens/home_screen/widgets/single_grid_product_builder.dart';
import 'package:iti_final_project/widgets/loading_animation_progress.dart';

class GetGridData extends StatefulWidget {
  const GetGridData({super.key});

  @override
  State<GetGridData> createState() => _GetGridDataState();
}

class _GetGridDataState extends State<GetGridData> {
  String? category;

  @override
  void initState() {
    super.initState();
    setState(() {
      FirebaseFirestore.instance.collection('products').doc("uId").snapshots();
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('products')
          .where('category', isEqualTo: category)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingAnimationProgress();
        } else if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.data!.docs.isNotEmpty) {
            return GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 3.0.sp,
              mainAxisSpacing: 2.0.sp,
              childAspectRatio: 1 / 1.7,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(
                snapshot.data!.docs.length,
                (index) => SingleGridProductBuilder(
                  title: snapshot.data!.docs[index]['title'],
                  descrip: snapshot.data!.docs[index]['descrip'],
                  id: snapshot.data!.docs[index]['uId'],
                  image: snapshot.data!.docs[index]['image'],
                  price: snapshot.data!.docs[index]['price'],
                  category: snapshot.data!.docs[index]['category'],
                ),
              ),
            );
          } else {
            return const Center(
              child: Center(
                child: Text(
                  'No products has been uploaded',
                ),
              ),
            );
          }
        }
        return const Center(
          child: Text('Something went wrong'),
        );
      },
    );
  }
}
