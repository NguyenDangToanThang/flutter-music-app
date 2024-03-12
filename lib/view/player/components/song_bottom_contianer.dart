import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music/bloc/home_bloc/home_bloc.dart';
import 'package:music/model/audio_file_model.dart';
import 'package:music/view/home/components/home_top_box.dart';

class SongBottomContainer extends StatelessWidget {
  const SongBottomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 320,
      decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(40)
      ),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {

            },
            child:  const Text('UP NEXT',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
          const Spacer(),
          Container(height: 20,width: 3,decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20)
          ),),
          const Spacer(),
          const Text('LYRICS',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
              fontSize: 12
          ),),
          const Spacer(),
          Container(height: 20,width: 3,decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20)
          ),),
          const Spacer(),
          const Text('RELATED',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
              fontSize: 12
          ),),
        ],
      ),
    );
  }
}
