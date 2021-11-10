import 'dart:io';
import 'dart:convert';

main(List<String> arguments) {

  /**
   * Section 1 - Platform
   *
   */

  //--------------------------------------------------------------------------

  /**
   * Assignment 1
   */
  print('OS: ${Platform.operatingSystem} ${Platform.version}');
  Map env = Platform.environment;
  print('PATH = ${env["PATH"]}');


  //--------------------------------------------------------------------------

  /**
   * Section 1.3
   */
  /*print('OS: ${Platform.operatingSystem} ${Platform.version}');

  if(Platform.isLinux) {
    print('Run linux code');
  } else {
    print('run normal code');
  }

  print('Path: ${Platform.script.path}');
  print('dart: ${Platform.executable}');

  print('Env:');
  Platform.environment.keys.forEach((key) {
    print('${key} ${Platform.environment[key]}');
  });*/

  //--------------------------------------------------------------------------

  /**
   * Section 1.4
   * Running notepad
   */
  /*Process.run('notepad', []).then((ProcessResult results) {
    print(results.stdout);
    print('Exit code:  $results.exitCode}');
  });*/

  //--------------------------------------------------------------------------

  /**
   * Section 1.5
   * Communicating with processes
   */
  /* Process.start('notepad', []).then((Process process) {
    process.stdout.transform(Utf8Decoder()).listen((data) {print(data);});
    process.stdin.writeln('Hello world');
    Process.killPid(process.pid);
    process.exitCode.then((int code) {
      print('Exit code: ${code}');
      exit(0);
    });
  });*/
}
