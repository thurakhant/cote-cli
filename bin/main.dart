import 'package:cote_cli/cli/cli_parser.dart';
import 'package:cote_cli/cli/command_runner.dart';

Future<void> main(List<String> arguments) async {
  try {
    var options = CliParser.parse(arguments);
    await CommandRunner.run(options);
  } catch (e) {
    print('Error: ${e.toString()}');
  }
}
