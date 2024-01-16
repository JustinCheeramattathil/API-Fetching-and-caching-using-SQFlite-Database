import 'package:flutter/material.dart';
import 'package:webandcrafts/utils/colors.dart';
import 'package:webandcrafts/widgets/custom_searchfield.dart';

class UpperUiComponent extends StatelessWidget {
  const UpperUiComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  Container(
            height: size.height * 0.12,
            width: double.infinity,
            color: primaryColor,
            child: Row(
              children: [
                SizedBox(
                  height: size.height * 0.2,
                  width: size.width * 0.2,
                  child: Image.asset('assets/images/cart1.png'),
                ),
                const CustomSearchField(),
                const SizedBox(
                  width: 20,
                ),
                const Stack(
                  children: [
                    Icon(
                      Icons.notifications_outlined,
                      color: scaffoldColor,
                    ),
                    Positioned(
                      left: 10,
                      child: CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.red,
                        child: Center(
                            child: Text(
                          '0',
                          style: TextStyle(fontSize: 5, color: scaffoldColor),
                        )),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
  }
}