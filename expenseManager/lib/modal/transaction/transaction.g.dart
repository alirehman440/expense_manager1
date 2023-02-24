// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionAdapter extends TypeAdapter<Transaction> {
  @override
  final int typeId = 0;

  @override
  Transaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Transaction(
      dateTime: fields[0] as DateTime,
      amount: fields[1] == null ? 0.0 : fields[1] as double,
      category: fields[5] as String,
      currency: fields[2] as String,
      transactionType: fields[6] == null
          ? TransactionType.expense
          : fields[6] as TransactionType?,
      note: fields[4] == null ? '' : fields[4] as String?,
      recurrence: fields[9] == null ? false : fields[9] as bool,
      subCurrency: fields[3] == null ? '' : fields[3] as String?,
      payee: fields[8] == null ? '' : fields[8] as String?,
    )..image = fields[7] == null ? '' : fields[7] as String?;
  }

  @override
  void write(BinaryWriter writer, Transaction obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.dateTime)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.currency)
      ..writeByte(3)
      ..write(obj.subCurrency)
      ..writeByte(4)
      ..write(obj.note)
      ..writeByte(5)
      ..write(obj.category)
      ..writeByte(6)
      ..write(obj.transactionType)
      ..writeByte(7)
      ..write(obj.image)
      ..writeByte(8)
      ..write(obj.payee)
      ..writeByte(9)
      ..write(obj.recurrence);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
