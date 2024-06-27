import '../generator/flutter_app_generator.dart';
import '../models/models.dart';

class CommandRunner {
  static Future<void> run(CliOptions options) async {
    await FlutterAppGenerator.generate(options.project, options.features);
  }
}
