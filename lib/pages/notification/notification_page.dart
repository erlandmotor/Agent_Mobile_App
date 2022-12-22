import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/providers/notification_prov/notification_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final List _buttonBar = ['Semua', 'Promo', 'Informasi'];
  @override
  void initState() {
    super.initState();
    context.read<NotificationDataProvider>().getData();
  }

  int notifikasi = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _buttonBar.length,
      child: Builder(builder: (context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          if (tabController.index == 0) {
            context.read<NotificationDataProvider>().filterDataNotif(query: '');
          } else if (tabController.index == 1) {
            context
                .read<NotificationDataProvider>()
                .filterDataNotif(query: 'promo');
          } else {
            context
                .read<NotificationDataProvider>()
                .filterDataNotif(query: 'informasi');
          }
        });
        return Scaffold(
            backgroundColor: ColorApp.secondaryFF,
            appBar: AppBar(
              backgroundColor: ColorApp.primaryA3,
              elevation: 0,
              leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: ColorApp.secondaryFF,
                ),
              ),
              titleSpacing: 0,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(50),
                child: Material(
                  color: Colors.white,
                  child: SizedBox(
                    height: 45,
                    child: TabBar(
                      tabs: [
                        Text(_buttonBar[0]),
                        Text(_buttonBar[1]),
                        Text(_buttonBar[2]),
                      ],
                      labelStyle: FontStyle.subtitle1SemiBold
                          .copyWith(color: Colors.blue),
                      labelColor: Colors.blue,
                      indicatorColor: Colors.blue,
                    ),
                  ),
                ),
              ),
              title: Text(
                'Notifikasi',
                style: FontStyle.heading1.copyWith(color: ColorApp.secondaryFF),
              ),
            ),
            body:
                Consumer<NotificationDataProvider>(builder: (context, data, _) {
              if (data.isLoading == true) {
                return const Center(
                  child: CupertinoActivityIndicator(
                    radius: 16,
                  ),
                );
              } else {
                if (data.dataNotification.isNotEmpty) {
                  return ListView.builder(
                    itemCount: data.dataNotification.length,
                    itemBuilder: (context, index) => notificationWidget(
                        time: '9 Jam lalu',
                        title: data.dataNotification[index].title!,
                        desc: data.dataNotification[index].desc!,
                        type: data.dataNotification[index].type!),
                  );
                } else {
                  return Column(
                    children: [
                      Image.asset(
                        'assets/ilustration/nothingNotification.png',
                        width: MediaQuery.of(context).size.height * 0.5,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Belum ada notificasi buatmu',
                        style: FontStyle.headline6,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Text(
                          'Kalau ada informasia atau promo terbaru buat mu, bisa dicek disini',
                          style: FontStyle.caption,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  );
                }
              }
            }));
      }),
    );
  }

  Container notificationWidget(
      {required String time,
      required String title,
      required String desc,
      required String type}) {
    return Container(
      padding: Marginlayout.marginAll,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              type.toLowerCase() == 'Promo'.toLowerCase()
                  ? Image.asset('assets/icons/promo.png')
                  : const Opacity(opacity: 0),
              const SizedBox(
                width: 8,
              ),
              Text(
                type.toLowerCase() == 'Promo'.toLowerCase()
                    ? 'Promo'
                    : 'Informasi',
                style: FontStyle.subtitle2,
              ),
              const Spacer(),
              Text(
                time,
                style: FontStyle.captionBlue,
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: FontStyle.subtitle2SemiBold,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            desc,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: FontStyle.caption,
          ),
          const SizedBox(
            height: 8,
          ),
          Divider(
            color: ColorApp.primaryDF,
            thickness: 1.5,
          )
        ],
      ),
    );
  }
}
