import 'dart:convert';

import 'package:mega_animes/core/errors/errors.dart';
import 'package:web_scraper/web_scraper.dart';
import 'package:flutter/cupertino.dart';

import '../domain/errors/errors.dart';
import '../data/datasources/datasources.dart';
import '../data/models/models.dart';

class WebScraperDatasource implements ScrapingDatasource {
  final WebScraper webScraper;

  WebScraperDatasource(this.webScraper);

  @override
  Future<AnimesModel> getAnimes() async {
    try {
      debugPrint("-- EXEC WEBSCRAPING ANIMES --");
      final result = await webScraper.loadWebPage("/tv/");
      if (result) {
        final popularAnimes = getPopularAnime();
        final recentAnimes = getRecentAnime();
        final recentEpisodes = getRecentEpisodes();
        return AnimesModel(
          lastEpisodes: recentEpisodes,
          popularAnimes: popularAnimes,
          recentAnimes: recentAnimes,
        );
      }
      throw Exception;
    } catch (e) {
      debugPrint("-- ERROR ON GET ANIMES: TYPE ${e.toString()} --");
      throw onHandlersErrors(typeError: e);
    }
  }

  List<AnimeModel> getPopularAnime() {
    List<Map<String, dynamic>> elements =
        webScraper.getElement(".w_item_b > a", ["href"]);

    List<Map<String, dynamic>> src = webScraper
        .getElement("article.w_item_b > a > div.image > img ", ["src"]);

    List<Map<String, dynamic>> titleAnime =
        webScraper.getElement("article.w_item_b > a > div.data > h3", []);

    List<Map<String, dynamic>> yearAnime = webScraper
        .getElement("article.w_item_b > a > div.data > span.wdate", []);

    List<Map<String, dynamic>> rateAnime = webScraper
        .getElement("article.w_item_b > a > div.data > span.wextra > b", []);

    List<AnimeModel> animes = [];
    for (var index = 0; index < elements.length; index++) {
      final image = src[index]["attributes"]["src"] as String;
      final url = elements[index]["attributes"]["href"] as String;
      final title = titleAnime[index]["title"] as String;
      final year = yearAnime[index]["title"] as String;
      final rate = rateAnime[index]["title"] as String;
      animes.add(
        AnimeModel(
          rate: rate.trim(),
          title: title.trim(),
          url: url.trim(),
          year: year.trim(),
          image: image.trim(),
        ),
      );
    }
    return animes;
  }

