

import '../../const/colors.dart';
import '../../const/const.dart';
import '../../const/images.dart';
import '../../widgets/normal_text.dart';

class ProductDetails extends StatelessWidget {
  final dynamic data;
  const ProductDetails({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: boldText(text: "${data['p_name']}", color: fontGrey),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            VxSwiper.builder(
              autoPlay: true,
              height: 350,
              itemCount: data['p_img'].length,
              aspectRatio: 16 / 9,
              viewportFraction: 1.0,
              itemBuilder: (context, index) {
                //BorderRadius borderRadius = BorderRadius.zero;
                // Add your image widget here
                return Image.network(
                //network

                  data['p_img'][index],
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  boldText(
                    text: "${data['p_name']}",
                    color: fontGrey,
                    size: 20.0,
                  ).py8(),

                  10.heightBox,
                  Row(
                    children: [
                      boldText(text: "${data['p_category']}", color: fontGrey, size: 16.0),
                      10.widthBox,
                      boldText(text: "${data['p_subcategory']}", color: fontGrey, size: 16.0),
                    ],
                  ),

                  10.heightBox,
                  const Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star_border,
                        color: Colors.yellow,
                      ),
                    ],
                  ).py8(),
                  boldText(
                    text: "${data['p_price']}", // Change to your product price
                    color: fontGrey,
                    size: 18.0,
                  ).py8(),
                  Row(
                    children: [
                      boldText(
                        text: "${data['p_quantity']}",
                        color: fontGrey,
                      ),
                      // Add your quantity widget here
                      Text("3", style: TextStyle(color: fontGrey)),
                    ],
                  ).py8(),
                  boldText(
                    text: "${data['p_des']}",
                    color: fontGrey,
                    size: 16.0,
                  ).py8(),
                  normalText(
                    text:
                    "${data['p_sdes']}", // Change to your product description
                    color: fontGrey,
                  ).py8(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
