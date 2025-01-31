# sooyung_together

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

core                : 공통 유틸리티 및 상수
    - constants     : 상수 값들
    - utils         : 유틸리티 함수들

data                : 데이터 계층
    - models        : 데이터 모델
    - repositories  : 구현된 레포지토리

domain              : 도메인 계층
    - entities      : 비즈니스 엔티티
    - repositories  : 레포지토리 인터페이스

presentation        : UI 계층
    - screens       : 화면
    - widgets       : 재사용 가능한 위젯들
    - blocs/providers   : 상태관리 폴더