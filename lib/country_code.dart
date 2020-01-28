import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
class CountryCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
           margin: EdgeInsets.only(top: 40),
       child: Row(
                 children: <Widget>[
                        Expanded(
                          child: CountryPickerDropdown(
                            initialValue: 'in',
                            itemBuilder: _buildDropdownItem,
                            onValuePicked: (Country country) {
                              print("${country.phoneCode}");
                            },
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Phone Number",
                            ),
                            onChanged: (value) {
                              // this.phoneNo=value;
                              print(value);
                            },
                          ),
                        ),
                      ],
                    ),
      ),
    );
  }

Widget _buildDropdownItem(Country country) => Container(
        child: Row(
          children: <Widget>[
            CountryPickerUtils.getDefaultFlagImage(country),
            SizedBox(
              width: 8.0,
            ),
            Text("+${country.phoneCode}(${country.isoCode})"),
          ],
        ),
      );
}