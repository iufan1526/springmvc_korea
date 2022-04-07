package com.korea.infra.modules.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDao dao;

	@Override
	public List<Member> selectList(MemberVo vo) throws Exception {
		return dao.selectList(vo);
	}

	@Override
	public Member selectOne(MemberVo vo) throws Exception {
		return dao.selectOne(vo);
	}

	@Override
	public int selectOneCount(MemberVo vo) throws Exception {
		return dao.selectOneCount(vo);
	}
	
	@Override
	public Member selectOneLogin(Member dto) throws Exception {
		return dao.selectOneLogin(dto);
	}
// 등록
	@Override
	public int insertMember(Member dto) throws Exception {
		return dao.insertMember(dto);
	}

	@Override
	public int insertEmail(Member dto) throws Exception {
		return dao.insertEmail(dto);
	}
	@Override
	public int insertAddress(Member dto) throws Exception {
		return dao.insertAddress(dto);
	}
	
	@Override
	public int insertPhone(Member dto) throws Exception {
		return dao.insertPhone(dto);
	}
	
// 삭제
	@Override
	public int delete(MemberVo vo) throws Exception {
		return dao.delete(vo);
	}
	@Override
	public int deleteAddress(MemberVo vo) throws Exception {
		return dao.deleteAddress(vo);
	}
	
	@Override
	public int deleteEmail(MemberVo vo) throws Exception {
		return dao.deleteEmail(vo);
	}
	
	@Override
	public int deletePhone(MemberVo vo) throws Exception {
		return dao.deletePhone(vo);
	}
//업데이트
	@Override
	public int update(Member dto) throws Exception {
		return dao.update(dto);
	}

	@Override
	public int updateAddress(Member dto) throws Exception {
		return dao.updateAddress(dto);
	}

	@Override
	public int updateEmail(Member dto) throws Exception {
		return dao.updateEmail(dto);
	}

	@Override
	public int updatePhone(Member dto) throws Exception {
		return dao.updatePhone(dto);
	}

	
	
	

	


	
	
	
	
	
	
	

	
	
	
	
	
	

}
