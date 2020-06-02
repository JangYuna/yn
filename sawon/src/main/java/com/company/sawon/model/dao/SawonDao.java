package com.company.sawon.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.sawon.model.vo.Insa;
import com.company.sawon.model.vo.Insacom;
import com.company.sawon.model.vo.Yoo;

@Repository("SawonDao")
public class SawonDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public SawonDao() {
		
	}

	public int yuInsert(Yoo yoo) {
		return sqlSession.insert("yuInsert", yoo);
	}

	public int memberInsert(Insa insa) {
		return sqlSession.insert("memberInsert", insa);
	}

	public ArrayList<Insa> memberSearch(Insa insa) {
		return (ArrayList)sqlSession.selectList("memberSearch", insa);
	}

	public Insa selectInsaSabun(String insa_sabun) {
		return sqlSession.selectOne("sabunSelect", insa_sabun);
	}

	public boolean idcheck(String insa_id) {
		if(sqlSession.selectOne("idcheck", insa_id) == null) {
			return true;
		}else {
			return false;
		}
	}

	public int memberUpdate(Insa insa) {
		return sqlSession.update("memberUpdate", insa);
	}

	public int memberDelete(String insa_sabun) {
		return sqlSession.delete("memberDelete", insa_sabun);
	}

	public String maxSabunSelect() {
		return sqlSession.selectOne("maxSabunSelect");
	}

	public int totalList(Insa searchList) {
		return sqlSession.selectOne("totalList", searchList);
	}

	public void deleteChecked(Integer[] cksabun) {
		for(Integer insa_sabun : cksabun) {
			sqlSession.delete("memberDelete", insa_sabun);
		}
	}

	public List<Insacom> insacomList() {
		return sqlSession.selectList("insacomList");
	}

	public int updateFile1(Insa insa) {
		return sqlSession.update("updateFile1", insa);
	}

	public int updateFile2(Insa insa) {
		return sqlSession.update("updateFile2", insa);
	}
	
}
