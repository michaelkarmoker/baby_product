
import 'dart:ffi';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PriceConverter {
  static String convertPrice(double price, {double? discount, String? discountType, int asFixed = 2}) {
    if(discount != null && discountType != null){
      if(discountType == 'amount') {
        price = price - discount;
      }else if(discountType == 'percent') {
        price = price - ((discount / 100) * price);
      }
    }
    bool _isRightSide = false;
    return '${_isRightSide ? '' : "৳"+' '}'
        '${(price).toStringAsFixed(asFixed).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}'
        '${_isRightSide ? ' '+"৳" : ''}';
  }

  static double convertWithDiscount(double price, double discount, String discountType) {
    if(discountType == 'amount') {
      price = price - discount;
    }else if(discountType == 'percent') {
      price = price - ((discount / 100) * price);
    }
    return price;
  }

  static double calculation(double amount, double discount, String type, int quantity) {
    double calculatedAmount = 0;
    if(type == 'amount') {
      calculatedAmount = discount * quantity;
    }else if(type == 'percent') {
      calculatedAmount = (discount / 100) * (amount * quantity);
    }
    return calculatedAmount;
  }

  static String percentageCalculation(String price, String discount, String discountType) {
    return '$discount${discountType == 'percent' ? '%' : '৳'} OFF';
  }
  static String amountWithTakaSign( String amount,{ bool isLeft=true}) {
    amount=amount.replaceAll(",", "");
   if(double.parse(amount)>0){
     var formatter = NumberFormat('#,###,###.00');
     amount=formatter.format(double.parse(amount));
     return isLeft?'৳ ${amount}':'${amount} ৳';
   }
    else{
     return isLeft?'৳ 0.00':'0.00 ৳';
   }
  }
}
