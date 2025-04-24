import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/color.dart';
import '../../../../core/resources/padding.dart';
import '../../../../core/resources/string.dart';
import '../../../../core/resources/style.dart';
import '../../../../injection_container.dart';
import '../bloc/bloc.dart';
import '../bloc/events.dart';
import '../bloc/states.dart';


class PolicyScreen extends StatelessWidget {
  const PolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingBloc>(
      create: (context) => sl()..add(GetPolicyEvent()),
      child: Scaffold(
        backgroundColor: white,
        body: Padding(
          padding: leftAndRightAndTopPadding(0.03, 0.03, 0.02),
          child: ListView(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                  const Text(back),
                  // Padding(
                  //   padding: onlyLeftPadding(0.17),
                  //   child: const Text(
                  //     PRAVACYPOLICY,
                  //     style: titel,
                  //   ),
                  // ),
                ],
              ),
               BlocBuilder<SettingBloc, SettingState>(
                      builder: (context, state) {
                        if (state is LoadingState) {
                          return const Center(
                            child:  CupertinoActivityIndicator(
                              color: lightGreen,
                            ),
                          );
                        } else if (state is ErrorState) {
                          return Text(state.failure);
                        } else if (state is SettingInitial) {
                          return const SizedBox();
                        } else if (state is SuccessState) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: topAndBottomPadding(0.03, 0.03),
                                child: Text(
                                  state.data.body.title,
                                  style: titel,
                                ),
                              ),
                              Padding(
                                padding: leftAndRightPadding(0.02, 0.02),
                                child: Text(
                                  state.data.body.description,
                                  style: titelTextStyle,
                                ),
                              ),
                              
                            ],
                          );
                        }
                        return const SizedBox();
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }
}