  DetailsAnimeModel getDetails() {
    List<Map<String, dynamic>> descriptionAnime =
        webScraper.getElement(".wp-content > p", []);
    List<Map<String, dynamic>> generos =
        webScraper.getElement(".sgeneros > a", ["href"]);

    List<Map<String, dynamic>> relationsUrlAnimes =
        webScraper.getElement("#single_relacionados > article > a ", ["href"]);

    List<Map<String, dynamic>> relationsImagesAnimes =
        webScraper.getElement("article > a > img", ["src"]);

    List<Map<String, dynamic>> seasonsAnime =
        webScraper.getElement("#seasons > .se-c ", []);

    List<Map<String, dynamic>> title = webScraper.getElement(
      "#single > div.content > div.sheader > div.data > h1 ",
      [],
    );
    List<Map<String, dynamic>> year = webScraper.getElement(
      "#single > div.content > div.sheader > div.data > div.extra > span.date ",
      [],
    );
    List<Map<String, dynamic>> image = webScraper.getElement(
      "#single > div.content > div.sheader > div.poster > img",
      ["src"],
    );
    List<Map<String, dynamic>> date = webScraper.getElement(
      "#single > div.content > div.sheader > div.data > div.starstruck-wrap > span.dt_rating_vgs",
      [],
    );

    List<GenderModel> genders = [];
    List<AnimeModel> animes = [];
    List<SeasonModel> seasons = [];

    for (var indexSeason = 0;
        indexSeason < seasonsAnime.length;
        indexSeason++) {
      final formatChild = indexSeason == 0
          ? "first-child"
          : (indexSeason + 1) == seasonsAnime.length
              ? "last-child"
              : "nth-child($indexSeason)";
      List<Map<String, dynamic>> episodiosAnime = webScraper.getElement(
          "#seasons > div.se-c:$formatChild > div.se-a > ul.episodios > li",
          []);
      List<Map<String, dynamic>> urlEp = webScraper.getElement(
          "#seasons > div.se-c:$formatChild > div.se-a > ul.episodios > li > div.imagen > a",
          ["href"]);
      List<Map<String, dynamic>> imageEp = webScraper.getElement(
          "#seasons > div.se-c:$formatChild > div.se-a > ul.episodios > li > div.imagen > a > img",
          ["src"]);
      List<Map<String, dynamic>> date = webScraper.getElement(
          "#seasons > div.se-c:$formatChild > div.se-a > ul.episodios > li > div.episodiotitle > span.date",
          ["href"]);
      List<Map<String, dynamic>> episodiotitle = webScraper.getElement(
          "#seasons > div.se-c:$formatChild > div.se-a > ul.episodios > li > div.episodiotitle > a",
          ["href"]);
      List<Map<String, dynamic>> numerando = webScraper.getElement(
        "#seasons > div.se-c:$formatChild > div.se-a > ul.episodios > li > div.numerando",
        ["href"],
      );

      List<EpisodeModel> episodios = [];

      for (var i = 0; i < episodiosAnime.length; i++) {
        episodios.add(
          EpisodeModel(
            image: imageEp[i]["attributes"]["src"],
            episode: episodiotitle[i]["title"],
            numberEpisode: numerando[i]["title"],
            date: date[i]["title"],
            url: urlEp[i]["attributes"]["href"],
          ),
        );
      }
      seasons.add(
        SeasonModel(
          episodes: episodios,
          numberSeason: (indexSeason + 1).toString(),
          season: "Temporada ${indexSeason + 1}",
          totalSeansons: seasons.length,
        ),
      );
    }

    for (var n = 0; n < generos.length; n++) {
      genders.add(
        GenderModel(
          gender: generos[n]["title"].toString().trim(),
          url: generos[n]["attributes"]["href"],
        ),
      );
    }

    for (var indexRelations = 0;
        indexRelations < relationsUrlAnimes.length;
        indexRelations++) {
      animes.add(
        AnimeModel(
          title: "",
          image: relationsImagesAnimes[indexRelations]["attributes"]["src"],
          year: "",
          rate: "",
          url: relationsUrlAnimes[indexRelations]["attributes"]["href"],
        ),
      );
    }

    final description = descriptionAnime.last["title"] as String;

    return DetailsAnimeModel(
      description: description.trim(),
      season: seasons,
      generos: genders,
      relationsAnimes: animes,
      image: image.first["attributes"]["src"],
      rate: date.first["title"],
      title: title.first["title"],
      year: year.first["title"],
    );
  }

  List<AnimeModel> getRecentAnime() {
    List<Map<String, dynamic>> elements = webScraper.getElement(".tvshows", []);
    List<Map<String, dynamic>> src =
        webScraper.getElement(".tvshows > div.poster > a > img", ["src"]);
    List<Map<String, dynamic>> titleAnime =
        webScraper.getElement(".tvshows > div.data > h3", []);
    List<Map<String, dynamic>> rateAnime =
        webScraper.getElement(".tvshows > div.poster > div.rating", []);
    List<Map<String, dynamic>> urlAnimes =
        webScraper.getElement(".tvshows > div.poster > a", ["href"]);

    List<AnimeModel> animes = [];
    for (var index = 0; index < elements.length; index++) {
      final image = src[index]["attributes"]["src"] as String;
      final url = urlAnimes[index]["attributes"]["href"] as String;
      final title = titleAnime[index]["title"] as String;
      final rate = rateAnime[index]["title"] as String;
      animes.add(
        AnimeModel(
          rate: rate.trim(),
          title: title.trim(),
          url: url.trim(),
          year: "",
          image: image.trim(),
        ),
      );
    }
    return animes;
  }

