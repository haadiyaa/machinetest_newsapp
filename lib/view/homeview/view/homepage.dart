import 'package:flutter/material.dart';
import 'package:machinetest_newsapp/utils/constants.dart';
import 'package:machinetest_newsapp/utils/mytextstyle.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
      body: SingleChildScrollView(
        child: SizedBox(
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
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
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
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'News Source',
                                  style: MyTextStyle.blackBoldSize18,
                                ),
                                Constants.height5,
                                Text(
                                  'lorem ipsunbsn ddddddddddddddddddddddddddd dddddddddddddddddddddddddddddddddddddddddddddddddd ddddddddd dddddddd ddddd dddddddddddddddddddddddddddd ddddddddfhshdvhsgd sdvgsdsvcgs svdvsgfdgs',
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Constants.height5,
                                Text(
                                  '10 minutes ago',
                                  style: MyTextStyle.greysmallText,
                                )
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
      ),
    );
  }
}
