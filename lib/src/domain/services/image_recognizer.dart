import 'package:camera/camera.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class ImageRecognizerService {
  const ImageRecognizerService();

  static final _textRecognizer = TextRecognizer();

  Future<String> recognizeImage(XFile photo) async {
    final inputImage = InputImage.fromFilePath(photo.path);
    final recognizedText = await _textRecognizer.processImage(inputImage);
    final text = recognizedText.text;
    return text;
  }
}
