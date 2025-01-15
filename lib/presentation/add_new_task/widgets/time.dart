import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/presentation/add_new_task/bloc/add_task_bloc.dart';

class TimeWidget extends StatelessWidget {
  TimeWidget({super.key,required this.selectedTime});
  final TimeOfDay? selectedTime;
  final TimeOfDay currentTime= TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Time",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
        GestureDetector(
          onTap: ()=>SelectTime(context),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            width: 150,
            decoration: BoxDecoration(
                color: const Color(0xfff5f7fe),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.grey, // Border color
                  width: 1.0, // Border width
                )
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(selectedTime==null?
                  currentTime.format(context):selectedTime!.format(context),
                  style: const TextStyle(fontSize: 18),),
                  const SizedBox(width: 20,),
                  const Icon(Icons.watch_later_outlined,color: Colors.grey,)
                ]
            ),
          ),
        )
      ],
    );
  }


Future<void> SelectTime(BuildContext context) async {
  final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime?? currentTime);
  if (picked != null) {
    context.read<AddTaskBloc>().add(ChangeTime(time: picked));
  }
}
}