  List<PosterModel> getRecentEpisodes() {
    List<Map<String, dynamic>> elements =
        webScraper.getElement(".episodes", []);
    List<Map<String, dynamic>> src =
        webScraper.getElement(".episodes > div.poster > a > img", ["src"]);
    List<Map<String, dynamic>> titleAnime =
        webScraper.getElement(".episodes > div.eptitle > h3", []);
    List<Map<String, dynamic>> traductionAnime =
        webScraper.getElement(".episodes > div.poster > span", []);
    List<Map<String, dynamic>> urlAnimes =
        webScraper.getElement(".episodes > div.poster > a", ["href"]);

    List<PosterModel> posters = [];
    for (var index = 0; index < elements.length; index++) {
      final image = src[index]["attributes"]["src"] as String;
      final url = urlAnimes[index]["attributes"]["href"] as String;
      final title = titleAnime[index]["title"] as String;
      final traduction = traductionAnime[index]["title"] as String;
      posters.add(PosterModel(
        image: image.trim(),
        url: url.trim(),
        title: title.trim(),
        traduction: traduction.trim(),
      ));
    }

    return posters;
  }

  List<GenderModel> getGenderScraping() {
    List<Map<String, dynamic>> content =
        webScraper.getElement(".wp-content > p > a", ["href"]);
    List<GenderModel> genders = [];
    for (var index = 0; index < content.length; index++) {
      final url = content[index]["attributes"]["href"] as String;
      final title = content[index]["title"] as String;

      genders.add(GenderModel(
        gender: title.trim(),
        url: url.trim(),
      ));
    }
    print(genders.toString());
    return genders;
  }

  @override
  Future<List<GenderModel>> getGender() async {
    try {
      debugPrint("-- EXEC WEBSCRAPING GENDERS --");
      final result = await webScraper.loadWebPage("/generos/");
      if (result) {
        return getGenderScraping();
      }
      throw Exception;
    } catch (e) {
      debugPrint("-- ERROR ON SEARCH GENDERS: TYPE ${e.toString()} --");
      throw onHandlersErrors(typeError: e);
    }
  }

  @override
  Future<List<AnimeModel>> searchAnimes(String? input) async {
    try {
      debugPrint("-- EXEC WEBSCRAPING ANIMES --");

      final url = input == null
          ? "/anime/"
          : input.contains("genero")
              ? "/genero${input.split('genero').last}"
              : "/search/$input";
      print(url);
      final result = await webScraper.loadWebPage(url);
      if (result) {
        final listRecentAnimes = getRecentAnime();
        if (listRecentAnimes.isEmpty) {
          throw ListAnimesEmpty();
        }
        return listRecentAnimes;
      }
      throw Exception;
    } catch (e) {
      debugPrint("-- ERROR ON SEARCH ANIMES: TYPE ${e.toString()} --");
      throw onHandlersErrors(typeError: e);
    }
  }

  @override
  Future<DetailsAnimeModel> getDetailsAnime(String input) async {
    try {
      debugPrint("-- EXEC WEBSCRAPING DETAILS ANIME --");

      final result =
          await webScraper.loadWebPage("/anime${input.split("anime").last}");
      if (result) {
        return getDetails();
      }
      throw Exception;
    } catch (e) {
      debugPrint("-- ERROR ON DETAILS ANIMES: TYPE ${e.toString()} --");
      throw onHandlersErrors(typeError: e);
    }
  }

  Failure onHandlersErrors({typeError}) {
    if (typeError is ListAnimesEmpty) {
      return ListAnimesEmpty(
          message: "Nenhum anime encontrado com esse termo!");
    }
    return ServerError(
        message: "Um erro inesperado aconteceu, tente novamente!");
  }

  @override
  Future<String> getVideoAnime(String input) async {
    try {
      debugPrint("-- EXEC WEBSCRAPING DETAILS ANIME --");

      final request = await webScraper
          .loadWebPage("/episodio/${input.split("episodio/").last}");
      if (request) {
        List<Map<String, dynamic>> content = webScraper.getElement(
            "#playex > div.playex > div#option-1 > iframe", ["src"]);
        final newUrl = content.last["attributes"]["src"];
        final newRequest = await webScraper.loadFullURL(newUrl);
        if (newRequest) {
          List<String> scripts = webScraper.getAllScripts();
          final script = scripts.first.trim();
          final function = script.replaceAll("var VIDEO_CONFIG =", '');
          final playUrl = json.decode(function);
          return playUrl["streams"][0]["play_url"];
        }
      }
      throw Exception;
    } catch (e) {
      debugPrint("-- ERROR ON DETAILS ANIMES: TYPE ${e.toString()} --");
      throw onHandlersErrors(typeError: e);
    }
  }
}
