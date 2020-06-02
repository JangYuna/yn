package com.company.sawon.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.company.sawon.model.vo.Insa;
import com.company.sawon.model.vo.Insacom;
import com.company.sawon.model.vo.Yoo;

@Service
public interface SawonService {

	int yuInsert(Yoo yoo);

	int memberInsert(Insa insa);

	ArrayList<Insa> memberSearch(Insa insa);

	Insa selectInsaSabun(String insa_sabun);

	boolean idcheck(String insa_id);

	int memberUpdate(Insa insa);

	int memberDelete(String insa_sabun);

	String maxSabunSelect();

	int totalList(Insa searchList);

	void deleteChecked(Integer[] cksabun);

	List<Insacom> insacomList();

	int updateFile1(Insa insa);

	int updateFile2(Insa insa);

}
