abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {}

abstract class BaseViewModelInputs {
  void start();
  // body
  void dispose();
}

mixin BaseViewModelOutputs {
  // Add any output methods or properties if needed
}
