import 'package:flutter/material.dart';
import 'package:machinetest_newsapp/controller/authprovider.dart';
import 'package:machinetest_newsapp/controller/newsprovider.dart';
import 'package:machinetest_newsapp/utils/constants.dart';
import 'package:machinetest_newsapp/utils/functions.dart';
import 'package:machinetest_newsapp/utils/mytextstyle.dart';
import 'package:machinetest_newsapp/view/homeview/widgets/newstile.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.code});
  final String code;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsProvider>(context, listen: false).fetchNews('in');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final newsProvider = Provider.of<NewsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.blue,
        title: const Text(
          Constants.appBarHead,
          style: MyTextStyle.whitetextBold,
        ),
        actions: [
          Consumer<AuthProvider>(
            builder: (context, authProvider, child) {
              return Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.directions_sharp,
                        color: Constants.white,
                        size: 15,
                      ),
                    ),
                    authProvider.isLoading
                        ? const Text('...')
                        : Text(
                            // widget.code,
                            authProvider.countryCode,
                            style: MyTextStyle.whitetextBold,
                          ),
                  ],
                ),
              );
            },
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
                padding: const EdgeInsets.only(left: 13, right: 13, bottom: 10),
                itemCount: newsProvider.isLoading
                    ? 10
                    : newsProvider.newsModel!.articles!.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Constants.height8;
                },
                itemBuilder: (BuildContext context, int index) {
                  return newsProvider.isLoading
                      ? Shimmer.fromColors(
                          baseColor: const Color.fromARGB(255, 211, 211, 211),
                          highlightColor: Constants.white,
                          child: Container(
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Constants.white,
                            ),
                          ),
                        )
                      : InkWell(
                        onTap: () {
                         newsProvider.launchURLBrowser(newsProvider.newsModel!.articles![index].url!);
                        },
                          child: NewsTile(
                            size: size,
                            newsProvider: newsProvider,
                            index: index,
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
