import 'dart:async';
import 'dart:io';

int counter = 0;

main(List<String> arguments) async {

  /**
   * Section 2 - Futures, Duration, Timer
   *
   */

  //--------------------------------------------------------------------------

  /**
   * Assignment 2
   */

  //--------------------------------------------------------------------------

  /**
   * Section 2.7
   */
  /*Duration duration = new Duration(seconds: 1);
  Timer timer = new Timer.periodic(duration, timeout);
  print('Started ${getTime()}');*/

  //--------------------------------------------------------------------------

  /**
   * Section 2.8 - Future, then
   */
  /*String path = Directory.current.path + "/test.txt";
  print('Appending to ${path}');

  File file = new File(path);
  Future<RandomAccessFile> f = file.open(mode: FileMode.APPEND);
  f.then((RandomAccessFile raf) {
    print('File has been opened!');
    raf.writeString("Hello world").then((value) {
      print('File has been appended!');
    }).catchError(() => print("An error occured")).whenComplete(() => raf.close());
  });*/


  //--------------------------------------------------------------------------
  /**
   * Section 2.9 - Future, await
   */

  /*print("Starting");
  File file = await appendFile();
  print("File ${file.path}");
  print("Finished");*/

}

Future<File> appendFile() {
  File file = new File(Directory.current.path + '/test.txt');
  DateTime now = new DateTime.now();
  return file.writeAsString(now.toString() + '\r\n', mode: FileMode.APPEND);
}

void timeout(Timer timer) {
  print('Timeout: ${getTime()}');
  counter++;
  if (counter >= 5) timer.cancel();
}

String getTime() {
  DateTime dateTime = new DateTime.now();
  return dateTime.toString();
}
