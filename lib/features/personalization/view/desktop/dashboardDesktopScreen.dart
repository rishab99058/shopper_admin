import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopper_admin/common/widgets/cards/dashboard_card.dart';
import 'package:shopper_admin/common/widgets/layout/container/roundedContainer.dart';
import 'package:shopper_admin/features/personalization/controller/dashboardController.dart';
import 'package:shopper_admin/utils/constants/colors.dart';
import 'package:shopper_admin/utils/constants/sizes.dart';

class DashboardDesktopScreen extends StatelessWidget {
  const DashboardDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Dashboard', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: AppSizes.spaceBtwSections),

        // Responsive Grid
        LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount = 1;
            if (constraints.maxWidth >= AppSizes.desktopScreenSize) {
              crossAxisCount = 4;
            } else if (constraints.maxWidth >= AppSizes.tabletScreenSize) {
              crossAxisCount = 2;
            }

            return GridView.builder(
              shrinkWrap: true,
              itemCount: 4,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: AppSizes.defaultSpace,
                crossAxisSpacing: AppSizes.defaultSpace,
                mainAxisExtent: 135, // Reduced height for smaller cards
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
            );
          },
        ),

        const SizedBox(height: AppSizes.spaceBtwSections),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Obx(
                    () => AppRoundedContainer(
                      width: double.infinity,
                      height: 500,
                      padding: const EdgeInsets.all(AppSizes.md),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Weekly Sales', style: Theme.of(context).textTheme.headlineSmall),
                          const SizedBox(height: AppSizes.spaceBtwSections),
                          SizedBox(
                            height: 350,
                            child: LineChart(
                              LineChartData(
                                gridData: FlGridData(
                                  show: true,
                                  drawVerticalLine: false,
                                  horizontalInterval: 50,
                                  getDrawingHorizontalLine: (value) {
                                    return FlLine(
                                      color: AppColors.grey.withOpacity(0.2),
                                      strokeWidth: 1,
                                    );
                                  },
                                ),
                                titlesData: FlTitlesData(
                                  show: true,
                                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                  bottomTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      interval: 1,
                                      getTitlesWidget: (value, meta) {
                                        const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                                        if (value >= 0 && value < days.length) {
                                          return Padding(
                                            padding: const EdgeInsets.only(top: 10.0),
                                            child: Text(days[value.toInt()], style: Theme.of(context).textTheme.labelMedium),
                                          );
                                        }
                                        return const Text('');
                                      },
                                    ),
                                  ),
                                  leftTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      interval: 50,
                                      reservedSize: 40,
                                      getTitlesWidget: (value, meta) {
                                        return Text(value.toInt().toString(), style: Theme.of(context).textTheme.labelMedium);
                                      },
                                    ),
                                  ),
                                ),
                                borderData: FlBorderData(show: false),
                                minX: 0,
                                maxX: 6,
                                minY: 0,
                                maxY: 300,
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: controller.chartData.asMap().entries.map((entry) {
                                      return FlSpot(entry.key.toDouble(), entry.value);
                                    }).toList(),
                                    isCurved: true,
                                    color: AppColors.primary,
                                    barWidth: 4,
                                    isStrokeCapRound: true,
                                    dotData: const FlDotData(show: false),
                                    belowBarData: BarAreaData(
                                      show: true,
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          AppColors.primary.withOpacity(0.3),
                                          AppColors.primary.withOpacity(0.0),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSizes.defaultSpace),
                  AppRoundedContainer(
                    width: double.infinity,
                    height: 800,
                    child: Text('Hello'),
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSizes.defaultSpace),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  AppRoundedContainer(
                    width: double.infinity,
                    height: 800,
                    child: Text('Hello'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
