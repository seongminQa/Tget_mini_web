package com.mycompany.Tget_mini_web.dto;

import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.mycompany.Tget_mini_web.dao.MemberDao;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class JoinFormValidator implements Validator{

   @Autowired
   private MemberDao memberDao;
   
   @Override
   public boolean supports(Class<?> clazz) {
      log.info("supports() 실행");
      return MemberDto.class.isAssignableFrom(clazz);
   }

   @Override
   public void validate(Object target, Errors errors) {
      MemberDto memberDto = (MemberDto) target;
      
      // 1.아이디 검사
      String mid = memberDto.getMid();
      String midPattern = "^(?=.*\\d)(?=.*[a-z]).{6,20}";
      if(mid == null || mid.equals("")) {
         log.info("아이디는 반드시 입력되어야 합니다.");
         errors.rejectValue("mid", null, "아이디는 반드시 입력되어야 합니다.");
      } else if(mid.length() < 6 || mid.length() > 20) {
         log.info("아이디는  6자 이상 20자 이하이여야 합니다.");
         errors.rejectValue("mid", null, "아이디는  6자 이상 20자 이하이여야 합니다.");
      } else if(!Pattern.matches(midPattern, mid)) {
         log.info("아이디는 알파벳 소문자 및 숫자를 포함해야 합니다.");
         errors.rejectValue("mid", null, "아이디는 알파벳 소문자 및 숫자를 포함해야 합니다.");
      } else if(memberDao.selectByMidIsUnique(mid) == 1) {
         log.info("이미 사용중인 아이디 입니다.");
         errors.rejectValue("mid", null, "이미 사용중인 아이디 입니다.");
      }
      
      // 2.비밀번호 검사
      String mpassword = memberDto.getMpassword();
      String mpasswordPattern = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}";
      if(mpassword == null || mpassword.equals("")) {
         log.info("비밀번호는 반드시 입력되어야 합니다.");
         errors.rejectValue("mpassword", null, "비밀번호는 반드시 입력되어야 합니다.");
      } else if(mpassword.length() < 8 || mpassword.length() > 15) {
         log.info("비밀번호는  8자 이상 15자 이하이여야 합니다.");
         errors.rejectValue("mpassword", null, "비밀번호는  8자 이상 15자 이하이여야 합니다.");
      }else if(!Pattern.matches(mpasswordPattern, mpassword)) {
         log.info("비밀번호는 알파벳 대소문자 및 숫자를 포함해야 합니다.");
         errors.rejectValue("mpassword", null, "비밀번호는 알파벳 대소문자 및 숫자를 포함해야 합니다.");
      }
      
      // 3.이름 검사
      String mname = memberDto.getMname();
      String mnamePattern = "^[가-힣]{2,12}";
      if(mname == null || mname.equals("")) {
         log.info("이름은 반드시 입력되어야 합니다.");
         errors.rejectValue("mname", null, "이름은 반드시 입력되어야 합니다.");
      } else if(mname.length() < 2 || mname.length() > 12) {
         log.info("이름은 2자 이상 12자 이하이여야 합니다.");
         errors.rejectValue("mname", null, "이름은 2자 이상 12자 이하이여야 합니다.");
      }else if(!Pattern.matches(mnamePattern, mname)) {
         log.info("이름은 한글로만 입력할 수 있습니다.");
         errors.rejectValue("mname", null, "이름은 한글로만 입력할 수 있습니다.");
      }
      
      // 4.주민등록번호 검사
      String mssn = memberDto.getMssn();
      String mssnPattern = "^\\d{6}\\-\\d{7}";
      if(mssn == null || mssn.equals("")) {
         log.info("주민등록번호는 반드시 입력되어야 합니다.");
         errors.rejectValue("mssn", null, "주민등록번호는 반드시 입력되어야 합니다.");
      } else if(!Pattern.matches(mssnPattern, mssn)) {
         log.info("하이픈을 포함하여 주민등록번호를 입력하세요.");
         errors.rejectValue("mssn", null, "하이픈을 포함하여 주민등록번호를 입력하세요.");
      } else if(memberDao.selectByMssnIsUnique(mssn) == 1) {
         log.info("이미 가입한 회원 입니다. ssn");
         errors.rejectValue("mssn", null, "이미 가입한 회원 입니다.");
      }
      
      // 5.이메일 검사
      String memail = memberDto.getMemail();
      String memailPattern = "^\\w+([\\.-]?\\w+)*@\\w+([\\.-]?\\w+)*(\\.\\w{2,3})+$";
      if(memail == null || memail.equals("")) {
         log.info("이메일은 반드시 입력되어야 합니다.");
         errors.rejectValue("memail", null, "이메일은 반드시 입력되어야 합니다.");
      } else if(!Pattern.matches(memailPattern, memail)) {
         log.info("이메일 양식이 틀립니다.");
         errors.rejectValue("memail", null, "이메일 양식이 틀립니다.");
      } 
      
      // 6.휴대폰 번호 검사
      String mphone = memberDto.getMphone();
      String mphonePattern = "^010-\\d{3,4}-\\d{4}$";
      if(mphone == null || mphone.equals("")) {
         log.info("휴대폰 번호는 반드시 입력되어야 합니다.");
         errors.rejectValue("mphone", null, "휴대폰 번호는 반드시 입력되어야 합니다.");
      } else if(!Pattern.matches(mphonePattern, mphone)) {
         log.info("하이픈을 포함한 휴대폰 번호를 입력하세요");
         errors.rejectValue("mphone", null, "하이픈을 포함한 휴대폰 번호를 입력하세요");
      } else if(memberDao.selectByMphoneIsUnique(mphone) == 1) {
         log.info("이미 가입한 회원 입니다. phone");
         errors.rejectValue("mphone", null, "이미 가입한 회원 입니다.");
      }
      
      // 7.닉네임 중복 검사
      String mnickname = memberDto.getMnickname();
      if(memberDao.selectByMnicknameIsUnique(mnickname) == 1) {
         log.info("이미 사용중인 닉네임 입니다.");
         errors.rejectValue("mnickname", null, "이미 사용중인 닉네임 입니다.");
      }

   }
   
   
   
}