import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fospresence/config/routes/route_name.dart';
import 'package:fospresence/core/constants/colors.dart';
import 'package:fospresence/features/event/presentation/bloc/event/event_bloc.dart';
import 'package:fospresence/features/event/presentation/widgets/home/event_list_view.dart';
import 'package:fospresence/features/event/presentation/widgets/home/search.dart';

import '../../../../core/commons/widgets/background_w_logo.dart';
import '../widgets/home/sliver_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) =>
                    [const HomeSliverAppBar()],
            body: const Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                BackgroundWithLogo(),
                Column(children: [
                  SizedBox(height: 20),
                  HomeSearch(),
                  SizedBox(height: 20),
                  EventListView(),
                ])
              ],
            ),
          ),
          _buildFloatingActionButton(context)
        ],
      ),
    );
  }

  Positioned _buildFloatingActionButton(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 20,
      child: BlocBuilder<EventBloc, EventState>(
        bloc: BlocProvider.of<EventBloc>(context),
        builder: (context, state) {
          return FloatingActionButton(
            onPressed: state.isLoading
                ? () {}
                : () => Navigator.pushNamed(context, RouteName.addEventScreen),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 0.3),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: primaryGradientColor),
              ),
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
