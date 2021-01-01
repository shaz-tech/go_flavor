import 'package:flutter/material.dart';

import 'flavor_config.dart';
import 'flavor_device_info_dialog.dart';

class FlavorBanner extends StatelessWidget {
  final Widget child;
  final BannerConfig _bannerConfig;

  FlavorBanner({@required this.child, BannerConfig bannerConfig})
      : this._bannerConfig = bannerConfig ??
            BannerConfig(
                bannerName: FlavorConfig.instance.name,
                bannerColor: FlavorConfig.instance.color);

  @override
  Widget build(BuildContext context) {
    if (FlavorConfig.isProduction()) return child;

    return Stack(
      children: <Widget>[child, _buildBanner(context)],
    );
  }

  Widget _buildBanner(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: 50,
        height: 50,
        child: CustomPaint(
          painter: BannerPainter(
              message: _bannerConfig.bannerName,
              textDirection: Directionality.of(context),
              layoutDirection: Directionality.of(context),
              location: BannerLocation.topStart,
              color: _bannerConfig.bannerColor),
        ),
      ),
      onLongPress: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return DeviceInfoDialog();
            });
      },
    );
  }
}

class BannerConfig {
  final String bannerName;
  final Color bannerColor;

  BannerConfig({@required this.bannerName, @required this.bannerColor});
}
