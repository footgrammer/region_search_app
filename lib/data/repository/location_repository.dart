import 'dart:convert';
import 'package:http/http.dart';
import 'package:region_search_app/data/dto/location_response_dto.dart';
import 'package:region_search_app/data/model/location.dart';

class LocationRepository {
  // DTO 를 응답받아서 List<Book> 으로 가공해서 반환
  Future<List<Location>?> search(String query) async {
    // 네트워크 통신할 땐 반드시 try catch문 감싸기!
    // 모바일에서 인터넷 없을 수도 있고 서버가 응답안하는 경우 등 다양한 예외가 있음!
    try {
      Client client = Client();
      Response result = await client.get(
        Uri.parse(
          'https://openapi.naver.com/v1/search/local.json?query=$query',
        ),
        headers: {
          'X-Naver-Client-Id': 'NP54fYDgElygOGcnvCAD',
          'X-Naver-Client-Secret': 'LUPrPrB7bz',
        },
      );

      // GET 요청 성공 시 응답코드 200을 반환
      if (result.statusCode == 200) {
        LocationResponseDto dto = LocationResponseDto.fromJson(
          jsonDecode(result.body),
        );
        return dto.items;
      }
      return null;
    } catch (e) {
      // 에러나면 확인해보기!
      print(e);
      return null;
    }
  }
}
