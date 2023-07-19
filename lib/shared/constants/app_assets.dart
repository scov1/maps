abstract class AppAssets {
  static const images = _Images();
  static const svg = _Svg();
}

class _Images {
  const _Images();

  final String gis = 'assets/images/ic_gis.png';
  final String marker = 'assets/images/ic_marker.png';
}

class _Svg {
  const _Svg();
  final String google = 'assets/svg/ic_google.svg';
  final String osm = 'assets/svg/ic_osm.svg';
}
