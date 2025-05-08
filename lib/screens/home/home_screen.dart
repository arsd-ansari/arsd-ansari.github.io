import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:arshad_portfolio/components/draggable_scroll_list.dart';
import 'package:flutter/material.dart';
import 'package:arshad_portfolio/modals/Project.dart';
import 'package:arshad_portfolio/modals/Recommendation.dart';
import 'package:arshad_portfolio/responsive.dart';
import 'package:arshad_portfolio/screens/main/main_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainScreen(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HomeBanner(context),
            Summary(context),
            Recommendations(context),
            MyProjects(context),
          ],
        )
      ],
    );
  }

  Widget HomeBanner(BuildContext context) {
    return AspectRatio(
      aspectRatio: Responsive.isMobile(context) ? 2.5 : 3,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/port.jpg",
            fit: BoxFit.cover,
          ),
          Container(color: darkColor.withOpacity(0.66)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Imagination is more important \nthan knowledge!",
                  style: Responsive.isDesktop(context)
                      ? Theme.of(context).textTheme.headlineLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )
                      : Theme.of(context).textTheme.headlineSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                ),
                if (Responsive.isMobileLarge(context))
                  const SizedBox(height: defaultPadding / 2),
                MyBuildAnimatedText(context),
                SizedBox(height: defaultPadding),
                if (!Responsive.isMobileLarge(context))
                  ElevatedButton(
                    onPressed: () {
                      _launchUrl(
                          "https://www.linkedin.com/in/arshad-ansari-flutter-developer");
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: defaultPadding * 2,
                          vertical: defaultPadding),
                      backgroundColor: primaryColor,
                    ),
                    child: Text(
                      "EXPLORE NOW",
                      style: TextStyle(color: darkColor),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget MyBuildAnimatedText(BuildContext context) {
    return DefaultTextStyle(
      // it applies same style to all the widgets under it
      style: Theme.of(context).textTheme.bodyLarge!,
      maxLines: 1,
      child: Row(
        children: [
          if (!Responsive.isMobileLarge(context))
            SizedBox(width: defaultPadding / 2),
          Text("I build "),
          Responsive.isMobile(context)
              ? Expanded(child: AnimatedText())
              : AnimatedText(),
          if (!Responsive.isMobileLarge(context))
            SizedBox(width: defaultPadding / 2),
        ],
      ),
    );
  }

  Widget AnimatedText() {
    return AnimatedTextKit(
      animatedTexts: [
        TyperAnimatedText(
          "Movie App with Firebase and many more.",
          speed: Duration(milliseconds: 60),
        ),
        TyperAnimatedText(
          "complete Fantasy, POS App, travel apps.",
          speed: Duration(milliseconds: 60),
        ),
        TyperAnimatedText(
          "responsive web and mobile app with backend",
          speed: Duration(milliseconds: 60),
        ),
      ],
    );
  }

  Widget Summary(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Summary",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: defaultPadding),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(right: defaultPadding),
              child: SummaryCard(
                  context: context,
                  text:
                      'Experienced Flutter developer with over 3.8 years of expertise in building cross-platform applications for Android, iOS, and the web using Flutter and FlutterFlow. Proficient in Flutter widgets, state management (Provider,Riverpod, Bloc), Git, Firebase, WebSockets, GraphQL, and RESTful API integrations. Skilled in implementing payment gateways and real-time features with a strong command of cloud services like Firebase. Possess a track record of successful project deliveries, including client-facing communication and collaboration. Strong problem-solving abilities, attention to detail, and an excellent communicator, adept at working both independently and within team environments'),
            ),
          ),
        ],
      ),
    );
  }

  Widget SummaryCard({required String text, required BuildContext context}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      padding: EdgeInsets.all(defaultPadding),
      color: secondaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text),
        ],
      ),
    );
  }

  Widget Recommendations(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Professional Experience",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: defaultPadding),
          DraggableScrollList(recommendations: demo_recommendations),
        ],
      ),
    );
  }

  Widget MyProjects(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "My Projects",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: defaultPadding),
        Responsive(
          mobile: ProjectsGridView(
            crossAxisCount: 1,
            childAspectRatio: 1.7,
          ),
          mobileLarge:
              ProjectsGridView(crossAxisCount: 2, childAspectRatio: 1.3),
          tablet: ProjectsGridView(childAspectRatio: 1.1, crossAxisCount: 3),
          desktop: ProjectsGridView(
            crossAxisCount: 3,
            childAspectRatio: 1.3,
          ),
        )
      ],
    );
  }

  Widget ProjectsGridView(
      {required int crossAxisCount, required double childAspectRatio}) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: demo_projects.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
      ),
      itemBuilder: (context, index) =>
          ProjectCard(project: demo_projects[index], context: context),
    );
  }

  Widget ProjectCard({Project? project, required BuildContext context}) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      color: secondaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project!.title!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Spacer(),
          Text(
            project.description!,
            maxLines: Responsive.isMobileLarge(context) ? 3 : 4,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(height: 1.5),
          ),
          Spacer(),
          TextButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return new AlertDialog(
                      content: new Text(project.description!),
                    );
                  });
            },
            child: Text(
              "Read More >>",
              style: TextStyle(color: primaryColor),
            ),
          ),
        ],
      ),
    );
  }

  void _launchUrl(String urls) async {
    final url = urls;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
