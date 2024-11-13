import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 180.h,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: [
        'https://img.freepik.com/free-vector/flat-design-fashion-week-facebook-cover_23-2151084422.jpg?t=st=1731499330~exp=1731502930~hmac=4afcec9f0f5376c2144ffa6cb160bbf8f2a68659d3afc62029fe2c20f31f2723&w=1380',
        'https://img.freepik.com/free-vector/flat-design-fashion-week-facebook-cover_23-2151084422.jpg?t=st=1731499330~exp=1731502930~hmac=4afcec9f0f5376c2144ffa6cb160bbf8f2a68659d3afc62029fe2c20f31f2723&w=1380',
        'https://img.freepik.com/free-vector/flat-design-fashion-week-facebook-cover_23-2151084422.jpg?t=st=1731499330~exp=1731502930~hmac=4afcec9f0f5376c2144ffa6cb160bbf8f2a68659d3afc62029fe2c20f31f2723&w=1380',
      ].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.r)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20.r)),
                child: Image.network(
                  i,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
