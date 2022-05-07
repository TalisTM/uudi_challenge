import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {

  final String title;
  final String? subTitle;
  final String? primarylabel;
  final String? secundaryLabel;
  final VoidCallback? primaryFunc;
  final VoidCallback? secundaryFunc;

  const DialogWidget({
    Key? key,
    required this.title,
    this.subTitle,
    this.primarylabel,
    this.secundaryLabel,
    this.primaryFunc,
    this.secundaryFunc
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text(
          title, 
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xFF00bee0),
            fontSize: 24 
          )
        ),
        content: subTitle != null
          ? Text(subTitle!, style: const TextStyle(fontSize: 20))
          : null,
        actions: [
          Column(
            children: [
              if(secundaryLabel != null)
                TextButton(
                  child: Text(
                    secundaryLabel!,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF00bee0),
                      fontWeight: FontWeight.w500
                    )
                  ),
                  onPressed: secundaryFunc
                ),
              if(primarylabel != null)
                TextButton(
                  child: Text(
                    primarylabel!,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF00bee0),
                      fontWeight: FontWeight.w500
                    )
                  ),
                  onPressed: primaryFunc
                )
            ],
          )
        ],
      ),
    );
            
  }
}