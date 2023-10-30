import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newspaper/core/client/api_dio.dart';
import 'package:newspaper/core/errors/failures.dart';
import 'package:newspaper/features/news/data/data_sources/news_remote_data_source.dart';
import 'package:newspaper/features/news/data/models/_models.dart';
import 'package:newspaper/features/news/data/repositories/_repositories.dart';
import 'package:newspaper/features/news/domain/entities/_entities.dart';
import 'package:newspaper/features/news/domain/repositories/_repositories.dart';
import 'package:newspaper/services/app_logger.dart';

part 'search_article_bloc.dart';
part 'search_article_event.dart';
part 'search_article_state.dart';
