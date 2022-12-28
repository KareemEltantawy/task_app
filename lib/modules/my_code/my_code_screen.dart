import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/shared/components/components.dart';
import 'package:task_app/shared/styles/colors.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class MyCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> TaskCubit()..getCodes(),
      child: BlocConsumer<TaskCubit,TaskStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.light,
                  statusBarColor: Colors.black
                ),
                backgroundColor: Colors.black,
              ),
              body: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(10.0),
                      topStart: Radius.circular(10.0),
                    )),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        Container(
                          width: 100.0,
                          height: 4.0,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(2.0)
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.switch_right,color: defaultColor,))
                          ],
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          'Scanning Result',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Prereader will keep your last 10 days history to keep your all scared history please purchased our pro package',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14.0, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        TaskCubit.get(context).myCodesModel != null
                            ? ListView.separated(
                          shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context,index) => buildItem(TaskCubit.get(context).myCodesModel!.data![index],context),
                                separatorBuilder: (context,index) => SizedBox(
                                  height: 15.0,
                                ),
                                itemCount: 10)
                            : Center(child: CircularProgressIndicator()),
                        SizedBox(
                          height: 20.0,
                        ),
                        defaultButton(function: (){}, text: 'Send')
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
  Widget buildItem(model,context) => Container(
    padding: EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: Colors.grey[300],
      borderRadius: BorderRadius.circular(4.0),
    ),
    child: Row(children: [
      Icon(Icons.file_present,color: defaultColor,),
      SizedBox(
        width: 20.0,
      ),
      Text(model.code!,style: Theme.of(context).textTheme.bodyText1,)
    ],),
  );
}
