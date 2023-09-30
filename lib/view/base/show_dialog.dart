import 'package:flutter/material.dart';

class ShowCustomDialog extends StatefulWidget {
  final String title;
  final String description;
  final String textAgree;
  final String desAgree;
  final Function ok;
  final Function failed;
  ShowCustomDialog({Key key, this.title, this.textAgree, this.desAgree, this.ok,  this.failed, this.description}) : super(key: key);



  @override
  State<ShowCustomDialog> createState() => _ShowCustomDialogState();
}

class _ShowCustomDialogState extends State<ShowCustomDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          width: MediaQuery.of(context).size.width * .8,
          margin: EdgeInsets.only(top: 12),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 24,
              ),
               Text(
            widget.title??'',
                textAlign: TextAlign.center,
                style:const TextStyle(
                  color: Color(0xFF1C1C1C),
                  fontSize: 15,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  widget.description??'',                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF6F6F6F),
                    fontSize: 12,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .8,
                height: 1,
                color: Color(0x1E212121),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment:
                MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: widget.ok,
                    child: Container(
                      alignment: Alignment.center,
                      height: 42,
                      width: MediaQuery.of(context).size.width *
                          .25,
                      child:  Text(
                          widget.textAgree??'',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFE25440),
                          fontSize: 15,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding:
                    EdgeInsets.symmetric(vertical: 8),
                    width: 1,
                    height: 42,
                    color: Color(0x1E212121),
                  ),
                  InkWell(
                    onTap: widget.failed,
                    child: Container(
                      height: 42,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width *
                          .25,
                      child:  Text(
                       widget.desAgree,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF1C1C1C),
                          fontSize: 15,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
