import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:valetparking_subowner/utils/constants/exports.dart';

class ParkingTimerScreen extends StatefulWidget {
  const ParkingTimerScreen({super.key, required this.data});

  final Map data;

  @override
  State<ParkingTimerScreen> createState() => _ParkingTimerScreenState();
}

class _ParkingTimerScreenState extends State<ParkingTimerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              elevation: 0,
              backgroundColor: VColors.whiteColor,
              title: Padding(
                padding: EdgeInsets.only(right: 24.w),
                child: Text(
                  AppLocalizations.of(context)!.translate('parkingTimer')!,
                  style: VStyles.h4Bold(context),
                ),
              ),
              leading: null,
              floating: true,
              pinned: true,
              flexibleSpace: Container(
                color: VColors.whiteColor,
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 24.h),
            child: Column(
              children: [
                /// Timer
                CircularTimerWidget(
                  progressColor:
                  // widget.data['end']
                  // progressColor: _parseTime(_formatTime(widget.data['end']))
                  //     .isBefore(DateTime.now())
                  //     ?
                  VColors.primaryColor500,
                  // : VColors.error,
                  endTime: _convertToTimestamp(widget.data['end']),
// endTime: widget.data['end'],
                  // endTime: _getEndTime(_formatTimeToTimer(widget.data['end'])),
                ),

                /// Make Space
                SizedBox(height: 24.h),

                /// Order Details
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 24.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [AppBoxShadows.cardShadowTwo],
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Column(
                    children: [
                      /// Parking Name
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: VDeviceUtils.getScreenWidth(context) / 3.8,
                            child: Text(
                              '${AppLocalizations.of(context)!.translate('parkingArea')!}',
                              style: VStyles.bodyMediumSemiBold(context).copyWith(
                                color: VColors.greyScale700,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: VDeviceUtils.getScreenWidth(context) / 2.5,
                            child: Text(
                              widget.data['parkingArea'] == null ||
                                  widget.data['parkingArea']!
                                      .toString()
                                      .isEmpty
                                  ? ''
                                  : widget.data['parkingArea'] != null
                                  ? '${widget.data['parkingArea']![0].toUpperCase()}${widget.data['parkingArea']!.substring(1).toLowerCase()}'
                                  : '',
                              // widget.data['parkingArea'],
                              style: VStyles.bodyLargeBold(context),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),

                      /// Make Space
                      SizedBox(height: 20.h),

                      /// Parking Address
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: VDeviceUtils.getScreenWidth(context) / 3.8,
                            child: Text(
                              '${AppLocalizations.of(context)!.translate('address')!}',
                              style: VStyles.bodyMediumSemiBold(context).copyWith(
                                color: VColors.greyScale700,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: VDeviceUtils.getScreenWidth(context) / 2.5,
                            child: Text(
                              '${widget.data['lat']}, ${widget.data['lng']}',
                              style: VStyles.bodyLargeBold(context),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),

                      /// Make Space
                      SizedBox(height: 20.h),

                      /// Vehicle
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: VDeviceUtils.getScreenWidth(context) / 3.8,
                            child: Text(
                              '${AppLocalizations.of(context)!.translate('vehicle')!}',
                              style: VStyles.bodyMediumSemiBold(context).copyWith(
                                color: VColors.greyScale700,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: VDeviceUtils.getScreenWidth(context) / 2.5,
                            child: Text(
                              widget.data['typeCar'] == '1'
                                  ? 'Small car'
                                  : widget.data['typeCar'] == '2'
                                  ? 'Big car'
                                  : widget.data['typeCar'] == '3'
                                  ? 'Motorcycle'
                                  : 'Bycle',
                              style: VStyles.bodyLargeBold(context),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),

                      /// Make Space
                      SizedBox(height: 20.h),

                      /// Date
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: VDeviceUtils.getScreenWidth(context) / 3.8,
                            child: Text(
                              '${AppLocalizations.of(context)!.translate('date')!}',
                              style: VStyles.bodyMediumSemiBold(context).copyWith(
                                color: VColors.greyScale700,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: VDeviceUtils.getScreenWidth(context) / 2.5,
                            child: Text(
                              _formatDate(widget.data['date']),
                              style: VStyles.bodyLargeBold(context),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),

                      /// Make Space
                      SizedBox(height: 20.h),

                      /// Date
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: VDeviceUtils.getScreenWidth(context) / 3.8,
                            child: Text(
                              '${AppLocalizations.of(context)!.translate('duration')!}',
                              style: VStyles.bodyMediumSemiBold(context).copyWith(
                                color: VColors.greyScale700,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: VDeviceUtils.getScreenWidth(context) / 2.5,
                            child: Text(
                              '${widget.data['duration']} hours',
                              style: VStyles.bodyLargeBold(context),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),

                      /// Make Space
                      SizedBox(height: 20.h),

                      /// Date
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: VDeviceUtils.getScreenWidth(context) / 3.8,
                            child: Text(
                              '${AppLocalizations.of(context)!.translate('hours')!}',
                              style: VStyles.bodyMediumSemiBold(context).copyWith(
                                color: VColors.greyScale700,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: VDeviceUtils.getScreenWidth(context) / 2.1,
                            child: Text(
                              '${widget.data['start']} - ${widget.data['end']}',
                              style: VStyles.bodyLargeBold(context),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                /// Make Space
                SizedBox(height: 24.h),

                MainButtonWidget(
                  centerWidgetInButton: Text(
                    '${AppLocalizations.of(context)!.translate('extendParkingTime')!}',
                    style: VStyles.bodyLargeBold(context).copyWith(
                      color: VColors.whiteColor,
                    ),
                  ),
                  onTap: () async {
                    /// Create the Google Maps URL
                    String googleMapsUrl =
                        "https://www.google.com/maps/search/?api=1&query=${widget.data['lat']},${widget.data['lng']}";

                    /// Go to google maps
                    if (await canLaunch(googleMapsUrl)) {
                      await launch(googleMapsUrl);

                      /// Launch Google Maps
                    } else {
                      throw 'Could not open Google Maps.';
                    }
                  },
                  margin: EdgeInsets.zero,
                  buttonColor: VColors.primaryColor500,
                  boxShadow: [AppBoxShadows.buttonShadowOne],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatDate(String isoDate) {
    DateTime dateTime = DateTime.parse(isoDate);
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  DateTime _parseTimeToDateTime(String timeString) {
    try {
      // Use DateFormat.jm() to parse time like "3:00 PM"
      final DateFormat timeFormat = DateFormat.jm();
      return timeFormat.parse(timeString);
    } catch (e) {
      print("Error parsing time: $e");
      return DateTime.now(); // Fallback to current time on error
    }
  }

  int _convertToTimestamp(String timeString) {
    DateTime parsedTime = _parseTimeToDateTime(timeString);
    return parsedTime.millisecondsSinceEpoch; // or .secondsSinceEpoch if needed
  }
}


