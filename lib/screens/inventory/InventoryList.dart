import 'package:flutter/material.dart';
import 'package:home_inventory/constant/colors.dart';
import 'package:home_inventory/widget/OwnInventoryCard.dart';
import 'package:home_inventory/widget/SharedInventoryCard.dart';
import 'package:home_inventory/widget/appbar.dart';

class InventoryListPage extends StatefulWidget {
  const InventoryListPage({Key? key}) : super(key: key);

  @override
  State<InventoryListPage> createState() => _InventoryListPageState();
}

class _InventoryListPageState extends State<InventoryListPage>
    with
        AutomaticKeepAliveClientMixin<InventoryListPage>,
        TickerProviderStateMixin {
  var tempinv = [0, 1, 1, 0, 0, 1, 1, 1, 1, 0];
  @override
  Widget build(BuildContext context) {
    var isportait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: const CustomAppBar(),
      floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: AppColors.white,
          onPressed: () {},
          child: const Icon(
            Icons.add,
            color: AppColors.mediumgreen,
            size: 50,
          )),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomScrollView(slivers: [
          pageheader(context),
          SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isportait ? 2 : 4),
              delegate: SliverChildBuilderDelegate(childCount: tempinv.length,
                  (BuildContext context, int index) {
                return tempinv[index] == 1
                    ? const OwnInventoryCard(
                        inventoryName: "Sakinaka Home Inventory",
                      )
                    : const SharedInventoryCard(
                        inventoryName: "Ghatkopar Home Inventory",
                      );
              })),
        ]),
      ),
    );
  }

  SliverToBoxAdapter pageheader(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: const Text(
          "Inventories",
          style: TextStyle(fontSize: 23),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
