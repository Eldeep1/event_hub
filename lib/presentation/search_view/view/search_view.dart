import 'package:easy_localization/easy_localization.dart';
import 'package:event_hub/presentation/search_view/view/widgets/search_view_event_card_builder.dart';
import 'package:event_hub/presentation/search_view/view/widgets/search_view_search_bar.dart';
import 'package:event_hub/presentation/search_view/view_model/search_cubit.dart';
import 'package:event_hub/presentation/search_view/view_model/search_state.dart';
import 'package:event_hub/domain/repository/event_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SearchCubit(repo: RepositoryProvider.of<EventRepository>(context)),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black, size: 28),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            context.tr('search'),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: false,
        ),
        body: Column(
          children: [
            const SizedBox(height: 16),
            SearchViewSearchBar(),
            const SizedBox(height: 24),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state.filteredEvents.isEmpty) {
                    return Center(
                      child: Text(
                        context.tr('no_events_found'),
                        style: const TextStyle(color: Colors.grey),
                      ),
                    );
                  }
                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    itemCount: state.filteredEvents.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      return SearchViewEventCardBuilder(
                        event: state.filteredEvents[index],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
