import 'dart:convert';
// import 'package:flutter/material.dart';

class LoyaltyCard {
  final String name;
  final String number;
  final String expiryDate;
  final String status;
  final String images;

  LoyaltyCard({
    required this.name,
    required this.number,
    required this.expiryDate,
    required this.status,
    required this.images,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'number': number,
      'expiryDate': expiryDate,
      'status': status,
      'images': images,
    };
  }

  factory LoyaltyCard.fromMap(Map<String, dynamic> map) {
    return LoyaltyCard(
      name: map['name'] as String,
      number: map['number'] as String,
      expiryDate: map['expiryDate'] as String,
      status: map['status'] as String,
      images: map['images'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoyaltyCard.fromJson(String source) =>
      LoyaltyCard.fromMap(json.decode(source) as Map<String, dynamic>);
}

class CardModelImage {
  CardModelImage({
    required this.image,
    required this.imageFill,
    required this.text,
  });

  final String image;
  final String text;
  final String imageFill;
}

List<CardModelImage> cardImage = [
  CardModelImage(
    image: 'assets/images/gold.png',
    imageFill: 'assets/images/goldfill.png',
    text: 'Gold',
  ),
  CardModelImage(
    image: 'assets/images/silver.png',
    imageFill: 'assets/images/silverfill.png',
    text: 'Silver',
  ),
  CardModelImage(
    image: 'assets/images/platinum.png',
    imageFill: 'assets/images/platinumfill.png',
    text: 'Platinum',
  ),
  CardModelImage(
    image: 'assets/images/diamond.png',
    imageFill: 'assets/images/diamontfill.png',
    text: 'diamond',
  ),
  CardModelImage(
    image: 'assets/images/5.png',
    imageFill: 'assets/images/fill5.png',
    text: '',
  ),
  CardModelImage(
    image: 'assets/images/6.png',
    imageFill: 'assets/images/fill6.png',
    text: '',
  ),
  CardModelImage(
    image: 'assets/images/7.png',
    imageFill: 'assets/images/fill7.png',
    text: '',
  ),
  CardModelImage(
    image: 'assets/images/7.png',
    imageFill: 'assets/images/fill7.png',
    text: '',
  ),
];
