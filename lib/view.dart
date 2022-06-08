import 'package:bottom_tap_bar/elec.dart';
import 'package:bottom_tap_bar/metal.dart';
import 'package:bottom_tap_bar/paper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit.dart';

class BottomTapBar extends StatelessWidget {
  const BottomTapBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ChangeBottomTabBarCubit>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(150.0),
          child: Container(
            height: 150.0,
            color: const Color.fromARGB(255, 206, 195, 194),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Container(
                    height: 70.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Minimum points',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          cubit.selectPaper();
                        },
                        child: Container(
                          height: 70.0,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child:const Center(
                            child:  Text(
                              'Paper',
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          cubit.selectMetals();
                        },
                        child: Container(
                          height: 70.0,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child:const Center(
                            child:  Text(
                              'metals',
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          cubit.selectElec();
                        },
                        child: Container(
                          height: 70.0,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child:const Center(
                            child:  Text(
                              'elec',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<ChangeBottomTabBarCubit,BottomTapBarState>(builder: (context,state){
        if(state is InitialState) {
          return const Paper();
        }
        if(state is ChangeBottomTabBarState) {
          if(state.elec == true ){
            return const Elec();
          } else if(state.metal == true) {
            return const Metal();
          } else if(state.paper == true) {
            return const Paper();
          }
        }
        return const SizedBox();
      },),
    );
  }
}
