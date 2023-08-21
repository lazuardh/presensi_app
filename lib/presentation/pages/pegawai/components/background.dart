import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Positioned(
          //   top: 0,
          //   left: 0,
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(
          //       vertical: size.height * 0.05,
          //       horizontal: 10,
          //     ),
          //     child: const Icon(
          //       Icons.document_scanner_outlined,
          //       size: 40,
          //       color: lightPurple,
          //     ),
          //   ),
          // ),
          // Positioned(
          //   top: 5,
          //   left: 45,
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(
          //       vertical: size.height * 0.05,
          //       horizontal: 10,
          //     ),
          //     child: Text(
          //       "ADD PEGAWAI",
          //       style: text1(
          //         dark,
          //         semibold,
          //       ),
          //     ),
          //   ),
          // ),
          child
        ],
      ),
    );
  }
}
