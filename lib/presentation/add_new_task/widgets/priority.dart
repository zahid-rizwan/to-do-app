import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/common/widgets/buttons/basic_app_button.dart';
import 'package:todo/presentation/add_new_task/bloc/add_task_bloc.dart';

import '../../../core/configs/constants/priority.dart';

class PriorityWidget extends StatelessWidget {
  const PriorityWidget({super.key, required this.selectedValue});
final String selectedValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Priority",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
          const SizedBox(height: 5,width: double.infinity,),
          DropdownButton(
            value: selectedValue,
              items: const [
                DropdownMenuItem(
                    value: Priority.low,
                    child: Text("Low")),
                DropdownMenuItem(
                    value: Priority.medium,
                    child: Text("Medium")),
                DropdownMenuItem(
                    value:Priority.high,
                    child: Text("High"))
              ],
              onChanged: (value){
              context.read<AddTaskBloc>().add(ChangePriority(priority: value!));
              })
        ],
      ),
    );
  }
}
