import 'package:ExpensesApp/screens/getting_started_screen.dart';

import '../models/slider.dart';

class SliderController {
  List<Slider> _sliders = [
    Slider(
      imageUrl: 'assets/images/image1.jpg',
      description: 'Asdfsfasf asdfsadfasdfassdfsdfg sdfsdfdsfsd fsdf asdf asdf sadfsadf asf asdf asdf asdf asd fasd fasdf asd asdafasdfasdfsad fasd fasdf asdf asdf ds fasdffffdsssssssssssf sdfasdf saf asdf ',
      title: 'This is the Title',
    ),
    Slider(
      imageUrl: 'assets/images/image1.jpg',
      description: 'Asdfsfasf asdfsadfasdfassdfsdfg sdfsdfdsfsd fsdf asdf asdf sadfsadf asf asdf asdf asdf asd fasd fasdf asd asdafasdfasdfsad fasd fasdf asdf asdf ds fasdffffdsssssssssssf sdfasdf saf asdf ',
      title: 'This is the Title2',
    ),
    Slider(
      imageUrl: 'assets/images/image1.jpg',
      description: 'Asdfsfasf asdfsadfasdfassdfsdfg sdfsdfdsfsd fsdf asdf asdf sadfsadf asf asdf asdf asdf asd fasd fasdf asd asdafasdfasdfsad fasd fasdf asdf asdf ds fasdffffdsssssssssssf sdfasdf saf asdf ',
      title: 'This is the Title3',
    ),
  ];

  List<Slider> get sliders {
    return _sliders;
  }

  int get length {
    return _sliders.length;
  }
}
