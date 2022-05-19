import 'package:crowdsource/Frontend/Pages/HomePages/Participant/EventPage/participant_event_detail_screen.dart';
import 'package:crowdsource/Utilities/import.dart';
import 'package:crowdsource/Frontend/Pages/HomePages/Influencer/EventPage/EventType/create_new_event.dart';
import 'package:crowdsource/Utilities/utils.dart';
import 'package:crowdsource/backend/Providers/provider_event.dart';
import 'package:crowdsource/backend/models/model_events.dart';
import 'package:provider/provider.dart';

class InfluencerEventScreen extends StatelessWidget {
  const InfluencerEventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context);
    List<Event> eventList = eventProvider.eventList;

    return Padding(
      padding: kSingleHorizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: kHalfVertical,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TitleHeading(title: "Events"),
                ActionButton(
                  title: "New",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateNewEventScreen(),
                      ),
                    );
                  },
                  svg: "assets/icons/icon_add.svg",
                  color: kPrimaryText,
                  textColor: kPrimaryLight,
                ),
              ],
            ),
          ),
          SizedBox(
            height: getHeight(540),
            child: eventList.isEmpty
                ? Center(
                    child: Text(
                    " Create Some Catalog",
                    style: kStyleParagraph,
                  ))
                : ListView.builder(
                    itemCount: eventList.length,
                    itemBuilder: (context, index) {
                      final event = eventList[index];

                      return PostCard(
                        date: Utils.dateFormat(event.dateTime),
                        month: Utils.monthFormat(event.dateTime),
                        isEvent: event.isEvent,
                        isOnline: event.isOnline,
                        postTitle: event.postTitle,
                        profilePic: event.influencerProfile,
                        posterImg: event.posterUrl,
                        time: Utils.timeFormat(event.dateTime),
                        onTap: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ParticipantEventDetailScreen(
                                date: Utils.dateFormat(event.dateTime),
                                month: Utils.monthFormat(event.dateTime),
                                isEvent: event.isEvent,
                                isOnline: event.isOnline,
                                postTitle: event.postTitle,
                                profilePic: event.influencerProfile,
                                posterImg: event.posterUrl,
                                time: Utils.timeFormat(event.dateTime),
                                eventCreator: event.influencerName,
                                agenda: event.agenda,
                              ),
                            ),
                          );
                        },
                      );
                    }),
          )
        ],
      ),
    );
  }
}
