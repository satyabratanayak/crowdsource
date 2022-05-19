import 'package:crowdsource/Frontend/Global/Widgets/widget_infocard.dart';
import 'package:crowdsource/Utilities/import.dart';
import 'package:crowdsource/backend/Providers/provider_event.dart';
import 'package:crowdsource/backend/models/model_events.dart';
import 'package:provider/provider.dart';

class InfluencerEventDetailScreen extends StatefulWidget {
  final Event event;
  final String eventLink;
  final String agenda;
  final String time;
  final String eventCreator;
  final String posterImg;
  final String profilePic;
  final String postTitle;
  final bool isOnline;
  final String date;
  final String month;
  const InfluencerEventDetailScreen({
    Key? key,
    required this.posterImg,
    required this.time,
    required this.profilePic,
    required this.postTitle,
    required this.isOnline,
    required this.date,
    required this.month,
    required this.eventCreator,
    required this.agenda,
    required this.eventLink,
    required this.event,
  }) : super(key: key);

  @override
  State<InfluencerEventDetailScreen> createState() => _InfluencerEventDetailScreenState();
}

class _InfluencerEventDetailScreenState extends State<InfluencerEventDetailScreen> {
  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    deleteEvent(EventProvider eventProvider, Event event, Function(void Function()) setState) {
      setState(() {
        isLoading = true;
      });
      eventProvider.deleteEvent(event);
      Navigator.pop(context);
      setState(() {
        isLoading = false;
      });
    }

    final eventProvider = Provider.of<EventProvider>(context);
    return Scaffold(
      backgroundColor: kPrimaryDark,
      appBar: const WidgetAppBar(
        isDetailPage: true,
      ),
      body: Column(
        children: [
          Container(
            height: getHeight(203),
            decoration: BoxDecoration(
              color: kSecondaryText,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(widget.posterImg),
              ),
            ),
          ),
          SizedBox(
            height: getHeight(415),
            child: SingleChildScrollView(
              child: Padding(
                padding: kFullHorizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: getHeight(30),
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(widget.profilePic),
                        ),
                        SizedBox(
                          width: getWidth(15),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.postTitle,
                              style: kStyleSecondaryBold,
                            ),
                            Text(
                              "by ${widget.eventCreator}",
                              style: kStyleSecondaryPara,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getHeight(30),
                    ),
                    InfoCard(
                      month: widget.month,
                      date: widget.date,
                      time: widget.time,
                      isEvent: true,
                      isOnline: widget.isOnline,
                    ),
                    const TitleHeading(title: "Agenda"),
                    Text(
                      widget.agenda,
                      style: kStyleParagraph,
                    ),
                    SizedBox(
                      height: getHeight(30),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: getHeight(80),
        color: kPrimaryLight,
        child: Padding(
          padding: kSingleHorizontal,
          child: Align(
            alignment: Alignment.centerRight,
            child: ActionButton(
              svg: "assets/icons/icon_trash.svg",
              width: getWidth(140),
              textColor: kPrimaryText,
              color: kContestIndicator,
              title: "Delete",
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  context: context,
                  builder: (_) => StatefulBuilder(
                    builder: (BuildContext context, setState) {
                      return WarningSheet(
                        warningNote:
                            "If you Delete this event/contest, you can not recover this it will be permanently deleted, if you don't want to delete this event/contest then just slide down the white sheet.",
                        primaryButtonText: "Delete Event",
                        onTapPrimary: () => deleteEvent(
                          eventProvider,
                          widget.event,
                          setState,
                        ),
                      );
                    },
                  ),
                ).then((value) => Navigator.pop(context));
              },
            ),
          ),
        ),
      ),
    );
  }
}
