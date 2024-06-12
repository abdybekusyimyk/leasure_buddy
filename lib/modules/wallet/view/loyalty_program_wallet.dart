import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leasure_buddy/models/loyalty_card_model.dart';
import 'package:leasure_buddy/modules/appbar/app_bar_method.dart';
import 'package:leasure_buddy/modules/wallet/widgets/date_input_field_widget.dart';
import 'package:leasure_buddy/modules/wallet/widgets/text_form_field_walled_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoyaltyProgramWallet extends StatefulWidget {
  const LoyaltyProgramWallet({super.key});

  @override
  State<LoyaltyProgramWallet> createState() => _LoyaltyProgramWalletState();
}

class _LoyaltyProgramWalletState extends State<LoyaltyProgramWallet> {
  List<LoyaltyCard> cardsList = [];
  String? selectedStatus;
  int selectedCard = -1;

  int? currentCardIndex;

  Loyalty loyalty = Loyalty.none;

  File? image;

  final nameCasino = TextEditingController();
  final cardNumber = TextEditingController();
  final dateController = TextEditingController();

  bool buttonAdd = false;
  bool updateAdd = false;
  bool cardDelete = false;

  @override
  void initState() {
    super.initState();
    loadCardsList();
  }

  Future<void> loadCardsList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cardsJson = prefs.getString('cardsList');
    if (cardsJson != null) {
      setState(() {
        List<dynamic> cardsData = jsonDecode(cardsJson);
        cardsList =
            cardsData.map((data) => LoyaltyCard.fromJson(data)).toList();
      });
    }
  }

  Future<void> saveCardsList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cardsJson =
        jsonEncode(cardsList.map((card) => card.toJson()).toList());
    await prefs.setString('cardsList', cardsJson);
  }

  void deleteCard(int index) {
    setState(() {
      cardsList.removeAt(index);
      currentCardIndex = null;
    });
    saveCardsList();
  }

  Future<void> clearCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('cardsList');
    setState(() {
      cardsList.clear();
      currentCardIndex = null;
    });
  }

  late String lastSelectedValue;

  void showDemoDialog({
    required BuildContext context,
    required Widget child,
  }) {
    showCupertinoDialog<String>(
      context: context,
      builder: (context) => child,
    ).then((value) {
      if (value != null) {
        setState(() {
          lastSelectedValue = value;
        });
      }
    });
  }

  void onAlertPress(BuildContext context) {
    showDemoDialog(
      context: context,
      child: Theme(
        data: ThemeData.dark(),
        child: CupertinoAlertDialog(
          title: const Text(
            'Card Deleting',
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
            ),
          ),
          content: const Text(
            'Do You really want to delete this card from Wallet?',
            style: TextStyle(
              fontSize: 13,
              color: Colors.white,
            ),
          ),
          actions: [
            CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () {
                  setState(() {
                    deleteCard(currentCardIndex!);
                    cardDelete = false;
                    updateAdd = true;
                  });

                  Navigator.of(context, rootNavigator: true).pop('Yes');
                },
                child: const Text(
                  'Yes',
                  style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                    color: Color(0xff0A84FF),
                  ),
                )),
            CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () =>
                    Navigator.of(context, rootNavigator: true).pop('No'),
                child: const Text(
                  'No',
                  style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                    color: Color(0xff0A84FF),
                  ),
                )),
          ],
        ),
      ),
    );
  }

