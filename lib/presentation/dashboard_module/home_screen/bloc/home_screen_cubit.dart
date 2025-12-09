import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_screen_cubit.freezed.dart';
part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  late final PaymentProcessor _paymentProcessor;

  HomeScreenCubit({
    required PaymentProcessor paymentProcessor,
  }) : super(const HomeScreenState.initial()) {
    _paymentProcessor = paymentProcessor;
  }

  void runPayment(double amount) {
    _paymentProcessor.processPayment(amount);
  }
}

// Use interface when you have multiple versions
abstract class PaymentProcessor {
  Future<void> processPayment(double amount);
}

class StripePaymentProcessor implements PaymentProcessor {
  @override
  Future<void> processPayment(double amount) async {
    // INSERT_YOUR_CODE
    print('Processing payment of \$${amount.toStringAsFixed(2)} with Stripe');
  }
}

class PayPalPaymentProcessor implements PaymentProcessor {
  @override
  Future<void> processPayment(double amount) async {
    print('Processing payment of \$${amount.toStringAsFixed(2)} with PayPal');
  }
}
