import 'package:crowdsource/backend/Firebase/database_events.dart';
import 'package:crowdsource/backend/Providers/provider_event.dart';
import 'package:crowdsource/backend/models/model_events.dart';
import 'package:provider/provider.dart';
import '../../Utilities/import.dart';

class StreamEvent extends StatefulWidget {
  final Widget child;
  const StreamEvent({Key? key, required this.child}) : super(key: key);

  @override
  State<StreamEvent> createState() => _StreamEventState();
}

class _StreamEventState extends State<StreamEvent> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Event>>(
      stream: EventDatabase.readEvents(),
      builder: (context, AsyncSnapshot<List<Event>> snapshot) {
        final event = snapshot.data;
        final provider = Provider.of<EventProvider>(context);
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          default:
            if (snapshot.hasError) {
              return Center(
                child: Text("Something error ${snapshot.error}"),
              );
            } else {
              provider.setEvent(event!);
              return widget.child;
            }
        }
      },
    );
  }
}
