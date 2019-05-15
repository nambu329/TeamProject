package com.tour.model.bulletin.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tour.model.bulletin.domain.BulletinMember;

@Repository
public class MybatisBulletinMemberDAO implements BulletinMemberDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	
	
	@Override
	public List selectAll() {
		
		return sqlSessionTemplate.selectList("BulletinMember.selectAll");
	}

	
	
	
	@Override
	public BulletinMember select(int member_id) {
		
		return sqlSessionTemplate.selectOne("BulletinMember.select",member_id);
	}
	
	
	

	@Override
	public int insert(BulletinMember member) {
		
		return sqlSessionTemplate.insert("BulletinMember.insert", member);
	}

	
	
	
	@Override
	public int update(BulletinMember member) {
		int result = sqlSessionTemplate.update("BulletinMember.update", member);
		return result;
	}

	
	
	
	@Override
	public int delete(int member_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	@Override
	public BulletinMember loginCheck(BulletinMember member) {
		
		return sqlSessionTemplate.selectOne("BulletinMember.login",member);
	}




	@Override
	public List selectAllAdmin() {
		return sqlSessionTemplate.selectList("BulletinMember.selectAllAdmin");
	}


	@Override
	public List selectMember(String searchText) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("BulletinMember.selectMember", "%"+searchText+"%");
	}




	@Override
	public BulletinMember checkId(BulletinMember member) {
		return sqlSessionTemplate.selectOne("BulletinMember.checkId", member);
	}




	@Override
	public BulletinMember checkEmail(BulletinMember member) {
	      return sqlSessionTemplate.selectOne("BulletinMember.checkEmail", member);
	}
	
}
