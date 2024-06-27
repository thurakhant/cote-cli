import 'package:args/args.dart';

import '../models/models.dart';

class CliParser {
  static CliOptions parse(List<String> arguments) {
    var parser = ArgParser()
      ..addOption('project', abbr: 'p', help: 'Name of the Flutter project')
      ..addMultiOption('features',
          abbr: 'f',
          help: 'Features to include in the project like auth, home');

    var result = parser.parse(arguments);
    return CliOptions(
      project: result['project'] as String,
      features: List<String>.from(result['features']),
    );
  }
}
