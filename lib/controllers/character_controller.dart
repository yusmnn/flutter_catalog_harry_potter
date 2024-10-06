import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../models/get_all_character_response_model.dart';
import '../models/get_character_by_house_response_model.dart';
import '../models/get_character_by_id_response_model.dart';
import 'endpoint.dart';

class CharacterController extends GetxController {
  var characterByHouse = <GetCharacterByHouseResponseModel>[].obs;
  var characters = <GetAllCharacterResponseModel>[].obs;
  final Dio dio = Dio();
  var isLoading = true.obs;
  var searchCharacter = Rxn<GetCharacterByIdResponseModel>();

  Future<void> getAllCharacter() async {
    try {
      isLoading(true);
      final response = await dio.get(
        '${Endpoint.baseUrl}characters',
      );
      if (response.statusCode == 200) {
        List data = response.data;
        characters.value = data
            .map((character) => GetAllCharacterResponseModel.fromMap(character))
            .toList();
        log(characters.toString());
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> getCharacterById({required String id}) async {
    try {
      isLoading(true);
      final response = await dio.get(
        '${Endpoint.baseUrl}character/$id',
      );
      log(response.data.toString());
      log('${Endpoint.baseUrl}character/$id');

      if (response.statusCode == 200) {
        final data = response.data.first;
        searchCharacter.value = GetCharacterByIdResponseModel.fromJson(data);
        log(searchCharacter.value.toString());
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> getCharacterByHouse({required house}) async {
    try {
      isLoading(true);
      final response = await dio.get(
        '${Endpoint.baseUrl}characters/house/$house',
        queryParameters: {
          'house': house,
        },
      );
      if (response.statusCode == 200) {
        List data = response.data;
        characterByHouse.value = data
            .map((characterByHouse) =>
                GetCharacterByHouseResponseModel.fromMap(characterByHouse))
            .toList();
        log(characters.toString());
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
