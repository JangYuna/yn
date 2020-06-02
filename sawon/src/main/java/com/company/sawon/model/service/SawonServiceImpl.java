package com.company.sawon.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.sawon.model.dao.SawonDao;
import com.company.sawon.model.vo.Insa;
import com.company.sawon.model.vo.Insacom;
import com.company.sawon.model.vo.Yoo;

@Service("SawonService")
public class SawonServiceImpl implements SawonService {
	
	@Autowired
	private SawonDao sawonDao;

	@Override
	public int yuInsert(Yoo yoo) {
		return sawonDao.yuInsert(yoo);
	}

	@Override
	public int memberInsert(Insa insa) {
		return sawonDao.memberInsert(insa);
	}

	@Override
	public ArrayList<Insa> memberSearch(Insa insa) {
		return sawonDao.memberSearch(insa);
	}

	@Override
	public Insa selectInsaSabun(String insa_sabun) {
		return sawonDao.selectInsaSabun(insa_sabun);
	}

	@Override
	public boolean idcheck(String insa_id) {
		return sawonDao.idcheck(insa_id);
	}

	@Override
	public int memberUpdate(Insa insa) {
		return sawonDao.memberUpdate(insa);
	}

	@Override
	public int memberDelete(String insa_sabun) {
		return sawonDao.memberDelete(insa_sabun);
	}

	@Override
	public String maxSabunSelect() {
		return sawonDao.maxSabunSelect();
	}

	@Override
	public int totalList(Insa searchList) {
		return sawonDao.totalList(searchList);
	}

	@Override
	public void deleteChecked(Integer[] cksabun) {
		sawonDao.deleteChecked(cksabun);
	}

	@Override
	public List<Insacom> insacomList() {
		return sawonDao.insacomList();
	}

	@Override
	public int updateFile1(Insa insa) {
		return sawonDao.updateFile1(insa);
	}

	@Override
	public int updateFile2(Insa insa) {
		return sawonDao.updateFile2(insa);
	}

}
