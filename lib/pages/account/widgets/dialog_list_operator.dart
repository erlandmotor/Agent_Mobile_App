import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:flutter/material.dart';

Future dialogListOperator(BuildContext context,
    {required TextEditingController controllerInput}) async {
  return showModalBottomSheet<void>(
    context: context,
    isDismissible: false,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return InkWell(
        onTap: () {},
        child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Operator',
                    style: FontStyle.subtitle1SemiBold,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.close_rounded,
                        color: ColorApp.secondary00,
                        size: 16,
                      ))
                ],
              ),
              Divider(
                thickness: 0,
                color: ColorApp.secondaryB2,
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: controllerInput,
                cursorColor: ColorApp.primaryA3,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                  isCollapsed: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorApp.primaryA3)),
                  hintText: 'Cari Operator',
                  suffixIcon: Icon(
                    Icons.search_rounded,
                    color: ColorApp.secondaryB2,
                  ),
                  fillColor: ColorApp.primaryA3,
                  focusColor: ColorApp.primaryA3,
                  hoverColor: ColorApp.primaryA3,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: ColorApp.secondaryEA)),
                  hintStyle:
                      FontStyle.body2.copyWith(color: ColorApp.secondaryB2),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: 5,
                    itemBuilder: (context, index) => Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Telkomsel',
                                  style: FontStyle.subtitle1,
                                ),
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: ColorApp.primaryA3,
                                ),
                              ],
                            ),
                            Divider(
                              color: ColorApp.secondaryB2,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        )),
              )
            ],
          ),
        ),
      );
    },
  );
}
