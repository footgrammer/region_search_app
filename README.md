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
