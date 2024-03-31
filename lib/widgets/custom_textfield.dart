import '../const/colors.dart';
import '../const/const.dart';
import 'normal_text.dart';

Widget customTextField({label, hint, controller, isDesc = false, sdes = false}){
  return TextFormField(
    maxLines: isDesc ? 8 : 1,
    decoration: InputDecoration(
      isDense: true,
      label: normalText(text: label),
      enabledBorder:
      OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: black,
          )),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: black,
          )),
      hintText: hint,
      hintStyle: const TextStyle(color: darkGrey),
    ),
  );
}