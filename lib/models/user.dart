import 'dart:convert';

class UserX {
  final String namabarang;
  final String id;
  final int harga;
  final String createdAt;
  UserX({
    this.namabarang = '',
    this.id = '',
    this.harga = 0,
    this.createdAt = '',
  });

  UserX copyWith({
    String? nama,
    String? id,
    int? umur,
    String? createdAt,
  }) {
    return UserX(
      namabarang: nama ?? this.namabarang,
      id: id ?? this.id,
      harga: umur ?? this.harga,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'nama': namabarang});
    result.addAll({'id': id});
    result.addAll({'umur': harga});
    result.addAll({'created_at': createdAt});

    return result;
  }

  factory UserX.fromMap(Map<String, dynamic> map) {
    return UserX(
      namabarang: map['nama'] ?? '',
      id: map['id'] ?? '',
      harga: map['umur']?.toInt() ?? 0,
      createdAt: map['created_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserX.fromJson(String source) => UserX.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserX(nama: $namabarang, id: $id, umur: $harga, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserX &&
        other.namabarang == namabarang &&
        other.id == id &&
        other.harga == harga &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return namabarang.hashCode ^ id.hashCode ^ harga.hashCode ^ createdAt.hashCode;
  }
}
