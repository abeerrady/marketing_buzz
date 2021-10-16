import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/style/constants.dart';
import 'package:marketing_buzz/views/address_Card/widgets/address_card.dart';
import 'package:marketing_buzz/views/payment/cubits/cubit.dart';
import 'package:marketing_buzz/views/payment/cubits/states.dart';
import 'package:marketing_buzz/widgets/my_app_bar.dart';

class PaymentView extends StatefulWidget {
  final double total;

  const PaymentView({Key key, this.total}) : super(key: key);
  @override
  _PaymentViewState createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  int valueSelected ;

  @override
  void initState() {
    super.initState();
    valueSelected=0;
  }
  setSelectedColorRadio(int val) {
    setState(() {
      valueSelected = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>CheckOutController(),
      child: BlocBuilder<CheckOutController , CheckOutStates>(
        builder: (context,state){
         final controller = CheckOutController.of(context);
          return  Scaffold(
            appBar: MyAppBar(text: 'Payment'),
            body: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        Row(
                          children: [
                            Text(
                              'Your Address',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20),
                            ),
                            DropdownMenuItem(child: Icon(Icons.keyboard_arrow_down)),
                          ],
                        ),
                        AddressCard(address:controller.address , isEditable: false ,),
                        // Container(
                        //   width: MediaQuery.of(context).size.width,
                        //   height: 200,
                        //   color: Colors.grey[200],
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(20.0),
                        //     child: Column(
                        //       mainAxisAlignment: MainAxisAlignment.start,
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Text(
                        //           'Your Address',
                        //           style: TextStyle(
                        //               color: Colors.black,
                        //               fontWeight: FontWeight.w600,
                        //               fontSize: 20),
                        //         ),
                        //         SizedBox(
                        //           height: 30,
                        //         ),
                        //         Center(
                        //             child: TextButton(
                        //               onPressed: () {},
                        //               child: Text(
                        //                 'choose your address...',
                        //                 style: TextStyle(color: defaultColor, fontSize: 20),
                        //               ),
                        //             ))
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Payment Through',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 22),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RadioListTile(
                          value: 1,
                          groupValue: valueSelected,
                          title: Text('Debit/Credit card' , style: TextStyle(color: Colors.black , fontSize: 20),),
                          onChanged: (val) {
                            setSelectedColorRadio(val);
                          },
                          activeColor: defaultColor,
                        ),
                        RadioListTile(
                          value: 2,
                          groupValue: valueSelected,
                          activeColor: defaultColor,
                          title: Text('Cash' , style: TextStyle(color: Colors.black , fontSize: 20)),
                          onChanged: (value) {
                            setSelectedColorRadio(value);
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Payment Summary',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 22),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('TOTAL' , style: TextStyle(color: Colors.black , fontSize: 22),),
                              Text(widget.total.toString() , style: TextStyle(color: Colors.black , fontSize: 22),),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width-40,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: defaultColor
                    ),
                    child: Center(child: Text('CheckOut' , style: TextStyle(color: Colors.white , fontSize: 25),),),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