//! images

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0a0035),
      appBar: AppBarMethod.appBarMethod(context, 'Loyalty Program Wallet'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (cardsList.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 180,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                  ),
                  items: cardsList.map((i) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentCardIndex = cardsList.indexOf(i);
                          cardDelete = !cardDelete;
                          loyalty = Loyalty.update;
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: i.imagesFile == null
                                ? AssetImage(
                                    i.images.toString(),
                                  )
                                : FileImage(
                                    File(
                                      i.imagesFile!,
                                    ),
                                  ),
                            fit: i.imagesFile == null
                                ? BoxFit.none
                                : BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                i.name,
                                style: TextStyle(
                                  fontSize: 24,
                                  color: i.imagesFile == null
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                              Text(
                                i.status,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: i.imagesFile == null
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    i.number,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: i.imagesFile == null
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                  ),
                                  Text(
                                    i.expiryDate,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: i.imagesFile == null
                                          ? Colors.black
                                          : Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              )
            else
              const SizedBox(height: 0),
            if (cardDelete == true)
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          cardDelete = false;
                          loyalty = Loyalty.create;
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 47,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xff1ec932),
                              Color(0xff0db3e3),
                            ],
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Add New Card to Wallet',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'SF-Pro-Display',
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // GestureDetector(
                    //   onTap: () {
                    //     onAlertPress(context);
                    //   },
                    //   child: Container(
                    //     width: double.infinity,
                    //     height: 47,
                    //     decoration: BoxDecoration(
                    //       border: Border.all(
                    //         width: 2,
                    //         color: const Color(0xff1ec932),
                    //       ),
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //     child: const Center(
                    //       child: Text(
                    //         'Delete This Card',
                    //         style: TextStyle(
                    //           color: Colors.white,
                    //           fontFamily: 'SF-Pro-Display',
                    //           fontWeight: FontWeight.w700,
                    //           fontSize: 16,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              )
            else if (loyalty == Loyalty.create)
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'New card adding',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'SF-Pro-Display',
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 8),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                      ),
                      padding: EdgeInsets.zero,
                      itemCount: cardImage.length,
                      itemBuilder: (context, index) {
                        // ignore: unrelated_type_equality_checks
                        if (cardImage[index] == cardImage.last) {
                          return GestureDetector(
                            onTap: () async {
                              final pickedPile = await ImagePicker()
                                  .pickImage(source: ImageSource.gallery);
                              if (pickedPile != null) {
                                setState(() {
                                  cardImage.add(
                                    CardModelImage(
                                      image: '',
                                      imageFill: '',
                                      text: '',
                                      imageFile: File(pickedPile.path),
                                    ),
                                  );
                                });
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: image == null
                                  ? Image.asset('assets/images/add_photo.png')
                                  : Image.file(image!),
                            ),
                          );
                        } else {
                          return GestureDetector(
                            onTap: () {
                              setState(() => selectedCard = index);
                            },
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      border: selectedCard == index
                                          ? Border.all(
                                              color: const Color(0xff39CD21),
                                              width: 2.5,
                                            )
                                          : Border.all(width: 0),
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: cardImage[index].imageFile ==
                                                null
                                            ? AssetImage(
                                                cardImage[index].image,
                                              )
                                            : FileImage(
                                                cardImage[index].imageFile!),
                                        fit: BoxFit.cover,
                                      )),
                                  child: Center(
                                    child: Text(
                                      cardImage[index].text,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'SF-Pro-Display',
                                      ),
                                    ),
                                  ),
                                ),
                                selectedCard == index
                                    ? Positioned(
                                        top: -5,
                                        left: 20,
                                        right: 20,
                                        child: Container(
                                          width: 16,
                                          height: 16,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xff39CD21),
                                          ),
                                          child: const Center(
                                            child: Icon(
                                              Icons.check_rounded,
                                              color: Colors.white,
                                              size: 12,
                                            ),
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'The name of the casino',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'SF-Pro-Display',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormFieldWalledWidget(
                      hintText: 'Add name of the casino',
                      controller: nameCasino,
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'A unique card number',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'SF-Pro-Display',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormFieldWalledWidget(
                      keyboardType: TextInputType.number,
                      hintText: 'Add number',
                      controller: cardNumber,
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'The expiration date',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'SF-Pro-Display',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    DateInputField(
                      controller: dateController,
                      hintText: 'Add the expiration date of card',
                      keyboardType: TextInputType.datetime,
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Card status',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'SF-Pro-Display',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: const Color(0xff17036b),
                        border: Border.all(
                          color: const Color(0xff17036b),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButton<String>(
                        dropdownColor: const Color(0xff17036b),
                        isExpanded: true,
                        iconEnabledColor: Colors.white,
                        hint: const Text(
                          'Choose your card status',
                          style: TextStyle(
                            color: Color(0xff828282),
                            fontFamily: 'SF-Pro-Display',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedStatus,
                        items: [
                          DropdownMenuItem(
                            value: 'Silver',
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/svg/icon_dollar.svg'),
                                const SizedBox(width: 5),
                                const Text(
                                  'Silver',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'SF-Pro-Display',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'Gold',
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/svg/icon_dollar.svg'),
                                const SizedBox(width: 5),
                                const Text(
                                  'Gold',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'SF-Pro-Display',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'Platinum',
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/svg/icon_dollar.svg'),
                                const SizedBox(width: 5),
                                const Text(
                                  'Platinum',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'SF-Pro-Display',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'Diamond',
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/svg/icon_frank.svg'),
                                const SizedBox(width: 5),
                                const Text(
                                  'Diamond',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'SF-Pro-Display',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedStatus = newValue;
                          });
                        },
                        underline: const SizedBox(),
                      ),
                    ),
                    const SizedBox(height: 24),
                    GestureDetector(
                      onTap: () {
                        setState(() {});

                        if (nameCasino.text.isNotEmpty &&
                            cardNumber.text.isNotEmpty &&
                            dateController.text.isNotEmpty &&
                            selectedStatus != null &&
                            selectedCard != -1) {
                          cardsList.add(
                            LoyaltyCard(
                              name: nameCasino.text,
                              number: cardNumber.text,
                              expiryDate: dateController.text,
                              status: selectedStatus.toString(),
                              images: cardImage[selectedCard].imageFill,
                              imagesFile:
                                  cardImage[selectedCard].imageFile?.path,
                            ),
                          );
                          saveCardsList();

                          nameCasino.clear();
                          cardNumber.clear();
                          dateController.clear();

                          setState(() {
                            selectedCard = -1;
                            selectedStatus = null;
                            buttonAdd = true;
                          });
                        } else {}
                      },
                      child: Container(
                        width: double.infinity,
                        height: 47,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xff1ec932),
                              Color(0xff0db3e3),
                            ],
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Add Card to Wallet',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'SF-Pro-Display',
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              )
            else if (loyalty == Loyalty.update)
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Update',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'SF-Pro-Display',
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 8),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                      ),
                      padding: EdgeInsets.zero,
                      itemCount: cardImage.length,
                      itemBuilder: (context, index) {
                        // ignore: unrelated_type_equality_checks
                        if (cardImage[index] == cardImage.last) {
                          return GestureDetector(
                            onTap: () async {
                              final pickedPile = await ImagePicker()
                                  .pickImage(source: ImageSource.gallery);
                              if (pickedPile != null) {
                                setState(() {
                                  cardImage.add(
                                    CardModelImage(
                                      image: '',
                                      imageFill: '',
                                      text: '',
                                      imageFile: File(pickedPile.path),
                                    ),
                                  );
                                });
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: image == null
                                  ? Image.asset('assets/images/add_photo.png')
                                  : Image.file(image!),
                            ),
                          );
                        } else {
                          return GestureDetector(
                            onTap: () {
                              setState(() => selectedCard = index);
                            },
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      border: selectedCard == index
                                          ? Border.all(
                                              color: const Color(0xff39CD21),
                                              width: 2.5,
                                            )
                                          : Border.all(width: 0),
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: cardImage[index].imageFile ==
                                                null
                                            ? AssetImage(
                                                cardImage[index].image,
                                              )
                                            : FileImage(
                                                cardImage[index].imageFile!),
                                        fit: BoxFit.cover,
                                      )),
                                  child: Center(
                                    child: Text(
                                      cardImage[index].text,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'SF-Pro-Display',
                                      ),
                                    ),
                                  ),
                                ),
                                selectedCard == index
                                    ? Positioned(
                                        top: -5,
                                        left: 20,
                                        right: 20,
                                        child: Container(
                                          width: 16,
                                          height: 16,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xff39CD21),
                                          ),
                                          child: const Center(
                                            child: Icon(
                                              Icons.check_rounded,
                                              color: Colors.white,
                                              size: 12,
                                            ),
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'The name of the casino',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'SF-Pro-Display',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormFieldWalledWidget(
                      hintText: 'Add name of the casino',
                      controller: nameCasino,
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'A unique card number',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'SF-Pro-Display',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormFieldWalledWidget(
                      keyboardType: TextInputType.number,
                      hintText: 'Add number',
                      controller: cardNumber,
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'The expiration date',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'SF-Pro-Display',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    DateInputField(
                      controller: dateController,
                      hintText: 'Add the expiration date of card',
                      keyboardType: TextInputType.datetime,
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Card status',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'SF-Pro-Display',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: const Color(0xff17036b),
                        border: Border.all(
                          color: const Color(0xff17036b),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButton<String>(
                        dropdownColor: const Color(0xff17036b),
                        isExpanded: true,
                        iconEnabledColor: Colors.white,
                        hint: const Text(
                          'Choose your card status',
                          style: TextStyle(
                            color: Color(0xff828282),
                            fontFamily: 'SF-Pro-Display',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedStatus,
                        items: [
                          DropdownMenuItem(
                            value: 'Silver',
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/svg/icon_dollar.svg'),
                                const SizedBox(width: 5),
                                const Text(
                                  'Silver',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'SF-Pro-Display',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'Gold',
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/svg/icon_dollar.svg'),
                                const SizedBox(width: 5),
                                const Text(
                                  'Gold',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'SF-Pro-Display',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'Platinum',
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/svg/icon_dollar.svg'),
                                const SizedBox(width: 5),
                                const Text(
                                  'Platinum',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'SF-Pro-Display',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'Diamond',
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/svg/icon_frank.svg'),
                                const SizedBox(width: 5),
                                const Text(
                                  'Diamond',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'SF-Pro-Display',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedStatus = newValue;
                          });
                        },
                        underline: const SizedBox(),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {});

                              if (nameCasino.text.isNotEmpty &&
                                  cardNumber.text.isNotEmpty &&
                                  dateController.text.isNotEmpty &&
                                  selectedStatus != null &&
                                  selectedCard != -1) {
                                if (currentCardIndex != null) {
                                  if (currentCardIndex! >= 0 &&
                                      currentCardIndex! < cardsList.length) {
                                    cardsList[currentCardIndex!] = LoyaltyCard(
                                      name: nameCasino.text,
                                      number: cardNumber.text,
                                      expiryDate: dateController.text,
                                      status: selectedStatus.toString(),
                                      images: cardImage[selectedCard].imageFill,
                                      imagesFile: cardImage[selectedCard]
                                          .imageFile
                                          ?.path,
                                    );
                                  } else {
                                    log('index out of range');
                                  }
                                }
                                saveCardsList();
                                nameCasino.clear();
                                cardNumber.clear();
                                dateController.clear();

                                setState(() {
                                  selectedCard = -1;
                                  selectedStatus = null;
                                  buttonAdd = true;
                                  cardDelete = !cardDelete;
                                });
                              } else {
                                log('message');
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              height: 47,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xff1ec932),
                                    Color(0xff0db3e3),
                                  ],
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'Update',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'SF-Pro-Display',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              onAlertPress(context);
                            },
                            child: Container(
                              width: double.infinity,
                              height: 47,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: const Color(0xff1ec932),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  'Delete This Card',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'SF-Pro-Display',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      buttonAdd = false;
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    height: 47,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xff1ec932),
                          Color(0xff0db3e3),
                        ],
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Add Card to Wallet',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'SF-Pro-Display',
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class NewAddCardWidget extends StatelessWidget {
  const NewAddCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

enum Loyalty { create, update, none }
