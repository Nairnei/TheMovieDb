///if you need a PageController, you need implement init and dispose to
///not create abandoned garbage generated by stream
abstract class InterfacePageController {
  ///init page controller, used when init widget happened
  void init();

  ///dispose page controller, used when dispose widget happened
  void dispose();
}
