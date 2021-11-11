import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rootallyai_task/bloc/database/database_bloc.dart';
import 'package:rootallyai_task/ui/common/bottom_navigation_bar.dart';
import 'package:rootallyai_task/ui/common/styles.dart';
import 'package:rootallyai_task/ui/dashboard/widgets/sessions_list_widget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              Text(
                "Good Morning Jane",
                style: textStyle2.copyWith(
                    fontSize: 36, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(
                "You have 4 sessions today",
                style: textStyle2.copyWith(
                  fontSize: 28,
                  color: Color(0xff4e4e4e),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: BlocBuilder<DatabaseBloc, DatabaseState>(
                  builder: (context, state) {
                    if (state is Fetching)
                      return Container(
                        width: size.width,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        ),
                      );
                    else if (state is DatabaseSuccess)
                      return SessionsListWidget(
                        sessions: state.sessions,
                      );
                    else
                      return Container();
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}

//bloc provider to pass instance of bloc down the widget gtree
class DatabaseBlocProvider extends StatelessWidget {
  const DatabaseBlocProvider({
    Key? key,
    this.userId,
  }) : super(key: key);

  final String? userId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DatabaseBloc()..add(GetSessions(userId!)),
      child: DatabaseListener(),
    );
  }
}

//bloc listener to listen to events from the database
class DatabaseListener extends StatelessWidget {
  const DatabaseListener({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<DatabaseBloc, DatabaseState>(
      listener: (context, state) {},
      child: Dashboard(),
    );
  }
}
