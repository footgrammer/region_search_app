# 지역 검색 앱 만들기

## 📖 목차

1. **프로젝트 소개**

- 본 프로젝트는 flutter 숙련주차 개인과제로 Open API를 활용해서 지역검색 기능을 구현하는 프로젝트이다.

2. **주요기능**

   - Naver 검색 Open API 활용
   - Riverpod을 활용한 MVVM 구조

3. **개발기간**

- 2025년 4월 18일 - 2025년 4월 22일

4. **기술스택**

- Flutter

5. **프로젝트 파일 구조**

```jsx
lib/
│
├── main.dart
│
├── data/
│   ├── dto/
│   │   │
│   │   ├── location_response_dto.dart
│   ├── model/
│   │   │
│   │   ├── location.dart
│   ├── repository/
│   │   │
│   │   ├── location_repository.dart
├── pages/
│   ├── detail/                    // 상세 페이지
│   │   │
│   │   └── detail_page.dart
│   ├── home/                      // 홈 페이지
│   │   ├── widgets/
│   │   │     │
│   │   │     ├── home_card.dart
│   │   ├── home.dart
│   │   │
│   │   └── home_view_model.dart

```

---

# Trouble Shooting

## 1. 플러터 문법 실수

- 에러 메시지

```jsx

════════ Exception caught by widgets library ═══════════════════════════════════
Incorrect use of ParentDataWidget.
```

- 문제점

```dart
return Expanded(child: Column(children: [Text('hello')]));
```

<aside>
**❓에러가 난 이유**

</aside>

`Expanded` 위젯은 **`Column`, `Row`, `Flex`** 같은 **Flex 계열 위젯의 자식**으로만 사용할 수 있음.

---

### 2. ProviderScope 작성해 주기

- MVVM 패턴이 익숙하지 않은 탓에 쉬운 실수를 해 버렸다.
- 에러 메시지

```dart
Bad State: No ProviderScope found
```

⇒ 앱 위젯 트리 어디에도 `ProviderScope` 가 없어서 `ref.read` , `ref.watch` 등을 사용할 수가 없음

### ✅ 문제 원인

**앱의 가장 최상단에서 `ProviderScope`로 앱을 감싸지 않았다면**, Riverpod은 동작할 수 없어서 위와 같은 에러가 발생

### ✅ 해결 방법

- 최상단에서 `ProviderScope` 로 감싸주기

```dart
void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}
```

---

## 3. title에 html 태그가 포함되어 있음

### 🤬 에러

- Naver 검색 Open API에서 불러오는 데이터의 `title` 에 `<b></b>`와 같은 html 태그가 들어가 있어서 그것이 그대로 나타나게 됨
- `<b>전주</b>비빔밥` 이런 식으로 텍스트가 나오게 됨

### ✅ 시도한 방법

- html 태그가 적용된 텍스트가 나올 수 있는 방법을 찾아 봄
- `flutter_html` 을 통해서 태그가 적용된 텍스트를 보여줄 수 있음
- `flutter pub add flutter_html`

```dart
import 'package:flutter_html/flutter_html.dart';

...

String htmlData = "<b>굵게</b> <i>기울임</i> <u>밑줄</u>";

Html(
  data: htmlData,
)
```

---

### ✅ 마주한 문제점 1

- 위의 전주는 <b></b> 태그로 감싸져 있어서 <b></b> 태그에 스타일을 주면 됐는데 그 이외의 비빔밥은 태그로 안감싸져 있어서 스타일을 줄 수가 없었다.
- 아래처럼 b 태그는 스타일을 줄 수 있었지만 태그로 감싸지지 않은 텍스트는 스타일을 줄 수가 없었다.

```dart
Html(
  data: htmlData,
  style: {
    "h1": Style(
      fontSize: FontSize.xxLarge,
      fontWeight: FontWeight.bold,
      color: Colors.blue,
    ),
    "b": Style(
      color: Colors.red,
    ),
  },
),

```

### ✌️ 해결법

- - 를 통해서 전체에 스타일 속성을 줄 수 있었음

