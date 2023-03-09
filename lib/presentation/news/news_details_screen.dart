import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../domain/model/News.dart';
import '../utils/date_utils.dart';

class NewsDetailsScreen extends StatelessWidget {
  static String routeName = 'newsDetails';

  @override
  Widget build(BuildContext context) {
    News news = ModalRoute.of(context)?.settings.arguments as News;
    final date = DateTime.tryParse(news.publishedAt ?? '');
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('assets/images/pattern.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('News Details'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: news.urlToImage ?? '',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  news.author ?? '',
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  news.title ?? '',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  MyDateUtils.newsDate(date!, context),
                  style: const TextStyle(color: Colors.grey),
                  textAlign: TextAlign.end,
                ),
                const SizedBox(
                  height: 15,
                ),
                SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 1,
                            offset: const Offset(2, 4),
                          ),
                        ]),
                    child: Column(
                      children: [
                        Text(
                          news.description ?? '',
                          style: const TextStyle(fontSize: 17),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            _launchUrl(Uri.parse(news.url ?? ''));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text(
                                'View Full Article',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff707070),
                                    fontSize: 18),
                              ),
                              Icon(
                                Icons.play_arrow,
                                size: 18,
                                color: Color(0xff707070),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}
