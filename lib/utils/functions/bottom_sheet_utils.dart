//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:glade_v2/core/models/apiModels/Business/Invoice/invoice.dart';
//import 'package:glade_v2/core/models/apiModels/Business/VirtualCard/VirtualCardModel.dart';
//import 'package:glade_v2/utils/styles/color_utils.dart';
//import 'package:glade_v2/utils/widgets/bottom_sheets/add_invoice_item_bottom_sheet.dart';
//import 'package:glade_v2/utils/widgets/bottom_sheets/add_recipient_to_bulk_transfer_bottom_sheet.dart';
//import 'package:glade_v2/utils/widgets/bottom_sheets/beneficiary_bottom_sheet.dart';
//import 'package:glade_v2/utils/widgets/bottom_sheets/cancel_loan_bottom_sheet.dart';
//import 'package:glade_v2/utils/widgets/bottom_sheets/more_from_virtual_card_bottom_sheet.dart';
//import 'package:glade_v2/utils/widgets/bottom_sheets/paymnet_link_options_bottom_sheet.dart';
//import 'package:glade_v2/utils/widgets/bottom_sheets/reserve_funds_actions_bottom_sheet.dart';
//import 'package:glade_v2/utils/widgets/bottom_sheets/select_range_bottom_sheet.dart';
//import 'package:glade_v2/utils/widgets/bottom_sheets/single_transaction_bottom_sheet.dart';
//import 'package:glade_v2/utils/widgets/bottom_sheets/transaction_pin_bottom_sheet.dart';
//
//var _roundedRectangleBorder = RoundedRectangleBorder(
//  borderRadius: BorderRadius.only(
//    topRight: Radius.circular(25),
//    topLeft: Radius.circular(25),
//  ),
//);
//
//void showTransactionPinBottomSheet(BuildContext context,
//    {@required TransactionBottomSheetDetails details,
//    @required Function(String pin) onButtonPressed,
//    int minuValue}) {
//  showModalBottomSheet(
//    context: context,
//    barrierColor: barrierColor,
//    shape: _roundedRectangleBorder,
//    isScrollControlled: true,
//    builder: (context) {
//      return TransactionPinBottomSheet(
//        details: details,
//        onButtonPressed: onButtonPressed,
//        minusValue: minuValue,
//      );
//    },
//  );
//}
//
//void showSingleTransactionBottomSheet(BuildContext context, {Color textColor}) {
//  showModalBottomSheet(
//    context: context,
//    barrierColor: barrierColor,
//    shape: _roundedRectangleBorder,
//    isScrollControlled: true,
//    builder: (context) {
//      return SingleTransactionBottomSheet(
//        textColor: textColor,
//      );
//    },
//  );
//}
//
//void showBeneficiaryBottomSheet(BuildContext context) {
//  showModalBottomSheet(
//    context: context,
//    barrierColor: barrierColor,
//    shape: _roundedRectangleBorder,
//    isScrollControlled: true,
//    builder: (context) {
//      return BeneficiaryBottomSheet();
//    },
//  );
//}
//
//void showSelectRangeBottomSheet(BuildContext context) {
//  showModalBottomSheet(
//    context: context,
//    barrierColor: barrierColor,
//    shape: _roundedRectangleBorder,
//    isScrollControlled: true,
//    builder: (context) {
//      return SelectRangeBottomSheet();
//    },
//  );
//}
//
//void showAddRecipientToBulkTransferBottomSheet(BuildContext context) {
//  showModalBottomSheet(
//    context: context,
//    barrierColor: barrierColor,
//    shape: _roundedRectangleBorder,
//    isScrollControlled: true,
//    builder: (context) {
//      return AddRecipientToBulkTransferBottomSheet();
//    },
//  );
//}
//
//
//void showAddInvoiceItemBottomSheet(BuildContext context, {Function(Map<String, dynamic> value) onAddItem}) {
//  showModalBottomSheet(
//    context: context,
//    barrierColor: barrierColor,
//    shape: _roundedRectangleBorder,
//    isScrollControlled: true,
//    builder: (context) {
//      return AddInvoiceItemBottomSheet(onAddItem: onAddItem,);
//    },
//  );
//}
//
//void showMoreFromVirtualCardBottomSheet(BuildContext context, VirtualCardModel virtualCardModel) {
//  showModalBottomSheet(
//    context: context,
//    barrierColor: barrierColor,
//    shape: _roundedRectangleBorder,
//    isScrollControlled: true,
//    builder: (context) {
//      return MoreFromVirtualCardBottomSheet(
//        virtualCardModel: virtualCardModel,
//      );
//    },
//  );
//}
//
//void showPaymentLinkOptionsBottomSheet(BuildContext context) {
//  showModalBottomSheet(
//    context: context,
//    barrierColor: barrierColor,
//    shape: _roundedRectangleBorder,
//    isScrollControlled: true,
//    builder: (context) {
//      return PaymentLinkOptionsBottomSheet();
//    },
//  );
//}
//
//void showReserveActionsBottomSheet(BuildContext context) {
//  showModalBottomSheet(
//    context: context,
//    barrierColor: barrierColor,
//    shape: _roundedRectangleBorder,
//    isScrollControlled: true,
//    builder: (context) {
//      return ReserveFundsActionBottomSheet();
//    },
//  );
//}
//
//void showCancelLoanBottomSheet(BuildContext context) {
//  showModalBottomSheet(
//    context: context,
//    barrierColor: barrierColor,
//    shape: _roundedRectangleBorder,
//    isScrollControlled: true,
//    builder: (context) {
//      return CancelLoanBottomSheet();
//    },
//  );
//}