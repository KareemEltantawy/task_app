import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:task_app/modules/my_code/my_code_screen.dart';
import 'package:task_app/modules/scan/cubit/states.dart';
import 'package:task_app/shared/components/components.dart';
import 'package:task_app/shared/styles/colors.dart';
import 'cubit/cubit.dart';

class ScanScreen extends StatelessWidget {
  final GlobalKey globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> TaskkCubit(),
      child: BlocConsumer<TaskkCubit,TaskkStates>(
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
                                  navigateTo(context, MyCodeScreen());
                                },
                                icon: Icon(Icons.file_present,color: defaultColor,))
                          ],
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          'Scann QR code',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Place qr code inside that frame to scan phases acvoid shake to get results quickly',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14.0, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Container(
                          height: 250.0,
                          width: 250.0,
                          child: QRView(
                              key: globalKey,
                              onQRViewCreated: TaskkCubit.get(context).qr),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TaskkCubit.get(context).result != null ? Text('${TaskkCubit.get(context).result!.code}',
                          style: Theme.of(context).textTheme.bodyText1,
                        ) : Text('Scanning Code ....',
                        style: Theme.of(context).textTheme.bodyText1,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment:MainAxisAlignment.center ,
                          children: [
                            Icon(Icons.image),
                            Icon(Icons.power_input_sharp),
                            Icon(Icons.flash_on),

                        ],),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultButton(function: (){
                          TaskkCubit.get(context).sendScan('${TaskkCubit.get(context).result!.code}');

                        }, text: 'place Camera Code')
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
