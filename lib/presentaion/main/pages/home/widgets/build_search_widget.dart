import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking/app/functions.dart';
import 'package:hotel_booking/presentaion/resources/localization/language_manager.dart';
import 'package:hotel_booking/presentaion/resources/strings_manager.dart';
import 'dart:ui' as ui;
import '../../../../resources/colors_manager.dart';
import '../../../cubit/main_cubit.dart';

class BuildSearchWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final BuildContext homeContext;
  final FocusNode focusNode;
  const BuildSearchWidget({
    Key? key,
    required this.scaffoldKey,
    required this.homeContext,
    required this.focusNode,
  }) : super(key: key);

  @override
  State<BuildSearchWidget> createState() => _BuildSearchWidgetState();
}

class _BuildSearchWidgetState extends State<BuildSearchWidget> {
  final _minPriceController = TextEditingController();
  final _maxPriceController = TextEditingController();
  final _searchController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isSearching = false;

  FocusNode get focusNode => widget.focusNode;

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    focusNode.addListener(
      () {
        if (!focusNode.hasFocus) {
          setState(
            () {
              isSearching = false;
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildSearchTextField(),
        if (isSearching) buildCancelButton() else buildFilterIcon(),
      ],
    );
  }

  Widget buildSearchTextField() {
    return Expanded(
      child: SizedBox(
        height: 50.0,
        child: Directionality(
          textDirection: getTextDirection(context),
          child: TextFormField(
            onTap: () {
              setState(
                () {
                  isSearching = true;
                },
              );
            },
            controller: _searchController,
            focusNode: focusNode,
            onChanged: (value) {
              widget.homeContext
                  .read<MainCubit>()
                  .searchForHotels(widget.homeContext, value.trim());
            },
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: Colors.black),
            cursorColor: AppColors.primary,
            decoration: InputDecoration(
              hintStyle: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(height: 4.0, color: Colors.black),
              hintText: AppStrings.searchTextField.tr(),
              prefixIcon: const Icon(
                Icons.search,
                color: AppColors.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  IconButton buildFilterIcon() {
    return IconButton(
      splashColor: Colors.transparent,
      onPressed: () {
        FocusScope.of(context).unfocus();
        widget.scaffoldKey.currentState?.showBottomSheet(
          (context) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 220,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      buildPriceField(
                          AppStrings.minPrice.tr(), _minPriceController),
                      const SizedBox(
                        height: 20.0,
                      ),
                      buildPriceField(
                          AppStrings.maxPrice.tr(), _maxPriceController),
                      const SizedBox(
                        height: 20.0,
                      ),
                      searchButton()
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      icon: Icon(
        Icons.filter_list,
        color: isLightTheme(context) ? Colors.black : Colors.white,
      ),
    );
  }

  SizedBox searchButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Navigator.of(context).pop();
            widget.homeContext.read<MainCubit>().getHotels(
                  widget.homeContext,
                  minAmount: int.parse(_minPriceController.text),
                  maxAmount: int.parse(_maxPriceController.text),
                );
            _minPriceController.clear();
            _maxPriceController.clear();
          }
        },
        child: const Text(
          AppStrings.search,
        ).tr(),
      ),
    );
  }

  Widget buildPriceField(String title, TextEditingController controller) {
    return Directionality(
      textDirection: getTextDirection(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textDirection: ui.TextDirection.rtl,
          ),
          const SizedBox(
            width: 10.0,
          ),
          SizedBox(
              height: 50.0,
              width: 200.w,
              child: TextFormField(
                textAlign: TextAlign.center,
                validator: (value) {
                  if (int.tryParse(value ?? "") == null || value!.isEmpty) {
                    return AppStrings.priceNotValid.tr();
                  }
                  return null;
                },
                cursorColor: AppColors.primary,
                style: Theme.of(context).textTheme.displayLarge,
                keyboardType: TextInputType.number,
                controller: controller,
              )),
        ],
      ),
    );
  }

  Widget buildCancelButton() {
    return Padding(
      padding: context.locale == arabicLocal
          ? const EdgeInsets.only(right: 8.0)
          : const EdgeInsets.only(left: 8.0),
      child: SizedBox(
        height: 50.0,
        width: 80.w,
        child: OutlinedButton(
            style: Theme.of(context).outlinedButtonTheme.style!.copyWith(
                side: MaterialStateProperty.all<BorderSide>(
                    const BorderSide(color: AppColors.red, width: 1.5))),
            onPressed: () {
              focusNode.unfocus();
              _searchController.clear();
              widget.homeContext.read<MainCubit>().setSearchingFalse();
            },
            child: Text(
              AppStrings.cancel.tr(),
            )),
      ),
    );
  }
}
