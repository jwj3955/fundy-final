package com.kh.fundy.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fundy.model.vo.Member;
import com.kh.fundy.model.vo.ShippingAddr;

@Repository
public class MemberUpdateDaoImpl implements MemberUpdateDao {

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int memberUpdate(Member m) {
		return session.update("member.memberUpdate", m);
	}
	
	@Override
	public List<Member> memberUpdateView(Member m) {
		return session.selectList("member.memberUpdateView", m);
	}

	@Override
	public int memberPwUpdate(Member m) {
		return session.update("member.memberPwUpdate", m);
	}

	@Override
	public int memberPwCheck(Member m) {
		return session.selectOne("member.memberPwCheck", m);
	}

	@Override
	public int memberNickCheck(String memberNick) {
		return session.selectOne("member.memberNickCheck", memberNick);
	}

	@Override
	public int memberDelete(Member m) {
		return session.update("member.memberDelete", m);
	}
	

	@Override
	public int updateAddr(ShippingAddr sa) {
		return session.update("shippingAddr.updateAddr", sa);
	}
	
	@Override
	public int insertAddr(ShippingAddr sa) {
		return session.insert("shippingAddr.insertAddr", sa);
	}
	
	@Override
	public List<ShippingAddr> selectAddrList(String memberEmail) {
		return session.selectList("shippingAddr.selectAddrList", memberEmail);
	}
	
	@Override
	public ShippingAddr selectAddr(ShippingAddr sa) {
		return session.selectOne("shippingAddr.selectAddr", sa);
	}
	
	@Override
	public int deleteAddr(ShippingAddr sa) {
		return session.delete("shippingAddr.deleteAddr", sa);
	}
	
}
