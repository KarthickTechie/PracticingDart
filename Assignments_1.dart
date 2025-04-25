// my first assignment
import 'dart:io';

import 'AppData.dart';
void main()
{
    print('Enter a search value:');
    String? input = stdin.readLineSync();

    if (input == null || input.isEmpty)
    {
        print('Exit');
        return;
    }

    if(input.toLowerCase().contains('greater than')||input.toLowerCase().contains('less than'))
    {
      String condition=input.toLowerCase();
      double loanAmount = double.tryParse(condition.split(' ').last)??0;
      if(loanAmount==0)
      {
        print('Invalid');
        return;
      }
      List<Map<String, dynamic>> match = filterBySearchQuery(condition, loanAmount);
      if(match.isEmpty)
      {
        print("Invalid");
        return;
      }
      else
      {
       print(match);
      }
    }
    else
    {
      bool isfound = false;
      for (var data in mobCustData)
      {
        for (var value in data.values)
        {
            if(value.toString().toLowerCase().contains(input.toLowerCase()))
            {
                print(data);
                isfound = true;
                break;
            }
        }
        if (isfound) break;
      }
      if(!isfound)
    {
      print("enter the correct value");
      return;
    }
    }
}

List<Map<String, dynamic>> filterBySearchQuery(String condition, double loanAmount) {
  List<Map<String,dynamic>> match = mobCustData.where((data)
  {
    double loanAmt = double.tryParse(data['lcdLoanAmt'].toString())??0;
    if(condition.contains('greater than')&&loanAmt>loanAmount)
    {
      return true;
    }
    else if(condition.contains('less than')&&loanAmt<loanAmount)
    {
      return true;
    }
    return false;
  }).toList();
  return match;
}