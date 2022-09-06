import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clone_trust/app/ui/buy_page.dart';
import 'package:clone_trust/app/ui/receive_page.dart';
import 'package:clone_trust/app/ui/send_page.dart';
import 'package:clone_trust/app/ui/widgets/base_inkwell.dart';
import 'package:clone_trust/app/ui/widgets/crypto_detail.dart';
import 'package:clone_trust/utils/page_routes.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

enum TabIndex { Coins, Finance, Collectibles }

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: _buildBody(context)));
  }

  Widget _buildBody(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(color: Colors.blue[700]!),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 10.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(Icons.notifications, color: Colors.white),
                      Container(
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.blue[800],
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: TabBar(
                          controller: _tabController,
                          indicatorPadding: const EdgeInsets.all(2.0),
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(11.0),
                            color: Colors.blue[600],
                          ),
                          isScrollable: true,
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.white70,
                          tabs: const <Widget>[
                            SizedBox(
                              width: 80.0,
                              child: Text(
                                "Coins",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              width: 80.0,
                              child: Text(
                                "Finance",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              width: 80.0,
                              child: Text(
                                "Collectibles",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.sync_alt,
                        color: Colors.white,
                      )
                    ]),
                Container(
                  width: double.maxFinite,
                  height: 250.0,
                  child: TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      Column(children: [
                        const SizedBox(height: 40.0),
                        const Text(
                          '21 070, 34 USD',
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 5.0),
                        const Text(
                          '@JohnDoe',
                          style: TextStyle(fontSize: 15, color: Colors.white70),
                        ),
                        const SizedBox(height: 40.0),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              BaseInkWell(
                                  onTap: () => Navigator.of(context)
                                      .pushNamed(SendPage.routeName),
                                  child: Column(children: [
                                    CircleAvatar(
                                        radius: 30.0,
                                        backgroundColor:
                                            Colors.blue[400]!.withOpacity(0.4),
                                        child: const Icon(
                                          Icons.arrow_upward,
                                          color: Colors.white,
                                        )),
                                    const SizedBox(height: 7.0),
                                    const Text('Send',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12))
                                  ])),
                              const SizedBox(width: 30.0),
                              BaseInkWell(
                                  onTap: () => Navigator.of(context)
                                      .pushNamed(ReceivePage.routeName),
                                  child: Column(children: [
                                    CircleAvatar(
                                        radius: 30.0,
                                        backgroundColor:
                                            Colors.blue[400]!.withOpacity(0.4),
                                        child: const Icon(
                                          Icons.arrow_downward,
                                          color: Colors.white,
                                        )),
                                    const SizedBox(height: 7.0),
                                    const Text('Receive',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12))
                                  ])),
                              const SizedBox(width: 30.0),
                              BaseInkWell(
                                  onTap: () => Navigator.of(context)
                                      .pushNamed(BuyPage.routeName),
                                  child: Column(children: [
                                    CircleAvatar(
                                        radius: 30.0,
                                        backgroundColor:
                                            Colors.blue[400]!.withOpacity(0.4),
                                        child: const Icon(
                                          Icons.sell,
                                          color: Colors.white,
                                        )),
                                    const SizedBox(height: 7.0),
                                    const Text('Buy',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12))
                                  ])),
                            ])
                      ]),
                      Container(),
                      Container(),
                    ],
                  ),
                ),
              ],
            )),
        /*ListView.builder(
            shrinkWrap: true,
            itemCount: coinList.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  setState(() {});
                },
                leading: coinList[index].icon,
                title: Text(coinList[index].name,
                    style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600)),
                trailing: Text(coinList[index].total),
              );
            })*/
        const SizedBox(height: 10.0),
        const CryptoDetail(),
      ],
    );
  }
}
