import 'dart:convert';

class UserX {
  final String namabarang;
  final String id;
  final int harga;
  final int stok;
  final String createdAt;
  final String image;
  UserX({
    this.namabarang = '',
    this.id = '',
    this.harga = 0,
    this.stok = 0,
    this.createdAt = '',
    this.image = '',
  });

  UserX copyWith({
    String? namabarang,
    String? id,
    int? harga,
    int? stok,
    String? createdAt,
    String? image,
  }) {
    return UserX(
      namabarang: namabarang ?? this.namabarang,
      id: id ?? this.id,
      harga: harga ?? this.harga,
      stok: stok ?? this.stok,
      createdAt: createdAt ?? this.createdAt,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'namabarang': namabarang});
    result.addAll({'id': id});
    result.addAll({'harga': harga});
    result.addAll({'stok': stok});
    result.addAll({'created_at': createdAt});
    result.addAll({'image': image});

    return result;
  }

  factory UserX.fromMap(Map<String, dynamic> map) {
    return UserX(
      namabarang: map['namabarang'] ?? '',
      id: map['id'] ?? '',
      harga: map['harga']?.toInt() ?? 0,
      stok: map['stok']?.toInt() ?? 0,
      createdAt: map['created_at'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserX.fromJson(String source) => UserX.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserX(namabarang: $namabarang, id: $id, harga: $harga, stok: $stok, createdAt: $createdAt, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserX &&
        other.namabarang == namabarang &&
        other.id == id &&
        other.harga == harga &&
        other.stok == stok &&
        other.createdAt == createdAt &&
        other.image == image;
  }

  @override
  int get hashCode {
    return namabarang.hashCode ^ id.hashCode ^ harga.hashCode ^ stok.hashCode ^ createdAt.hashCode ^ image.hashCode;
  }
}
