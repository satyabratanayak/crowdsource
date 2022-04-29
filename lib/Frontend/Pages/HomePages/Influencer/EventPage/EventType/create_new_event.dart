import 'package:crowdsource/Utilities/import.dart';
import 'package:crowdsource/Frontend/Pages/HomePages/Influencer/EventPage/EventType/choose_event_type.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class CreateNewEventScreen extends StatefulWidget {
  const CreateNewEventScreen({Key? key}) : super(key: key);

  @override
  State<CreateNewEventScreen> createState() => _CreateNewEventScreenState();
}

class _CreateNewEventScreenState extends State<CreateNewEventScreen> {
  PageController pageController = PageController(initialPage: 0);
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryDark,
      appBar: const WidgetAppBar(isDetailPage: true),
      body: PageView(
        controller: pageController,
        // physics: const NeverScrollableScrollPhysics(),
        children: [
          ChooseEventType(
            onTap: () => pageController.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut),
          ),
          CreateEventScreen(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
              pageController.animateToPage(0, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
            },
          )
        ],
      ),
    );
  }
}

class CreateEventScreen extends StatefulWidget {
  final VoidCallback onTap;
  const CreateEventScreen({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  String typeValue = "Online";
  final List<String> itemsType = ['Online', 'Offline'];
  DateTime datetime = DateTime.now();
  final date = DateFormat('dd-MM-yy').format(DateTime.now());
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final agendaController = TextEditingController();
  final linkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: kPrimaryDark,
                  height: getHeight(3),
                ),
                Container(
                  height: getHeight(203),
                  color: kPrimaryLight,
                  child: Padding(
                    padding: kSinglePad,
                    child: Container(
                      decoration: BoxDecoration(
                        color: kPrimaryDark,
                        borderRadius: kHalfCurve,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/icons/icon_camera.svg"),
                            SizedBox(height: getHeight(20)),
                            Text("Choose banner", style: kStyleParagraph)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: getHeight(480),
                  child: Padding(
                    padding: kFullHorizontal,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TitleHeading(title: "Basic Info"),
                          CustomTextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              } else if (value.length < 3) {
                                return 'area name is shorter than 3';
                              } else if (value.length > 14) {
                                return 'area name is larger than 14';
                              }
                              return null;
                            },
                            labelText: "Post Title",
                            textEditingController: titleController,
                            keyboardType: TextInputType.text,
                          ),
                          CustomTextFormField(
                            // textInputAction: TextInputAction.newline,
                            maxLines: 3,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              } else if (value.length < 3) {
                                return 'area name is shorter than 3';
                              } else if (value.length > 1000) {
                                return 'area name is larger than 14';
                              }
                              return null;
                            },
                            labelText: "Agenda",
                            textEditingController: agendaController,
                            keyboardType: TextInputType.multiline,
                          ),
                          const SizedBox(
                              // height: getHeight(10),
                              ),
                          const TitleHeading(title: "Choose Date & Time"),
                          Padding(
                            padding: kHalfHorizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ChooseButton(
                                  value: DateFormat('dd-MM-yy').format(datetime),
                                  onTap: () async {
                                    // showButtonsnack(context, "We are working on it, please try sign in with google");
                                    final date = await showDatePicker(
                                        context: context, initialDate: datetime, firstDate: DateTime(2020), lastDate: DateTime(2030));
                                    if (date == null) return;
                                    setState(() {
                                      datetime = date;
                                    });
                                  },
                                  svgPath: "assets/icons/icon_calender_bold.svg",
                                ),
                                ChooseButton(
                                  value: DateFormat('KK:mm a').format(datetime),
                                  onTap: () async {
                                    final newtime = await showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(datetime));
                                    if (newtime == null) return;
                                    final newDateTime = DateTime(datetime.year, datetime.month, datetime.day, newtime.hour, newtime.minute);
                                    setState(() {
                                      datetime = newDateTime;
                                    });
                                  },
                                  svgPath: "assets/icons/icon_time_bold.svg",
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: kHalfCurve,
                                    color: kPrimaryLight,
                                  ),
                                  height: getHeight(45),
                                  width: getWidth(90),
                                  child: Padding(
                                    padding: kHalfPad,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        SvgPicture.asset("assets/icons/icon_map_bold.svg"),
                                        SizedBox(
                                          width: getWidth(5),
                                        ),
                                        DropDownButton(
                                          onChanged: (value) => setState(() {
                                            typeValue = value ?? "Online";
                                          }),
                                          value: typeValue,
                                          items: itemsType,
                                          hint: 'Online',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const TitleHeading(title: "Event Registration Link"),
                          CustomTextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            labelText: "https://example.com",
                            textEditingController: linkController,
                            keyboardType: TextInputType.text,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: kSingleHorizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActionButton(
                  leadingIcon: true,
                  svg: "assets/icons/icon_back.svg",
                  title: "Back",
                  onTap: widget.onTap,
                ),
                ActionButton(
                  svg: "assets/icons/icon_next.svg",
                  title: "Done",
                  onTap: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      context: context,
                      builder: (_) => WarningSheet(
                        onTapPrimary: () {},
                        primaryButtonText: "Register Event",
                        warningNote:
                            "If you OPEN The link it will be marked as you registered this event/contest so, if you don't want to register this event/contest then just slide down the white sheet.",
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ChooseButton extends StatelessWidget {
  final String value;
  final String svgPath;
  const ChooseButton({
    Key? key,
    required this.onTap,
    required this.svgPath,
    required this.value,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
          height: getHeight(45),
          width: getWidth(90),
          decoration: BoxDecoration(
            color: kPrimaryLight,
            borderRadius: kHalfCurve,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(svgPath),
              SizedBox(
                width: getWidth(5),
              ),
              Text(
                value,
                style: kStyleParagraphSmall,
              ),
            ],
          )),
    );
  }
}

class DropDownButton extends StatelessWidget {
  final String? svgPath;
  final String? value;
  final String hint;
  final Function(String?)? onChanged;
  final List<String> items;
  const DropDownButton({
    Key? key,
    required this.onChanged,
    required this.value,
    required this.items,
    required this.hint,
    this.svgPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(45),
      decoration: BoxDecoration(borderRadius: kHalfCurve, color: kPrimaryLight),
      width: getWidth(50),
      child: DropdownButton(
        underline: Container(),
        iconSize: getWidth(15),
        iconEnabledColor: kSecondaryText,
        style: kStyleParagraphSmall,
        hint: Text(
          hint,
          style: kStyleParagraphSmall,
        ),
        alignment: Alignment.center,
        dropdownColor: kPrimaryDark,
        isExpanded: true,
        value: value,
        onChanged: onChanged,
        items: items.map(buildMenuItems).toList(),
      ),
    );
  }
}

DropdownMenuItem<String> buildMenuItems(String items) => DropdownMenuItem(
      value: items,
      child: Text(
        items,
        style: const TextStyle(fontWeight: FontWeight.w500, color: kSecondaryText),
      ),
    );
