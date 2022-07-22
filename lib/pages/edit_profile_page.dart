import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nsdd/models/city.dart';
import 'package:nsdd/models/country.dart';
import 'package:nsdd/models/occupation.dart';
import 'package:nsdd/models/provinces.dart';
import 'package:nsdd/providers/country_provider.dart';
import 'package:nsdd/providers/occupation_provider.dart';
import 'package:nsdd/providers/provinces_provider.dart';
import 'package:provider/provider.dart';

import '../providers/dummy_data.dart';
import '../utils/constants.dart';
import '../utils/file_path.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({Key? key}) : super(key: key);
  final _globalKeyProfileForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Provider.of<CountryProvider>(context, listen: false).getCountriesFromAPI();
    Provider.of<OccupationProvider>(context, listen: false)
        .getOccupationFromAPI();
    Provider.of<ProvinceProvider>(context, listen: false).getProvincesFromAPI();
    int idprov = 0;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(
              FilePath.topRightCornerBg(context),
              height: 152.h,
              width: 222.w,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: kPagePadding,
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: _globalKeyProfileForm,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        kPageItemSpacingTop,
                        Text(
                          'Profile',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        kPageItemSpacing,
                        TextFormField(
                          readOnly: true,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.pin),
                            hintText: '34102-1234567-3',
                          ),
                        ),
                        kPageItemSpacing,
                        TextFormField(
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: 'Enter full name',
                          ),
                        ),
                        kPageItemSpacing,
                        TextFormField(
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: 'Enter short name',
                          ),
                        ),
                        kPageItemSpacing,
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            hintText: 'Enter email address',
                          ),
                        ),
                        kPageItemSpacing,
                        TextFormField(
                          readOnly: true,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            hintText: '0321-1234567',
                          ),
                        ),
                        kPageItemSpacing,
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            hintText: 'Other contact no',
                          ),
                        ),
                        kPageItemSpacing,
                        DropdownButtonFormField<String>(
                          items: genderDropdownItems,
                          onChanged: (String? value) {},
                          // value: selectedGender,
                          validator: (value) =>
                              value == null ? 'Choose gender' : null,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.wc),
                            hintText: 'Choose gender',
                          ),
                        ),
                        kPageItemSpacing,
                        TextFormField(
                          readOnly: true,
                          keyboardType: TextInputType.none,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.wysiwyg),
                            hintText: 'Date of Birth',
                            suffixIcon: Icon(Icons.date_range),
                          ),
                          onTap: () {},
                        ),
                        kPageItemSpacing,
                        TextFormField(
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: 'Enter father/guardian name',
                          ),
                        ),
                        kPageItemSpacing,
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            hintText: 'Father/guardian contact no',
                          ),
                        ),
                        kPageItemSpacing,
                        // DropdownButtonFormField<String>(
                        //   items: fatherOccupationDropdownItems,
                        //   onChanged: (String? value) {},
                        //   // value: selectedOccupation,
                        //   validator: (value) => value == null
                        //       ? 'Choose father/guardian occupation'
                        //       : null,
                        //   decoration: const InputDecoration(
                        //     prefixIcon: Icon(Icons.person_pin_rounded),
                        //     hintText: 'Choose father/guardian occupation',
                        //   ),
                        // ),

                        Consumer<OccupationProvider>(
                          builder: (context, cp, child) =>
                              DropdownButtonFormField<Occupation>(
                            items: cp.occupations,
                            onChanged: (Occupation? value) {
                              print(value?.name);
                            },
                            validator: (value) => value == null
                                ? 'Choose father/guardian occupation'
                                : null,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.person_pin_rounded),
                              hintText: 'Choose father/guardian occupation',
                            ),
                          ),
                        ),

                        kPageItemSpacing,
                        TextFormField(
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.location_on),
                            hintText: 'Enter postal address',
                          ),
                        ),
                        kPageItemSpacing,
                        TextFormField(
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.location_on),
                            hintText: 'Enter permanent address',
                          ),
                        ),
                        kPageItemSpacing,
                        // DropdownButtonFormField<City>(
                        //   items: cityDropdownItems,
                        //   onChanged: (City? value) {},
                        //   // value: selectedGender,
                        //   validator: (value) =>
                        //       value == null ? 'Choose domicile province' : null,
                        //   decoration: const InputDecoration(
                        //     prefixIcon: Icon(Icons.location_city),
                        //     hintText: 'Choose domicile province',
                        //   ),
                        // ),

                        Consumer<ProvinceProvider>(
                          builder: (context, cp, child) =>
                              DropdownButtonFormField<Provinces>(
                            items: cp.provinces,
                            onChanged: (Provinces? value) {
                              if (value != null) {
                                idprov = value.id;
                              }
                            },
                            validator: (value) => value == null
                                ? 'Choose domicile province'
                                : null,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.location_city),
                              hintText: 'Choose domicile province',
                            ),
                          ),
                        ),

                        kPageItemSpacing,

                        Consumer<ProvinceProvider>(
                          builder: (context, cp, child) =>
                              DropdownButtonFormField<Provinces>(
                            items: cp.provinces,
                            onChanged: (Provinces? value) {},
                            validator: (value) => value == null
                                ? 'Choose domicile province'
                                : null,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.location_city),
                              hintText: 'Choose domicile province',
                            ),
                          ),
                        ),

                        // DropdownButtonFormField<City>(
                        //   items: cityDropdownItems,
                        //   onChanged: (City? value) {},
                        //   // value: selectedGender,
                        //   validator: (value) =>
                        //       value == null ? 'Choose domicile district' : null,
                        //   decoration: const InputDecoration(
                        //     prefixIcon: Icon(Icons.location_city),
                        //     hintText: 'Choose domicile district',
                        //   ),
                        // ),
                        kPageItemSpacing,
                        CheckboxListTile(
                          value: true,
                          onChanged: (bool? checked) {},
                          title: const Text(
                            'Minority',
                          ),
                          secondary:
                              const Icon(Icons.transfer_within_a_station),
                          tileColor: Theme.of(context).colorScheme.background,
                          shape: kOutlineInputBorderShape,
                          activeColor: Theme.of(context).colorScheme.primary,
                        ),
                        kPageItemSpacing,
                        CheckboxListTile(
                          value: false,
                          onChanged: (bool? checked) {},
                          title: const Text(
                            'Disablity',
                          ),
                          secondary: const Icon(Icons.wheelchair_pickup),
                          tileColor: Theme.of(context).colorScheme.background,
                          shape: kOutlineInputBorderShape,
                          activeColor: Theme.of(context).colorScheme.primary,
                        ),
                        kPageItemSpacing,
                        Consumer<CountryProvider>(
                          builder: (context, cp, child) =>
                              DropdownButtonFormField<Country>(
                            items: cp.countries,
                            onChanged: (Country? value) {
                              print(value?.name);
                            },
                            // value: selectedGender,
                            validator: (value) => value == null
                                ? 'Choose other nationality'
                                : null,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.add_location_alt),
                              hintText: 'Choose other nationality',
                            ),
                          ),
                        ),
                        kPageItemSpacing2,
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Save',
                              style: Theme.of(context).textTheme.button,
                            ),
                          ),
                        ),
                        kPageItemSpacing,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
