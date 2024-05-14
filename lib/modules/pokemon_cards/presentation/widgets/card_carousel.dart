import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_v2/global/routes/app_router.gr.dart';
import 'package:pokedex_v2/modules/pokemon_cards/domain/entities/pokemon_entity.dart';

class CardCarousel extends StatefulWidget {
  final List<PokemonEntity> pokemonList;

  const CardCarousel({super.key, required this.pokemonList});

  @override
  State<CardCarousel> createState() => _CardCarouselState();
}

class _CardCarouselState extends State<CardCarousel> {
  int currentPokemonIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: widget.pokemonList.length,
        itemBuilder: (context, ind, inde) {
          return GestureDetector(
            onTap: (){
              context.router.push(PokemonDetailsRoute(id: widget.pokemonList[ind].id!));
            },
            child: CachedNetworkImage(
              imageUrl: widget.pokemonList[ind].images!.large,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          );
        },
        options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.55,
        enlargeCenterPage: true,
        viewportFraction: 0.7,
        enableInfiniteScroll: false,
        onPageChanged: (pageViewIndex, _) {
          setState(() {
            currentPokemonIndex = pageViewIndex;
          });
        },
      ),);
  }
}