```dart
Html(
  data: "<b>아중리</b>육전골",
  style: {
    "*": Style(
      fontSize: FontSize(20),
      color: Colors.black,
    ),
  },
)

```

---

### ✅ 마주한 문제점 2

- 또 Html 위젯은 자체적으로 패딩과 마진이 들어가 있어서 텍스트 위젯과 레이아웃이 맞지 않았다.
- 따라서 padding과 margin을 0으로 줘서 해결할 수 있었음

```dart
Html(
  data: title,
  style: {
    "*": Style(fontSize: FontSize(20), fontWeight: FontWeight.bold),
    "body": Style(margin: Margins.zero, padding: HtmlPaddings.zero),
  },
),
```

---

## 4. Navigator 활용법

- 이것은 트러블 슈팅이기보다는 페이지 이동에 사용되는 `Navigator` 가 아직 익숙하지 않아서 개념정리를 위해 이곳에 한번 더 적고자 한다.

### Navigator를 통해서 데이터를 보내고 싶을 때

- 보내는 쪽
  - 페이지의 매개변수를 통해서 보낼 수 있음

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => DetailPage(data: "Hello from HomePage"),
  ),
);

```

- 받는 쪽
  - 페이지의 매개변수를 통해서 받을 수 있음

```dart
class DetailPage extends StatelessWidget {
  final String data;

  const DetailPage({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Page")),
      body: Center(child: Text("받은 데이터: $data")),
    );
  }
}

```

### Navigator.pop을 사용할 때

- 데이터를 보내는 쪽

```dart
Navigator.pop(context, "some result");
```

- 데이터를 받는 쪽

```dart
final result = await Navigator.push(...);
print(result); // "some result"
```

---

## 5. Flutter Webview 에러

- 에러 메시지

```dart
Exception has occurred.
_AssertionError ('package:flutter_inappwebview_platform_interface/src/in_app_webview/platform_inappwebview_widget.dart': Failed assertion: line 215 pos 7: 'InAppWebViewPlatform.instance != null': A platform implementation for flutter_inappwebview has not been set. Please ensure that an implementation of InAppWebViewPlatform has been set to InAppWebViewPlatform.instance before use. For unit testing, InAppWebViewPlatform.instance can be set with your own test implementation.)
```

### ✌️ 해결법

- 아래 코드를 사용하니 해결이 되었음

```dart
flutter clean
flutter pub get
flutter run
```

### 에러의 원인

✅ 1. **빌드 캐시 문제**

`flutter build`나 `flutter run`을 여러 번 반복하다 보면, Flutter는 이전에 만든 빌드 결과물(.dart_tool, build/, .gradle 등)을 재사용하려고 하는데 라이브러리를 추가하거나 설정 파일이 바뀌었을 때, **예전 캐시가 잘못된 상태**로 남아 있을 수 있음

> `flutter clean`은 이걸 전부 지워버려서 깨끗한 상태로 다시 빌드하게 만드는 명령어

✅ 2. **네이티브(Android/iOS) 쪽 연결 안 됐던 경우**

`flutter_inappwebview`는 Dart 코드만 있는 라이브러리가 아니라, **네이티브(Android, iOS) 코드랑 연결되는 플러그인임**

- `flutter pub get`으로 의존성은 가져왔는데,
- 네이티브 플랫폼(Android/iOS)의 **플러그인 설정이 빌드에 적용되지 않았던 상태**일 수 있어

`flutter clean` + `flutter run`을 하면 네이티브 빌드부터 싹 다시 하기 때문에 해결이 됨.

✅ 3. `pubspec.lock`이 꼬였던 경우

라이브러리 버전 충돌이나 의존성 트리 꼬임으로 인해, 실제 설치된 플러그인이 정상적으로 연결되지 않았던 상황이 있었을 수도 있음

`flutter clean`이 이것까지 깔끔하게 리셋해줘.

⇒ 라이브러리 추가 후 이상한 에러가 날 땐 `flutter clean` 이 만병통치약
