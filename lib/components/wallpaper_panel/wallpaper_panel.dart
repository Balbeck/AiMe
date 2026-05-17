import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/wallpaper_state.dart';
import 'wallpaper_panel_style.dart';

class WallpaperPanel extends StatefulWidget {
  final VoidCallback onBack;

  const WallpaperPanel({super.key, required this.onBack});

  @override
  State<WallpaperPanel> createState() => _WallpaperPanelState();
}

class _WallpaperPanelState extends State<WallpaperPanel> {
  List<String> _paths = [];

  @override
  void initState() {
    super.initState();
    _loadPaths();
  }

  Future<void> _loadPaths() async {
    final manifest = await AssetManifest.loadFromAssetBundle(rootBundle);
    final paths = manifest
        .listAssets()
        .where((p) => p.startsWith('lib/background_wallpapers/'))
        .toList()
      ..sort();
    if (mounted) setState(() => _paths = paths);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: WallpaperPanelStyle.backgroundColor,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: WallpaperPanelStyle.backButtonPadding,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: WallpaperPanelStyle.backIconColor,
                size: WallpaperPanelStyle.backIconSize,
              ),
              onPressed: widget.onBack,
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<String>(
              valueListenable: WallpaperState.current,
              builder: (context, currentPath, _) {
                return GridView.builder(
                  padding: WallpaperPanelStyle.gridPadding,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: WallpaperPanelStyle.gridCrossAxisCount,
                    crossAxisSpacing: WallpaperPanelStyle.gridSpacing,
                    mainAxisSpacing: WallpaperPanelStyle.gridSpacing,
                    childAspectRatio: WallpaperPanelStyle.thumbnailAspectRatio,
                  ),
                  itemCount: _paths.length,
                  itemBuilder: (_, i) {
                    final path = _paths[i];
                    final isSelected = path == currentPath;
                    return GestureDetector(
                      onTap: () => WallpaperState.select(path),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            WallpaperPanelStyle.thumbnailRadius,
                          ),
                          border: isSelected
                              ? Border.all(
                                  color: WallpaperPanelStyle.selectedBorderColor,
                                  width: WallpaperPanelStyle.selectedBorderWidth,
                                )
                              : null,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            isSelected
                                ? WallpaperPanelStyle.thumbnailRadius -
                                    WallpaperPanelStyle.selectedBorderWidth
                                : WallpaperPanelStyle.thumbnailRadius,
                          ),
                          child: Image.asset(path, fit: BoxFit.cover),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
