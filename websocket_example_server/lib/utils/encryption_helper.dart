import 'package:encrypt/encrypt.dart' as encrypt;
import 'dart:convert';

class EncryptionHelper {
  // Ensure the key is exactly 32 characters (256-bit AES)
  static final key = encrypt.Key.fromUtf8('secretkey:hapilyeverafter1234567'); // 32 chars
  static final encrypt.IV iv = encrypt.IV.fromUtf8('1234567890123456'); // Must be 16 chars

  /// Encrypts a plaintext message and returns the Base64-encoded string.
  static String encryptMessage(String plainText) {
    final encrypt.Encrypter encrypter = encrypt.Encrypter(
      encrypt.AES(key, mode: encrypt.AESMode.cbc, padding: 'PKCS7'),
    );
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  /// Decrypts a Base64-encoded encrypted message and returns the original text.
  static String decryptMessage(String encryptedText) {
    final encrypt.Encrypter encrypter = encrypt.Encrypter(
      encrypt.AES(key, mode: encrypt.AESMode.cbc, padding: 'PKCS7'),
    );
    final decrypted = encrypter.decrypt64(encryptedText, iv: iv);
    return decrypted;
  }

}
