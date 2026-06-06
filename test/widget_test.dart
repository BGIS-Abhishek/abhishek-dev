import 'package:flutter_test/flutter_test.dart';
import 'package:abhishek_dev/main.dart';
import 'package:visibility_detector/visibility_detector.dart';

void main() {
  testWidgets('Portfolio app structure smoke test', (WidgetTester tester) async {
    VisibilityDetectorController.instance.updateInterval = Duration.zero;

    await tester.pumpWidget(const PortfolioApp());
    await tester.pump();

    expect(find.text('MUMBAI, INDIA'), findsOneWidget);
  });
}
