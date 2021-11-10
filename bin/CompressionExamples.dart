import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:archive/archive.dart';
import 'package:path/path.dart' as p;

main(List<String> arguments) async {

  /**
   * Section 3 - Compression
   *
   */

  //--------------------------------------------------------------------------

  /**
   * Assignment 3 - Compression
   */

  String data = '';
  for (int i = 0; i < 100; i++) {
    data = data + "Hello world\r\n";
  }
  print("Original data: \n ${data} \n");

  // Encode and write to file
  List original = utf8.encode(data);
  List compressed = GZIP.encode(original);
  print("Compressed data:\n ${compressed} \n");
  String path = Directory.current.path + "/test.txt";
  File f = new File(path);
  f.writeAsBytesSync(compressed);

  // Read and decode from file
  List decompress = GZIP.decode(f.readAsBytesSync());
  String decoded = utf8.decode(decompress);
  print("Decoded data: \n ${decoded}\n");

  //--------------------------------------------------------------------------

  /**
   * Section 3.11
   */
  /*String data = '';
  for (int i = 0; i < 100; i++) {
    data = data + "Hello world\r\n";
  }

  // OG data
  List original = utf8.encode(data);
  // Compress data
  List compressed = GZIP.encode(original);
  // Decompress
  List decompress = GZIP.decode(compressed);

  print("OG ${original.length} bytes");
  print("Compressed ${compressed.length} bytes");
  print("Decompressed ${decompress.length} bytes");

  String decoded = utf8.decode(decompress);
  assert(data == decoded);

  print(decoded);*/

  //--------------------------------------------------------------------------

  /**
   * Section 3.12
   */

  /*int zlib = testCompress(ZLIB);
  int gzip = testCompress(GZIP);

  print('zlib ${zlib}');
  print('gzip ${gzip}');*/

  //--------------------------------------------------------------------------

  /**
   * Section 3.13
   */

  // List files = new List<String>();
  // Directory.current.listSync().forEach((element) {
  //   if (element.statSync().type == FileSystemEntityType.FILE) files.add(element.path);
  // });
  // String zipFile = 'C:/Users/caleb5/Documents/test.zip';
  // zip(files, zipFile);
  // unzip(zipFile, 'C:/Users/caleb5/Documents/testDecompressed');
}


String generateData() {
  String data = '';
  for (int i = 0; i < 1000; i++) {
    data = data + "Hello world\r\n";
  }
  return data;
}

int testCompress(var codec) {
  String data = generateData();
  List original = utf8.encode(data);
  List compressed = codec.encode(original);
  List decompressed = codec.decode(compressed);

  print('Testing ${codec.toString()}');
  print('original ${original.length}');
  print('compressed ${compressed.length}');
  print('decompressed ${decompressed.length}');

  print('');

  String decoded = utf8.decode(decompressed);
  assert(data == decoded);

  return compressed.length;
}

void zip(List<String> files, String file) {
  Archive archive = new Archive();
  files.forEach((String element) {
    File file = new File(element);
    ArchiveFile archiveFile = new ArchiveFile(p.basename(element), file.lengthSync(), file.readAsBytesSync());
    archive.addFile(archiveFile);
  });

  ZipEncoder encoder = new ZipEncoder();
  File f = new File(file);
  f.writeAsBytesSync(encoder.encode(archive));

  print('Compressed');
}

void unzip(String zip, String path) {

  File file = new File(zip);
  Archive archive = ZipDecoder().decodeBytes(file.readAsBytesSync());
  archive.forEach((element) {
    File file = new File(path + '/' + element.name);
    file.createSync(recursive: true);
    file.writeAsBytesSync(element.content);
  });

  print('Decompressed');

}