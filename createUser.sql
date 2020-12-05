오라클 12c 계정 설정을 위한 세션 변경 
  ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;


hkl 계정 생성
  CREATE USER hkl IDENTIFIED BY root;


hkl 계정에 DBA 권한 부여
  GRANT DBA TO hkl;


hkl 계정 및 모든 테이블 삭제
  DROP USER hkl CASCADE;

