import 'package:web_scraper/web_scraper.dart';

import '../../core/constants/constants.dart';
import '../../data/repositories/repositories.dart';
import '../../external/external.dart';

final webScraper = WebScraper(UrlConst.domain);

final webScraperDatasource = WebScraperDatasource(webScraper);

WebScraperRepository buildWebScraperRepository() =>
    WebScraperRepository(webScraperDatasource);
