# watch_app

흡연 감지 디바이스와 연동된 모바일 애플리케이션

## Commit Rule

- 기본적으로 자신의 파일 아래 branch를 형성하여 작업을 진행한다.
- branch를 나누는 기준
   * Frontend : 각 Screen별로
   * Backend : Backend engineer의 판단에 맡김, 관련있다고 생각되는 기능은 한 branch에서 작업

- Commit message 작성 관련
   - 제목의 경우, [tag]_OO(자신의 이니셜)-OOOO(작업 상세 내용) 형식으로 작성한다.
   - 상세 내용의 경우,
       * 자신이 편집한 dart 파일 언급
       * 새로운 무언가(Class, 함수 등)을 작성했을 시 설명과 함께 언급
       * 코드 내용을 수정한 경우 어떤 코드를 왜, 어떤 식으로 수정했는지 언급
   - tag
       - feat: 새로운 기능에 대한 커밋
       - fix: 버그 수정에 대한 커밋
       - build: 빌드 관련 파일 수정에 대한 커밋
       - docs: 문서 수정에 대한 커밋
       - style: 코드 스타일 혹은 포맷 등에 관한 커밋
       - refactor: 코드 리팩토링에 대한 커밋
       - restructure: 폴더 및 파일 재구성에 관한 커밋 
       - resources: UI & 아이콘 관한 커밋
