import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:machinetest_newsapp/controller/newsprovider.dart';
import 'package:machinetest_newsapp/utils/constants.dart';
import 'package:machinetest_newsapp/utils/functions.dart';
import 'package:machinetest_newsapp/utils/mytextstyle.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsProvider>(context,listen: false).fetchNews('in');
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final newsProvider=Provider.of<NewsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.blue,
        title: const Text(
          Constants.appBarHead,
          style: MyTextStyle.whitetextBold,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.send,
              color: Constants.white,
            ),
          ),
        ],
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                Constants.topHeadline,
                style: MyTextStyle.blackBoldSize18,
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding:
                    const EdgeInsets.only(left: 13, right: 13, bottom: 10),
                itemCount: newsProvider.newsModel!.articles!.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Constants.height8;
                },
                itemBuilder: (BuildContext context, int index) {
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
                                newsProvider.newsModel!.articles![index].title!,
                                style: MyTextStyle.blackBoldSize18,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                              Constants.height5,
                              Text(newsProvider.newsModel!.articles![index].author!,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Constants.height5,
                              Text(
                                Functions.formatTimeAgo(DateTime.parse(newsProvider.newsModel!.articles![index].publishedAt!)),
                                style: MyTextStyle.greysmallText,
                              ),
                            ],
                          ),
                        ),
                        Constants.width10,
                        Container(
                          width: size.width*0.25,
                          height: size.width*0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/download.jpeg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
