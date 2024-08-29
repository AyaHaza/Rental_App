import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/widgets_App/listTile_widget.dart';
import '../bloc/wallet_bloc.dart';
import '../../../config/hive_config.dart';
import '../../../config/responsive.dart';
import '../../../core/resources/assets.dart';
import '../../../core/resources/color.dart';
import '../../../core/resources/padding.dart';
import '../../../core/resources/string.dart';
import '../../../core/resources/style.dart';
import '../../../core/resources/variable.dart';
import '../../../core/widgets_App/buttons_widget.dart';
import '../../../core/widgets_App/drawer_widget.dart';


class WalletInfo extends StatelessWidget {
  const WalletInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WalletBloc()
        ..add(GetWalletInfo())
        ..add(GetAllvalidCodeEvent()),
      child: Builder(builder: (context) {
        return Scaffold(
            backgroundColor: white,
            drawer: (isGoogle == true)
                ? DrawerCustom(
                    user.currentUser!.displayName!,
                    user.currentUser!.email,
                    NetworkImage(user.currentUser!.photoUrl),
                    () {},
                    () {},
                    () {},
                    () {},
                    () {},
                    () {}, () async {
                    userHive!.delete("token");
                    if (isGoogle == true) {
                      await user.disconnect();
                    }

                    Navigator.pushNamed(context, '/Register');
                  })
                : DrawerCustom(
                    'user Name',
                    'userEmail@gmail.com',
                    const AssetImage(boyImage),
                    () {},
                    () {},
                    () {},
                    () {},
                    () {},
                    () {}, () async {
                    userHive!.delete("token");
                    Navigator.pushNamed(context, '/Register');
                  }),
            body: Padding(
              padding: leftAndRightAndTopPadding(0.02, 0.02, 0.04),
              child: ListView(
                children: [
                  Row(
                    children: [
                      Builder(builder: (context) {
                        return IconButton(
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            style: IconButton.styleFrom(
                                backgroundColor: lightGreen,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            icon: const Icon(
                              Icons.format_align_justify,
                              size: 18,
                              color: black,
                            ));
                      }),
                      const Spacer(),
                      Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                              onPressed: () {},
                              style: IconButton.styleFrom(
                                  backgroundColor: white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              icon: const Icon(
                                Icons.notifications_none,
                                size: 18,
                                color: black,
                              ))),
                    ],
                  ),
                  Padding(
                    padding: TopAndBottomPadding(0.02, 0.024),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: ButtonCustom(
                          1,
                          screenWidth * 0.45,
                          screenHight * 0.072,
                          const Text(
                            ADDMONEY,
                            style: addMoneyTextStyle,
                          ),
                          white,
                          darkGreenColor, () {
                        Navigator.pushNamed(context, '/AddAmont');
                      }),
                    ),
                  ),
                  ButtonCustom(2, screenWidth, screenHight * 0.2,
                      BlocBuilder<WalletBloc, WalletState>(
                    builder: (context, state) {
                      if (state is LoadingState) {
                        return const CupertinoActivityIndicator(
                          color: white,
                        );
                      } else if (state is ErrorState) {
                        return Text(state.failure);
                      } else if (state is WalletInitial) {
                        return const SizedBox();
                      } else if (state is SuccessState) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              TOTALEXPANDED,
                              style: titelTextStyle,
                            ),
                            Text(
                              state.data.body.balance.toString(),
                              style: balanceTextStyle,
                            ),
                          ],
                        );
                      }
                      return const SizedBox();
                    },
                  ), lightGreenColor, darkGreenColor, () {}),
                  Padding(
                    padding: TopAndBottomPadding(0.03, 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          ALLVALIDCODE,
                          style: transectionTextStyle,
                        ),
                        Padding(
                          padding: onlyRightPadding(0.017),
                          child: const Text(SEEALL, style: seeAllTextStyle),
                        )
                      ],
                    ),
                  ),
                  BlocBuilder<WalletBloc, WalletState>(
                    builder: (context, state) {
                     if (state is LoadingState) {
                        return const CupertinoActivityIndicator(
                          color: white,
                        );
                      } else if (state is ErrorState) {
                        return Text(state.failure);
                      } else if (state is WalletInitial) {
                        return const SizedBox();
                      } else if (state is SuccessValidCodeState) {
                        return SizedBox(
                        width: double.infinity,
                        height: screenHight * 0.5,
                        child: ListView.builder(
                          itemCount: state.allvalidcodeModel.body.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: TopAndBottomPadding(0.01, 0.01),
                              height: screenHight * 0.08,
                              decoration: BoxDecoration(
                                border: Border.all(color: lightGreen),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ListTileCustom(
                                  true,
                                   Text(state.allvalidcodeModel.body[index].code,
                                      style: welltonTextStyle),
                                  buttonBlackTextStyle,
                                  Text(state.allvalidcodeModel.localDateTime.toString()),
                                 null,
                                  Padding(
                                    padding: onlyTopPadding(0.015),
                                    child:  Text(state.allvalidcodeModel.body[index].amount.toString(),
                                        style: welltonTextStyle),
                                  ),
                                  subtitleTextStyle,
                                  null),
                            );
                          },
                        ),
                      );
                     }return SizedBox();
                     }
                  ),
                ],
              ),
            ));
      }),
    );
  }
}
