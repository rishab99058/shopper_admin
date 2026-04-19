import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopper_admin/common/widgets/cards/dashboard_card.dart';
import 'package:shopper_admin/utils/constants/colors.dart';
import 'package:shopper_admin/utils/constants/sizes.dart';

class DashboardMobileScreen extends StatelessWidget {
  const DashboardMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dashboard',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: AppSizes.spaceBtwSections),

        // Responsive Grid (1 column for mobile)
        GridView.builder(
          shrinkWrap: true,
          itemCount: 4,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: AppSizes.defaultSpace,
            crossAxisSpacing: AppSizes.defaultSpace,
            mainAxisExtent: 135, 
          ),
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return const DashboardStatCard(
                  title: 'Sales total',
                  amount: '\$45,401.34',
                  icon: Iconsax.direct_right,
                  color: AppColors.primary,
                  percentage: 117.4,
                  subtitle: 'Compared to 2025',
                );
              case 1:
                return const DashboardStatCard(
                  title: 'Average Order Value',
                  amount: '\$150.20',
                  icon: Iconsax.shopping_bag,
                  color: AppColors.success,
                  percentage: 5.2,
                  subtitle: 'Compared to Jan 2025',
                );
              case 2:
                return const DashboardStatCard(
                  title: 'Total Orders',
                  amount: '350',
                  icon: Iconsax.card,
                  color: AppColors.darkGrey,
                  percentage: -2.4,
                  subtitle: 'Compared to Jan 2025',
                );
              case 3:
                return const DashboardStatCard(
                  title: 'Visitors',
                  amount: '25,035',
                  icon: Iconsax.user,
                  color: AppColors.info,
                  percentage: 15.3,
                  subtitle: 'Compared to Jan 2025',
                );
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
