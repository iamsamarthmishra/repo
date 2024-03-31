import 'package:emart_seller/const/const.dart';

import '../../const/colors.dart';
import '../../const/images.dart';
import '../../const/strings.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/normal_text.dart';

class EditProfileScreen extends StatelessWidget {
  final String? username;
  const EditProfileScreen({super.key, this.username});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: boldText(text: editscreen, size: 16.0,color: white),
        actions: [TextButton(onPressed: () {}, child: normalText(text: save, color: fontGrey))],
      ),


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Image.asset(imgProduct, width: 150).box.roundedFull.clip(Clip.antiAlias).make(),
              10.heightBox,
              ElevatedButton(
                style:ElevatedButton.styleFrom(backgroundColor: black),
                onPressed: () {}, child: normalText(text: changeImage, color: white),
              ),
              10.heightBox,
              const Divider(color: black),
              20.heightBox,
              customTextField(label: uname),
              20.heightBox,
              customTextField(label: password, hint: passHint),
              20.heightBox,
              customTextField(label: conpass, hint: passHint),
            ],
          ),
        ),
      ),
    );
  }
}