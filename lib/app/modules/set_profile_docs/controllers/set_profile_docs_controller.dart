import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/add_document_step_view.dart';
import '../views/developer_companies_step_view.dart';
import '../views/developer_ownership_step_view.dart';
import '../views/example_images_step_view.dart';
import '../views/exchange_company_step_view.dart';
import '../views/frustrations_step_view.dart';
import '../views/meet_genie_step_view.dart';
import '../views/ownership_level_step_view.dart';
import '../views/vacation_with_step_view.dart';

class SetProfileDocsController extends GetxController {
  // true = document flow, false = image flow
  RxBool isDocument = true.obs;

  // false => only welcome screen; true => show step tracker + pages
  RxBool isClicked = false.obs;

  // 0-based index of current step in the flow
  RxInt currentStep = 0.obs;

  late PageController pageController;

  // progress bar booleans
  RxList<RxBool> stepTracker = <RxBool>[].obs;

  static const int _documentStepCount = 8;
  static const int _imageStepCount = 8;

  int get totalSteps =>
      isDocument.value ? _documentStepCount : _imageStepCount;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    _initStepTracker(_documentStepCount); // default length
  }

  void _initStepTracker(int length) {
    stepTracker.assignAll(
      List.generate(length, (_) => false.obs),
    );
  }

  // called from Step1View -> Continue With Documents
  void startWithDocuments() {
    isDocument.value = true;
    isClicked.value = true;
    currentStep.value = 0;
    _initStepTracker(_documentStepCount);
    _updateTracker(0);
    pageController.jumpToPage(0);
  }

  // called from Step1View -> Continue with Images
  void startWithImages() {
    isDocument.value = false;
    isClicked.value = true;
    currentStep.value = 0;
    _initStepTracker(_imageStepCount);
    _updateTracker(0);
    pageController.jumpToPage(0);
  }

  void onPageChanged(int index) {
    currentStep.value = index;
    _updateTracker(index);
  }

  void _updateTracker(int index) {
    for (int i = 0; i < stepTracker.length; i++) {
      stepTracker[i].value = i <= index;
    }
  }

  // Optional: call from "Next" & "Back" buttons inside each step.
  void goNext() {
    if (currentStep.value < totalSteps - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void goBack() {
    if (currentStep.value > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  // Build the correct step widget depending on flow + index
  Widget buildStepPage(int index) {
    if (isDocument.value) {
      // DOCUMENT FLOW
      switch (index) {
      // 1) Add Your First Document
        case 0:
          return const AddDocumentStepView();

      // 2) Which timeshare developer(s) do you own with?
        case 1:
          return const DeveloperCompaniesStepView();

      // 3) Which best describes your [Developer] ownership?
        case 2:
          return const DeveloperOwnershipStepView();

      // 4) Exchange Company Name
        case 3:
          return const ExchangeCompanyStepView();

      // 5) Which best describes your [Developer] ownership level?
        case 4:
          return const OwnershipLevelStepView();

      // 6) What frustrates you most about your ownership right now?
        case 5:
          return const FrustrationsStepView();

      // 7) Who do you vacation with most often?
        case 6:
          return const VacationWithStepView();

      // 8) Meet Your Timeshare Genie
        case 7:
          return const MeetGenieStepView();
      }
    } else {
      // IMAGE FLOW
      switch (index) {
      // 1) Examples Images that you need to upload…
        case 0:
          return const ExampleImagesStepView();

      // 2) Which timeshare developer(s) do you own with?
        case 1:
          return const DeveloperCompaniesStepView();

      // 3) Which best describes your [Developer] ownership?
        case 2:
          return const DeveloperOwnershipStepView();

      // 4) Exchange Company Name
        case 3:
          return const ExchangeCompanyStepView();

      // 5) Which best describes your [Developer] ownership level?
        case 4:
          return const OwnershipLevelStepView();

      // 6) What frustrates you most about your ownership right now?
        case 5:
          return const FrustrationsStepView();

      // 7) Who do you vacation with most often?
        case 6:
          return const VacationWithStepView();

      // 8) Meet Your Timeshare Genie
        case 7:
          return const MeetGenieStepView();
      }
    }

    return const SizedBox.shrink();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
