import 'dart:convert';
import 'dart:typed_data';
import 'package:pointycastle/pointycastle.dart';
import 'dart:math';

main(List<String> arguments) async {

  /**
   * Section 4 - Encryption
   *
   * AES - symmetrical cipher - both sides line up , single key
   * RSA - asymetric - public and private key
   * Padding
   * Digest - one way hash - examine data, set of numbers based on data - determining if data has changed
   */

  //--------------------------------------------------------------------------

  /**
   * Assignment 4
   */

  final keyBytes = randomBytes(16);
  final key = new KeyParameter(keyBytes);
  final iv = randomBytes(8);
  final params = new ParametersWithIV(key, iv);
  StreamCipher cipher = new StreamCipher("Salsa20");
  cipher.init(true, params);

  Uint8List text = createIint8ListFromString("Hello world");
  Uint8List encryptedData = cipher.process(text);

  cipher.reset();
  cipher.init(false, params);

  Uint8List decryptedData = cipher.process(encryptedData);

  Digest digest = new Digest("SHA-256");
  assert(base64.encode(digest.process(text)) == base64.encode(digest.process(decryptedData)));

  print("It works");

  //--------------------------------------------------------------------------

  /**
   * Section 4.15 - Hashes
   */

  /*Digest digest = new Digest("SHA-256");
  String value = 'Hello world';
  Uint8List data = new Uint8List.fromList(utf8.encode(value));
  Uint8List hash = digest.process(data);

  print(hash);
  print(base64.encode(hash));*/

  //--------------------------------------------------------------------------

  /**
   * Section 4.16 - key and hash
   */

  /*String password = "password";
  var salt = createIint8ListFromString('Salt!');
  var pkcs = new KeyDerivator(("SHA-1/HMAC/PBKDF2"));
  var params = new Pbkdf2Parameters(salt, 100, 16);
  pkcs.init(params);
  Uint8List key = pkcs.process(createIint8ListFromString(password));
  display('Key value', key);*/

  //--------------------------------------------------------------------------

  /**
   * Section 4.17 - why? Building a secure password.
   */

  // print(randomBytes(8));

  //--------------------------------------------------------------------------

  /**
   * Section 4.18 - Stream cipher
   */

  /*
  // Key
  final keyBytes = randomBytes(16);
  final key = new KeyParameter(keyBytes);

  // IV
  final iv = randomBytes(8);
  final ivParams = new ParametersWithIV(key, iv);

  // Stream Cipher and initialisation
  StreamCipher cipher = new StreamCipher("Salsa20"); // Salsa20, not as secure as AES
  cipher.init(true, ivParams);

  // Encrypt
  String text = "Hello world";
  Uint8List plainData = createIint8ListFromString(text);
  Uint8List encryptedData = cipher.process(plainData);

  // Decrypt
  cipher.reset();
  cipher.init(false, ivParams);
  Uint8List decryptedData = cipher.process(encryptedData);

  display('Plain text', plainData);
  display('encryptedData', encryptedData);
  display('decryptedData', decryptedData);

  print(utf8.decode(decryptedData));*/


  //--------------------------------------------------------------------------
  /**
   * Section 4.19
   */
  //
  // final key = randomBytes(16);
  // final params = new KeyParameter(key);
  //
  // BlockCipher cipher = new BlockCipher("AES");
  // cipher.init(true, params);
  //
  // // Encrypt
  // String text = "Hello world";
  // Uint8List plainData = createIint8ListFromString(text.padRight(cipher.blockSize)); // should use cryptographic padding, slower than Salsa20
  // Uint8List encryptedDate = cipher.process(plainData);
  //
  // // Decrypt
  // cipher.reset();
  // cipher.init(false, params);
  // Uint8List decryptedData = cipher.process(encryptedDate);
  //
  // display('Plain text', plainData);
  // display('encryptedDate', encryptedDate);
  // display('decryptedData', decryptedData);
  //
  // print(utf8.decode(decryptedData));

}

Uint8List createIint8ListFromString(String value) => new Uint8List.fromList(utf8.encode(value));

void display(String title, Uint8List value) {
  print(title);
  print(value);
  print(base64.encode(value));
  print('');
}

Uint8List randomBytes(int length) {
  // takes the key and params and combines them
  // seeds the random generator
  // random generator has these algorithms
  // a giant list of numbers to use, method returns the bytes
  final rnd = new SecureRandom("AES/CTR/AUTO-SEED-PRNG"); // TODO read about this more
  final key = new Uint8List(16);
  final keyParam = new KeyParameter(key);
  final params = new ParametersWithIV(keyParam, new Uint8List(16));

  rnd.seed(params);

  var random = new Random();
  for (int i = 0; i < random.nextInt(255); i++) {
    rnd.nextUint8();
  }

  var bytes = rnd.nextBytes(length);
  return bytes;

}