// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/hive_config.dart';
import '../../../config/responsive.dart';
import '../../../core/resources/assets.dart';
import '../../../core/resources/color.dart';
import '../../../core/resources/padding.dart';
import '../../../core/resources/string.dart';
import '../../../core/resources/style.dart';
import '../../../core/resources/variable.dart';
import '../../../core/widgets_App/drawer_widget.dart';
import '../../../core/widgets_App/listTile_widget.dart';
import '../bloc/favourite_bloc.dart';

class FavoriteScreen extends StatelessWidget {
  int id;
  int bicycleId;
  FavoriteScreen({
    Key? key,
    required this.id,
    required this.bicycleId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FavouriteBloc()..add(GetFavouriteItemEvent(bicyleId: bicycleId)),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: white,
          drawer: (isGoogle == true)
              ? DrawerCustom(
                  user.currentUser!.displayName!,
                  user.currentUser!.email,
                  NetworkImage(user.currentUser!.photoUrl),
                  () {},
                  () {}, () {
                  Navigator.pushNamed(context, '/HelpandsupportScreen');
                }, () {
                  Navigator.pushNamed(context, '/AboutusScreen');
                }, () {
                  Navigator.pushNamed(context, '/Setting');
                }, () {
                  Navigator.pushNamed(context, '/HelpandsupportScreen');
                }, () async {
                  userHive!.delete("token");
                  if (isGoogle == true) {
                    await user.disconnect();
                  }

                  Navigator.pushNamed(context, '/Register');
                })
              : DrawerCustom('user Name', 'userEmail@gmail.com',
                  const AssetImage(boyImage), () {}, () {}, () {
                  Navigator.pushNamed(context, '/HelpandsupportScreen');
                }, () {
                  Navigator.pushNamed(context, '/AboutusScreen');
                }, () {
                  Navigator.pushNamed(context, '/Setting');
                }, () {
                  Navigator.pushNamed(context, '/HelpandsupportScreen');
                }, () async {
                  userHive!.delete("token");
                  Navigator.pushNamed(context, '/Register');
                }),
          body: Padding(
            padding: leftAndRightAndTopPadding(0.02, 0.02, 0.04),
            child: ListView(
              children: [
                Row(
                  children: [
                    Builder(
                      builder: (context) {
                        return IconButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          style: IconButton.styleFrom(
                            backgroundColor: lightGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          icon: const Icon(
                            Icons.format_align_justify,
                            size: 18,
                            color: black,
                          ),
                        );
                      },
                    ),
                    const Spacer(),
                    Padding(
                      padding: leftAndRightPadding(0.01, 0.03),
                      child: const Text(
                        Favourite,
                        style: titel,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                Container(
                    margin: onlyTopPadding(0.024),
                    width: double.infinity,
                    height: screenHight * 0.783,
                    child: BlocBuilder<FavouriteBloc, FavouriteState>(
                        builder: (context, state) {
                      if (state is LoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is ErrorState) {
                        return const Text("there is an Error");
                      } else if (state is SuccessState) {
                        return ListView.builder(
                          itemCount: state.data.body.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: TopAndBottomPadding(0.005, 0.015),
                              height: screenHight * 0.08,
                              decoration: BoxDecoration(
                                border: Border.all(color: lightGreen),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ListTileCustom(
                                  true,
                                  Text(state.data.body[index].bicycle.type),
                                  buttonBlackTextStyle,
                                  Padding(
                                    padding: onlyTopPadding(0.01),
                                    child: Row(
                                      children: [
                                        Text(state.data.body[index].bicycle
                                            .modelPrice.model),
                                        Text("    ||    "),
                                        Text(state.data.body[index].bicycle
                                            .modelPrice.price
                                            .toString()),
                                        Text(" \$    ||   size:"),
                                        Text(state.data.body[index].bicycle.size
                                            .toString())
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: screenWidth * 0.1,
                                    height: screenHight * 0.05,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: lightGreen1),
                                    child: Center(
                                      child: Text(
                                        state.data.body[index].bicycle.id
                                            .toString(),
                                        style: welltonTextStyle,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: onlyTopPadding(0.01),
                                    child: InkWell(
                                      onTap: () {},
                                      child: const Icon(
                                        size: 18,
                                        Icons.remove_circle_outlined,
                                        color: darkRedColor,
                                      ),
                                    ),
                                  ),
                                  subtitleTextStyle,
                                  null),
                            );
                          },
                        );
                      }
                      return const SizedBox();
                    })),
              ],
            ),
          ),
        );
      }),
    );
  }
}
