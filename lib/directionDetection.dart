import 'dart:math';

abstract class Device {
  Future<List<double>> readValues();
}

class FakeMicrophone implements Device {
  double _microphone1Value;
  double _microphone2Value;

  FakeMicrophone(this._microphone1Value, this._microphone2Value);

  @override
  Future<List<double>> readValues() async {
    return [_microphone1Value, _microphone2Value];
  }

  void setValues(double microphone1Value, double microphone2Value) {
    _microphone1Value = microphone1Value;
    _microphone2Value = microphone2Value;
  }
}

class DeviceManager {
  Device _device;

  DeviceManager(this._device);

  Future<List<double>> readValues() {
    return _device.readValues();
  }
}

class DirectionDetection {
  final DeviceManager _deviceManager;

  DirectionDetection(this._deviceManager);

  Future<int> computeDirection() async {
    List<double> futureValues = await _deviceManager.readValues();
    List<double> values = futureValues;
    double diff = values[1] - values[0];

    if (diff.abs() < 5) {
      return 0;
    } else {
      return diff > 0 ? 1 : 2;
    }
  }
}
