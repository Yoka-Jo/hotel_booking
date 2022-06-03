import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/app/functions.dart';
import 'package:hotel_booking/presentaion/main/pages/home/viewmodel/cubit/home_cubit.dart';
import 'package:hotel_booking/presentaion/resources/language_manager.dart';
import 'package:hotel_booking/presentaion/resources/strings_manager.dart';
import 'dart:ui' as ui;
import '../../../../resources/colors_manager.dart';

class BuildSearchWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final BuildContext homeContext;
  const BuildSearchWidget({
    Key? key,
    required this.scaffoldKey,
    required this.homeContext,
  }) : super(key: key);

  @override
  State<BuildSearchWidget> createState() => _BuildSearchWidgetState();
}

class _BuildSearchWidgetState extends State<BuildSearchWidget> {
  final _minPriceController = TextEditingController();
  final _maxPriceController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        setState(() {
          isSearching = false;
        });
      } else {
        setState(() {
          isSearching = true;
        });
      }
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
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
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {}
    return Expanded(
      child: SizedBox(
        height: 50.0,
        child: Directionality(
          textDirection: getTextDirection(context),
          child: TextFormField(
            focusNode: focusNode,
            onChanged: (value) {
              widget.homeContext
                  .read<HomeCubit>()
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
          Navigator.of(context).pop();
          widget.homeContext.read<HomeCubit>().getHotels(
                widget.homeContext,
                minAmount: _minPriceController.text.isNotEmpty
                    ? int.tryParse(_minPriceController.text)
                    : 0,
                maxAmount: _maxPriceController.text.isNotEmpty
                    ? int.tryParse(_maxPriceController.text)
                    : 999,
              );
          _minPriceController.clear();
          _maxPriceController.clear();
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
              width: 80.0,
              child: TextField(
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
        child: OutlinedButton(
            style: Theme.of(context).outlinedButtonTheme.style!.copyWith(
                side: MaterialStateProperty.all<BorderSide>(
                    const BorderSide(color: AppColors.red, width: 1.5))),
            onPressed: () {
              focusNode.unfocus();
              widget.homeContext.read<HomeCubit>().clearHotels();
              widget.homeContext.read<HomeCubit>().clearFavouriteHotels();
              widget.homeContext.read<HomeCubit>()
                ..getHotels(widget.homeContext)
                ..getFavouriteHotels(widget.homeContext);
            },
            child: Text(
              AppStrings.cancel.tr(),
            )),
      ),
    );
  }
}
