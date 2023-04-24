import 'package:flutter/material.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_map_marker_cluster/src/rotate.dart';

class ClusterWidget extends StatelessWidget {
  final MarkerClusterNode cluster;
  final ClusterWidgetBuilder builder;
  final VoidCallback onTap;
  final Rotate? rotate;

  ClusterWidget({
    required this.cluster,
    required this.builder,
    required this.onTap,
    required this.rotate,
  }) : super(key: ObjectKey(cluster));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: rotate != null
          ? Transform.rotate(
              angle: rotate!.angle,
              origin: rotate!.origin,
              alignment: rotate!.alignment,
              child: builder(context, cluster.mapMarkers),
            )
          : builder(context, cluster.mapMarkers),
    );
  }
}
