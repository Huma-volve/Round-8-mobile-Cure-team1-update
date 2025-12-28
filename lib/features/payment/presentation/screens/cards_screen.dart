import 'package:cure_team_1_update/core/common/widgets/custom_app_bar.dart';
import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/utils/app_toast.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:cure_team_1_update/core/utils/styles_text_manager.dart';
import 'package:cure_team_1_update/features/payment/presentation/widgets/build_empity_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/custom_widgets.dart';
import '../../data/models/card_model.dart';
import 'add_card_screen.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  List<CardModel> _cards = [];
  bool _isLoading = true;
  String? _loadError;

  @override
  void initState() {
    super.initState();
    _loadCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsLight.scaffoldBackground,
      appBar: CustomAppBar(
        title: 'My Cards',
        onPressed: () {
          GoRouter.of(context).canPop() ? GoRouter.of(context).pop() : null;
        },
      ),
      body: _buildBody(),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24.0.r),
        child: CustomButton(
          text: '+  Add Card',
          onPressed: _addCard,
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_loadError != null) {
      return _buildErrorState();
    }
    if (_cards.isEmpty) {
      return buildEmptyState(context: context);
    }
    return _buildCardList();
  }

  Widget _buildErrorState() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _loadError ?? 'Failed to load cards.',
              style: StyleTextHelper.textStyle14Regular(context),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            CustomButton(text: 'Retry', onPressed: _loadCards),
          ],
        ),
      ),
    );
  }

  Widget _buildCardList() {
    return ListView.builder(
      padding: EdgeInsets.all(18.0.r),
      itemCount: _cards.length,
      itemBuilder: (context, index) {
        final card = _cards[index];
        return InkWell(
          onTap: card.isDefault ? null : () => _setDefaultCard(card),
          borderRadius: BorderRadius.circular(12.r),
          child: Container(
            margin: EdgeInsets.only(bottom: 16.h),
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: ColorsLight.inputFill,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  _brandAsset(card.brand),
                  width: 18.w,
                  height: 18.w,
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${card.brand} ${card.maskedNumber}',
                        style: StyleTextHelper.textStyle16Regular(context),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Exp ${card.expiryLabel}',
                        style: StyleTextHelper.textStyle12Regular(context)
                            .copyWith(color: ColorsLight.textGrey),
                      ),
                    ],
                  ),
                ),
                if (card.isDefault)
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: ColorsLight.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      'Default',
                      style: StyleTextHelper.textStyle12Regular(context)
                          .copyWith(color: ColorsLight.primaryColor),
                    ),
                  ),
                SizedBox(width: 8.w),
                Icon(
                  card.isDefault
                      ? Icons.radio_button_checked
                      : Icons.radio_button_off,
                  color: card.isDefault
                      ? ColorsLight.primaryColor
                      : ColorsLight.textGrey,
                  size: 12.sp,
                ),
                PopupMenuButton<String>(
                  icon: Icon(
                    Icons.more_vert,
                    color: ColorsLight.textGrey,
                    size: 16.sp,
                  ),
                  onSelected: (value) {
                    if (value == 'default') {
                      _setDefaultCard(card);
                    } else if (value == 'edit') {
                      _editCard(card);
                    } else if (value == 'delete') {
                      _deleteCard(card);
                    }
                  },
                  itemBuilder: (context) {
                    final items = <PopupMenuEntry<String>>[];
                    if (!card.isDefault) {
                      items.add(
                        const PopupMenuItem(
                          value: 'default',
                          child: Text('Set default'),
                        ),
                      );
                    }
                    items.add(
                      const PopupMenuItem(
                        value: 'edit',
                        child: Text('Edit'),
                      ),
                    );
                    items.add(
                      const PopupMenuItem(
                        value: 'delete',
                        child: Text('Delete'),
                      ),
                    );
                    return items;
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _loadCards() async {
    setState(() {
      _isLoading = true;
      _loadError = null;
    });
    try {
      final api = getIt<ApiServices>();
      final response = await api.get('saved-cards');
      final cards = CardModel.listFromResponse(response);
      if (!mounted) {
        return;
      }
      setState(() {
        _cards = cards;
      });
    } on DioException catch (error) {
      if (!mounted) {
        return;
      }
      final message = _extractErrorMessage(error);
      setState(() {
        _loadError = message;
      });
      AppToast.show(context, message);
    } catch (_) {
      if (!mounted) {
        return;
      }
      setState(() {
        _loadError = 'Failed to load cards.';
      });
      AppToast.show(context, 'Failed to load cards.');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _addCard() async {
    final newCard = await Navigator.push<CardModel>(
      context,
      MaterialPageRoute(builder: (_) => const AddCardScreen()),
    );
    if (newCard != null) {
      _loadCards();
    }
  }

  Future<void> _editCard(CardModel card) async {
    final updated = await Navigator.push<CardModel>(
      context,
      MaterialPageRoute(builder: (_) => AddCardScreen(card: card)),
    );
    if (updated != null) {
      _loadCards();
    }
  }

  Future<void> _deleteCard(CardModel card) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete card'),
        content: const Text('Are you sure you want to delete this card?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirmed != true) {
      return;
    }
    try {
      final api = getIt<ApiServices>();
      await api.delete('saved-cards/${card.id}');
      if (!mounted) {
        return;
      }
      AppToast.show(context, 'Card deleted successfully.');
      _loadCards();
    } on DioException catch (error) {
      if (!mounted) {
        return;
      }
      AppToast.show(context, _extractErrorMessage(error));
    } catch (_) {
      if (!mounted) {
        return;
      }
      AppToast.show(context, 'Failed to delete card.');
    }
  }

  Future<void> _setDefaultCard(CardModel card) async {
    try {
      final api = getIt<ApiServices>();
      await api.put('saved-cards/${card.id}/default', {});
      if (!mounted) {
        return;
      }
      setState(() {
        _cards = _cards
            .map((item) => item.copyWith(isDefault: item.id == card.id))
            .toList();
      });
      AppToast.show(context, 'Default card updated.');
    } on DioException catch (error) {
      if (!mounted) {
        return;
      }
      AppToast.show(context, _extractErrorMessage(error));
    } catch (_) {
      if (!mounted) {
        return;
      }
      AppToast.show(context, 'Failed to update default card.');
    }
  }

  String _brandAsset(String brand) {
    final normalized = brand.toLowerCase();
    if (normalized.contains('visa')) {
      return Assets.paymentVisa;
    }
    return Assets.paymentIcOutlinePaypal;
  }
}

String _extractErrorMessage(DioException error) {
  final data = error.response?.data;
  if (data is Map<String, dynamic> && data['message'] is String) {
    return data['message'] as String;
  }
  if (error.response?.statusCode == 401) {
    return 'Please log in to manage cards.';
  }
  return 'Failed to reach server. Try again.';
}
