import '../models/slider.dart';

class SliderController {
  List<Slider> _sliders = [
    Slider(
      imageUrl: 'assets/images/paper.png',
      description:
          'With this application you can manage your expenses simpler and easier than ever! You can create an account in which you will have the history of your expenses accompanied by statistics related to them. You can also write notes about your expenses. All this will be saved in your account, so you do not have to worry if you change your device.',
      title: 'Welcome to Paper.',
    ),
    Slider(
      imageUrl: 'assets/images/expense.png',
      description:
          'You can add, delete and modify expenses. These are divided into several categories to make it easier for you to view and organize them. The interface is simple and intuitive to make it as convenient as possible for you to use it.',
      title: 'Add, modify or delete',
    ),
    Slider(
      imageUrl: 'assets/images/stats.png',
      description:
          'You can see statistics about expenses and write notes about them. The application has two charts in which you can see statistics related to each expense category. They will be automatically updated each time an expense is added, deleted or modified. You can also take notes on each expense and more.',
      title: 'See your stats and take notes',
    ),
  ];

  List<Slider> get sliders {
    return _sliders;
  }

  int get length {
    return _sliders.length;
  }
}
