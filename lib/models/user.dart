import 'dart:convert';

class ProductX {
  final String namabarang;
  final String id;
  final int hargaproduk;
  final int stok;
  final String createdAt;
  final String image;
  ProductX({
    this.namabarang = '',
    this.id = '',
    this.hargaproduk = 0,
    this.stok = 0,
    this.createdAt = '',
    this.image = '',
  });

  ProductX copyWith({
    String? namabarang,
    String? id,
    int? harga,
    int? stok,
    String? createdAt,
    String? image,
  }) {
    return ProductX(
      namabarang: namabarang ?? this.namabarang,
      id: id ?? this.id,
      // ignore: unnecessary_this
      hargaproduk: harga ?? this.hargaproduk,
      stok: stok ?? this.stok,
      createdAt: createdAt ?? this.createdAt,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'namabarang': namabarang});
    result.addAll({'id': id});
    result.addAll({'harga': hargaproduk});
    result.addAll({'stok': stok});
    result.addAll({'created_at': createdAt});
    result.addAll({'image': image});

    return result;
  }

  factory ProductX.fromMap(Map<String, dynamic> map) {
    return ProductX(
      namabarang: map['namabarang'] ?? '',
      id: map['id'] ?? '',
      hargaproduk: map['harga']?.toInt() ?? 0,
      stok: map['stok']?.toInt() ?? 0,
      createdAt: map['created_at'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductX.fromJson(String source) => ProductX.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserX(namabarang: $namabarang, id: $id, harga: $hargaproduk, stok: $stok, createdAt: $createdAt, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductX &&
        other.namabarang == namabarang &&
        other.id == id &&
        other.hargaproduk == hargaproduk &&
        other.stok == stok &&
        other.createdAt == createdAt &&
        other.image == image;
  }

  @override
  int get hashCode {
    return namabarang.hashCode ^
        id.hashCode ^
        hargaproduk.hashCode ^
        stok.hashCode ^
        createdAt.hashCode ^
        image.hashCode;
  }
}
