
import 'package:flutter/material.dart';
import 'package:machinetest_newsapp/controller/newsprovider.dart';
import 'package:machinetest_newsapp/utils/constants.dart';
import 'package:machinetest_newsapp/utils/functions.dart';
import 'package:machinetest_newsapp/utils/mytextstyle.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({
    super.key,
    required this.size,
    required this.newsProvider, required this.index,
  });

  final Size size;
  final NewsProvider newsProvider;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Constants.white,
        ),
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newsProvider
                        .newsModel!.articles![index].title!,
                    style: MyTextStyle.blackBoldSize18,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  Constants.height5,
                  Text(
                    newsProvider
                        .newsModel!.articles![index].author!,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Constants.height5,
                  Text(
                    Functions.formatTimeAgo(DateTime.parse(
                        newsProvider.newsModel!
                            .articles![index].publishedAt!)),
                    style: MyTextStyle.greysmallText,
                  ),
                ],
              ),
            ),
            Constants.width10,
            Container(
              width: size.width * 0.25,
              height: size.width * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  image: AssetImage(
                      'assets/images/download.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      );
  }
}
