import 'package:flutter/material.dart';
import 'package:trestest/funcs.dart';

import 'custom_button.dart';

class ResultView extends StatelessWidget {
  final ResultData? resultData;
  const ResultView({Key? key, this.resultData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.more_horiz_outlined,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        resultData!.url!,
                        height: 150,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      height: 150,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Transform.translate(
                          offset: const Offset(0, 10),
                          child: const CustomButton(
                            iconData: Icons.favorite,
                            size: 38,
                            color: Color.fromARGB(255, 238, 127, 61),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Text(
                  resultData!.title!,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
