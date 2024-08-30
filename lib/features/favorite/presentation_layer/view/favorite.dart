
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/responsive.dart';
import '../../../../core/resources/color.dart';
import '../../../../core/resources/padding.dart';
import '../../../../core/resources/string.dart';
import '../../../../core/resources/style.dart';
import '../../../../core/widgets_App/listTile_widget.dart';
import '../../../../injection_container.dart';
import '../bloc/bloc.dart';
import '../bloc/events.dart';
import '../bloc/states.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavouriteBloc>(
      create: (context) => sl()..add(GetFavorite()),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: white,
          // drawer: (isGoogle == true)
          //     ? DrawerCustom(
          //     user.currentUser!.displayName!,
          //     user.currentUser!.email,
          //     NetworkImage(user.currentUser!.photoUrl),
          //         () {},
          //         () {}, () {
          //   Navigator.pushNamed(context, '/HelpandsupportScreen');
          // }, () {
          //   Navigator.pushNamed(context, '/AboutusScreen');
          // }, () {
          //   Navigator.pushNamed(context, '/Setting');
          // }, () {
          //   Navigator.pushNamed(context, '/HelpandsupportScreen');
          // }, () async {
          //   userHive!.delete("token");
          //   if (isGoogle == true) {
          //     await user.disconnect();
          //   }
          //
          //   Navigator.pushNamed(context, '/Register');
          // })
          //     : DrawerCustom('user Name', 'userEmail@gmail.com',
          //     const AssetImage(boyImage), () {}, () {}, () {
          //       Navigator.pushNamed(context, '/HelpandsupportScreen');
          //     }, () {
          //       Navigator.pushNamed(context, '/AboutusScreen');
          //     }, () {
          //       Navigator.pushNamed(context, '/Setting');
          //     }, () {
          //       Navigator.pushNamed(context, '/HelpandsupportScreen');
          //     }, () async {
          //       userHive!.delete("token");
          //       Navigator.pushNamed(context, '/Register');
          //     }),
          body: Padding(
            padding: onlyTopPadding(0.06),
            child: ListView(
              children: [
                Row(
                  children: [

                    const Spacer(),
                    Padding(
                      padding: leftAndRightAndTBottomPadding(0.01, 0.03,0.02),
                      child: const Text(
                        Favourite,
                        style: titel,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                Container(
                    margin: onlyTopPadding(0.01),
                    width: double.infinity,
                    height: screenHight * 0.8,
                    child: BlocBuilder<FavouriteBloc, FavouriteState>(
                        builder: (context, state) {
                          if (state is LoadingState) {
                            return Center(child: CupertinoActivityIndicator(color: lightGreen,));
                          } else if (state is ErrorState) {
                            return Text(state.failure);
                          } else if (state is SuccessState) {
                            return ListView.builder(
                              itemCount: state.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    ListTileCustom(
                                        // true,
                                        Text(state.data[index].bicycle.type),
                                        buttonBlackTextStyle,
                                        Padding(
                                          padding: onlyTopPadding(0.0),
                                          child: Row(
                                            children: [
                                              Text("model : ",style: TextStyle(color: black.withOpacity(0.6)),),
                                              Text(state.data[index].bicycle.modelPrice.model),
                                              Text("  |  price : ",style: TextStyle(color: black.withOpacity(0.6)),),
                                              Text(state.data[index].bicycle.modelPrice.price.toString()+' \sp'),
                                              Text("  |  size: ",style: TextStyle(color: black.withOpacity(0.6)),),
                                              Text(state.data[index].bicycle.size
                                                  .toString())
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: screenWidth * 0.1,
                                          height: screenHight * 0.046,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(100),
                                              color: lightGreen1),
                                          child: Center(
                                            child: Text(
                                              state.data[index].bicycle.id
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
                                              size: 20,
                                              Icons.delete,
                                              color: darkRedColor,
                                            ),
                                          ),
                                        ),
                                        subtitleTextStyle,
                                        null),
                                    Divider(color: black, thickness: 0.1,)

                                  ],
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
