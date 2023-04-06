import 'dart:async';
import 'package:flutter_ble_lib/flutter_ble_lib.dart';

class BleService {
  final String _deviceId;
  final String _serviceUuid;
  final String _characteristicUuid1;
  final String _characteristicUuid2;

  BleManager _bleManager = BleManager();
  Peripheral _peripheral;
  Characteristic _characteristic1;
  Characteristic _characteristic2;

  BleService(this._deviceId, this._serviceUuid, this._characteristicUuid1,
      this._characteristicUuid2);

  Future<void> scan() async {
    _bleManager.createClient();
    _bleManager.startPeripheralScan().listen((scanResult) async {
      if (scanResult.peripheral.identifier == _deviceId) {
        _bleManager.stopPeripheralScan();
        _peripheral = scanResult.peripheral;
        await _connect();
      }
    });
  }

  Future<void> _connect() async {
    await _peripheral.connect();
    await _discoverServices();
  }

  Future<void> _discoverServices() async {
    List<Service> services = await _peripheral.discoverAllServicesAndCharacteristics();
    for (Service service in services) {
      if (service.uuid == _serviceUuid) {
        for (Characteristic characteristic in service.characteristics) {
          if (characteristic.uuid == _characteristicUuid1) {
            _characteristic1 = characteristic;
          } else if (characteristic.uuid == _characteristicUuid2) {
            _characteristic2 = characteristic;
          }
        }
      }
    }
  }

  Future<String> readCharacteristic1() async {
    List<int> value = await _characteristic1.read();
    return String.fromCharCodes(value);
  }

  Future<String> readCharacteristic2() async {
    List<int> value = await _characteristic2.read();
    return String.fromCharCodes(value);
  }

  Future<void> disconnect() async {
    if (_peripheral != null && _peripheral.isConnected) {
      await _peripheral.disconnect();
    }
  }
}
