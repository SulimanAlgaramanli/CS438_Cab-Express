class CarModel{
  final int? id;
  final String? driverId;
  final String? modelCar;
  final int? numberOfPassenger;
  final String? plateNumber;
  final bool? isCurrentCar;

  const CarModel({
    this.id,
    this.driverId,
    this.modelCar,
    this.numberOfPassenger,
    this.plateNumber,
    this.isCurrentCar,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'driverId': driverId,
      'modelCar': modelCar,
      'numberOfPassenger': numberOfPassenger,
      'plateNumber': plateNumber,
      'isCurrentCar': isCurrentCar,
    };
  }

  factory CarModel.fromMap(Map<String, dynamic> map) {
    return CarModel(
      id: map['id'] as int,
      driverId: map['driverId'] as String,
      modelCar: map['modelCar'] as String,
      numberOfPassenger: map['numberOfPassenger'] as int,
      plateNumber: map['plateNumber'] as String,
      isCurrentCar: map['isCurrentCar'] as bool,
    );
  }
}