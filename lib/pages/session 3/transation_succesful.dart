import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionSucces extends StatelessWidget {
   static const routeName = '/transaction_succes';
  const TransactionSucces({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children:[
                    SizedBox(height: 190),
                 Container(
                  alignment: Alignment.center,
                width: 125, // Ширина контейнера для изображений
                height: 125, // Высота контейнера для изображений
                child: AnimatedSvg(),
                ),
                Padding(padding: EdgeInsets.only(top: 45),
                child: Column(
                   
                  children: 
                [
                Container(
                
             child: Text(
                'Transation Successful',

                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                'Your rider is on the way to your destination',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                Text(
                  'Tracking Number ',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                 Text(
                  'R-7458-4567-4434-5854',
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Color.fromRGBO(5, 96, 250, 1)),
                ),]
              )
              ],
            ),
          ],
                ),),
                  ]),)
                  ],
                ),
              ),
    );
        
      
       
   
  }
}
class AnimatedSvg extends StatefulWidget {
  @override
  _AnimatedSvgState createState() => _AnimatedSvgState();
}

class _AnimatedSvgState extends State<AnimatedSvg>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
    
      animation: _controller,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Stack(
            children: [
              // Внешний контур
              Positioned.fill(
                 child: Transform.scale(
                scale: _isExpanded ? 0.5 : 1.1,
                child: SvgPicture.asset(
                  'assets/images/elipse.svg',
                  fit: BoxFit.contain,
                ),
                 ),
              ),
              // Внутренний контур, анимированный
              Positioned.fill(
                child: Transform.scale(
                  scale: _isExpanded
                      ? 1 + _controller.value * 0.2
                      : 1 - _controller.value * 0.5,
                  child: SvgPicture.asset(
                    'assets/images/check.svg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}