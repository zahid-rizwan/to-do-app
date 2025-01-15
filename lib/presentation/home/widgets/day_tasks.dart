
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/data/models/task.dart';
import 'package:todo/presentation/home/widgets/task.dart';

class DayTasksWiget extends StatelessWidget {
  const DayTasksWiget({super.key,required this.list,required this.title});

 final List<TaskModel> list;
 final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
       Text(title,style: const TextStyle(fontSize:22,fontWeight: FontWeight.bold),),
        const SizedBox(height: 10,),
        ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
              return TaskWidget(task: list[index],);
            },
            separatorBuilder: (context,index)=>SizedBox(height: 10,),
            itemCount: list.length),
        const SizedBox(height: 20,),
      ],
    );
  }
}
