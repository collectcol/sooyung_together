
lib/core/

앱 전체에서 공통으로 사용되는 기능들
constants/: 상수 값들 (API 엔드포인트, 색상, 카테고리 등)
network/: 네트워크 관련 설정 (Dio 클라이언트 등)
utils/: 유틸리티 함수들
theme/: 앱 테마 관련 설정


lib/data/

데이터 계층 관련 코드
models/: API 응답을 담는 데이터 모델 클래스들
repositories/: API 호출 구현체
datasources/: 로컬/원격 데이터 소스 구현


lib/domain/

비즈니스 로직 계층
entities/: 비즈니스 로직에서 사용할 순수한 데이터 객체
repositories/: repository 인터페이스 정의
usecases/: 비즈니스 로직 구현


lib/presentation/

UI 관련 코드
screens/: 각 화면 위젯
widgets/: 재사용 가능한 커스텀 위젯
viewmodels/: 화면의 상태관리 로직
providers/: 상태 관리 provider들


lib/main.dart

앱의 진입점
앱 초기화 및 설정