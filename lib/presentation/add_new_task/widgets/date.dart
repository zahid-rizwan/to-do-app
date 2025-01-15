import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/presentation/add_new_task/bloc/add_task_bloc.dart';

class DateWidget extends StatelessWidget {
  DateWidget({super.key,required this.selectedDate});
  final DateTime? selectedDate;
  final DateTime currentDate=DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(" Date",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
        GestureDetector(
          onTap: ()=>SelectDate(context),
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
                  Text(selectedDate==null?
                  "${currentDate.day}/${currentDate.month}/${currentDate.year}":
                    "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                    style: const TextStyle(fontSize: 18),),
                  const SizedBox(width: 20,),
                  const Icon(Icons.calendar_month,color: Colors.grey,)
                ]
            ),
          ),
        )
      ],
    );
  }

  Future<void> SelectDate(BuildContext context)async{
    final DateTime? picked=await showDatePicker(
        context: context,
        initialDate: selectedDate?? currentDate,
        firstDate: DateTime(2025),
        lastDate: DateTime(2026));
    if(picked!=null){

      context.read<AddTaskBloc>().add(ChangeDate(date: picked));

    }
  }
}
