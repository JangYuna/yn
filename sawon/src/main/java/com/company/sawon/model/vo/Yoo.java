package com.company.sawon.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component("Yoo")
public class Yoo implements Serializable{
	private static final long serialVersionUID=1105091733L;
	
	private String yu;
	private String yo;
	
	public Yoo() {
		
	}

	public Yoo(String yu, String yo) {
		super();
		this.yu = yu;
		this.yo = yo;
	}

	public String getYu() {
		return yu;
	}

	public void setYu(String yu) {
		this.yu = yu;
	}

	public String getYo() {
		return yo;
	}

	public void setYo(String yo) {
		this.yo = yo;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Yu [yu=" + yu + ", yo=" + yo + "]";
	}
	
	
}
