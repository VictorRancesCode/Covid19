import 'dart:async';

import 'package:covid/widgets/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class CoronavirusMap extends StatefulWidget {
  @override
  _CoronavirusMap createState() => _CoronavirusMap();
}

class _CoronavirusMap extends State<CoronavirusMap> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("CoronavirusMap"),
      ),
      body: SafeArea(child: Panels()),
    );
  }
}

class Panels extends StatelessWidget {
  final frontPanelVisible = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Backdrop(
      frontLayer: FrontPanel(),
      backLayer: BackPanel(
        frontPanelOpen: frontPanelVisible,
      ),
      frontHeader: FrontPanelTitle(),
      panelVisible: frontPanelVisible,
      frontPanelOpenHeight: 40.0,
      frontHeaderHeight: 48.0,
      frontHeaderVisibleClosed: true,
    );
  }
}

class FrontPanelTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0),
      child: Text(
        'Detail',
        style: Theme.of(context).textTheme.subhead,
      ),
    );
  }
}

class FrontPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).cardColor,
        child: Center(child: Text('Hello world')));
  }
}

class BackPanel extends StatefulWidget {
  BackPanel({@required this.frontPanelOpen});

  final ValueNotifier<bool> frontPanelOpen;

  @override
  createState() => _BackPanelState();
}

class _BackPanelState extends State<BackPanel> {
  CameraPosition _initialPosition =
      CameraPosition(target: LatLng(-16.391306, -64.506440), zoom: 5.6);

  GoogleMapController mapController;

  bool panelOpen;

  @override
  initState() {
    super.initState();
    panelOpen = widget.frontPanelOpen.value;
    widget.frontPanelOpen.addListener(_subscribeToValueNotifier);
    this._animateToUser();
  }

  void _subscribeToValueNotifier() =>
      setState(() => panelOpen = widget.frontPanelOpen.value);

  /// Required for resubscribing when hot reload occurs
  @override
  void didUpdateWidget(BackPanel oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.frontPanelOpen.removeListener(_subscribeToValueNotifier);
    widget.frontPanelOpen.addListener(_subscribeToValueNotifier);
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 40),
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: _initialPosition,
        rotateGesturesEnabled: false,
        scrollGesturesEnabled: true,
        tiltGesturesEnabled: false,
      ),
    );
  }

  Location location = new Location();

  _animateToUser() async {
    PermissionStatus _permissionGranted;
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.denied) {
        return;
      }
    }
    location.onLocationChanged.listen((LocationData currentLocation) {
      var pos = currentLocation;
      if (mapController != null) {
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(pos.latitude, pos.longitude),
              zoom: 17.0,
            ),
          ),
        );
      }
    });
  }
}
