import 'package:seven_pay/app_config.dart';
import 'package:seven_pay/main.dart';

void main() {
  initializeMain(
    const AppConfig(
      appName: '7Pay Development',
      flavor: Flavor.DEVELOPMENT,
    ),
  );
}
