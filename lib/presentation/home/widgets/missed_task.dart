
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/data/models/task.dart';
import 'package:todo/presentation/home/widgets/task.dart';

import '../../../core/configs/colors/app_colors.dart';
import '../../../core/configs/constants/priority.dart';
import '../bloc/home_bloc.dart';

class MissedTasksWiget extends StatelessWidget {
  const MissedTasksWiget({super.key,required this.list});

  final List<TaskModel> list;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text("Missed",style: TextStyle(fontSize:22,fontWeight: FontWeight.bold),),
        const SizedBox(height: 10,),
        ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
              var task=list[index];
              return Dismissible(
                key: Key(task.id),
                onDismissed: (direction){
                  if(direction==DismissDirection.endToStart){
                    context.read<HomeBloc>().add(DeleteTask(id: task.id));
                  }
                },
                direction: DismissDirection.endToStart,
                background: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle),
                      child: Icon(CupertinoIcons.delete,color: Colors.white,),
                    ),
                  ],
                ),
                child: Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [

                            const SizedBox(width: 10,),
                            const SizedBox(width: 20,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(task.title,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                const SizedBox(height: 5,),
                                Text('${formatDateString(task.date)}, ${task.time}',style: TextStyle(fontSize: 16,color: Colors.grey.shade600),)
                              ],
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                          decoration: BoxDecoration(
                              color: task.priority==Priority.high?Colors.red:
                              task.priority==Priority.medium?Colors.yellow:Colors.blueAccent,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text(task.priority,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                        )


                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context,index)=>SizedBox(height: 10,),
            itemCount: list.length),
        const SizedBox(height: 20,),
      ],
    );
  }

  String formatDateString(String date) {
    try {

      final parts = date.split(' ');


      final datePart = parts[0].split('/');



      final day = int.parse(datePart[0]);
      final month = int.parse(datePart[1]);


      const monthNames = [
        'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

      return '$day ${monthNames[month - 1]}';
    } catch (e) {
      debugPrint('Error formatting date: $e');
      return date;
    }
  }
}
