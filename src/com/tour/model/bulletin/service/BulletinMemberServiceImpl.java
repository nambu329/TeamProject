
package com.tour.model.bulletin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;


import com.tour.exception.DataNotFoundException;
import com.tour.exception.DeleteFailException;
import com.tour.exception.RegistFailException;
import com.tour.exception.UpdateException;
import com.tour.model.bulletin.domain.BulletinMember;
import com.tour.model.bulletin.repository.BulletinMemberDAO;


@Service
public class BulletinMemberServiceImpl implements BulletinMemberService {

	@Autowired
	@Qualifier("mybatisBulletinMemberDAO")
	private BulletinMemberDAO memberDAO;

	
	@Override
	public List selectAll() {
		
		return memberDAO.selectAll();
	}

	
	
	@Override
	public BulletinMember select(int member_id) {
		BulletinMember member = memberDAO.select(member_id);
		
		return member;
	}

	
	
	//회원가입
	public void insert(BulletinMember member) {
		int result = memberDAO.insert(member);
		System.out.println("회원 가입 Service 통과");
		
		

		if (result == 0) {
			throw new RegistFailException("회원가입에 실패하였습니다.");
		}
		
	}

	
	
	
	@Override
	public int update(BulletinMember member) throws UpdateException{
		int result = memberDAO.update(member);
		if(result == 0) {
			throw new UpdateException("수정에 실패 하였습니다.");
		}
		return result;
	}

	
	
	
	@Override
	public void delete(int member_id) throws DeleteFailException{
		int result = memberDAO.delete(member_id);
		if(result == 0) {
			throw new DeleteFailException("삭제에 실패 하였습니다.");
		}
	}

	
	
	// 濡쒓렇�씤 泥댄겕
	@Override
	public BulletinMember loginCheck(BulletinMember member) throws DataNotFoundException{
		BulletinMember getMember = memberDAO.loginCheck(member);
		if(getMember == null) {
			throw new DataNotFoundException("로그인에 실패하였습니다.");
		}
		return getMember;
	}
	
	
	
	//=========================================================
	@Override
	public List selectAllAdmin() {
		
		return memberDAO.selectAllAdmin();
	}
	//=========================================================



	@Override
	public BulletinMember check(BulletinMember member) {
	      BulletinMember result = null;
	      if (member.getId() != null) {
	         System.out.println("Service Check ID");
	         result = memberDAO.checkId(member);
	         System.out.println("MemberService result==" + result);
	      } else {
	         System.out.println("Service Check Email");
	         result = memberDAO.checkEmail(member);
	      }
	      return result;
	}




}
