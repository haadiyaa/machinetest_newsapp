import 'package:flutter/material.dart';
import 'package:machinetest_newsapp/controller/passvisibilityprovider.dart';
import 'package:machinetest_newsapp/utils/constants.dart';
import 'package:provider/provider.dart';

class CustomTextfield extends StatelessWidget {
  CustomTextfield({
    super.key,
    required this.text,
    required this.textEditingController,
    this.validator,
    this.obscureText = false,
  });
  final String text;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<Passvisibilityprovider>(
          builder: (context, passwordVisibilityProvider, child) {
            return TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validator,
              obscureText: obscureText&&!passwordVisibilityProvider.isPasswordvisible,
              controller: textEditingController,
              decoration: InputDecoration(
                suffixIcon: obscureText
                    ? IconButton(
                        onPressed: () {
                          passwordVisibilityProvider.togglePassword();
                        },
                        icon: Icon(passwordVisibilityProvider.isPasswordvisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                      )
                    : null,
                filled: true,
                fillColor: Constants.white,
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                hintText: text,
              ),
            );
          },
        ));
  }
}
