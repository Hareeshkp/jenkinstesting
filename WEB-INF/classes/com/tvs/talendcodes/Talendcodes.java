package com.tvs.talendcodes;

public class Talendcodes {
	Integer talendcode;

	public Integer getTalendcode() {
		return talendcode;
	}

	public void setTalendcode(Integer talendcode) {
		this.talendcode = talendcode;
	}

	public Talendcodes(Integer talendcode) {
		super();
		this.talendcode = talendcode;
	}

	public Talendcodes() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((talendcode == null) ? 0 : talendcode.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Talendcodes other = (Talendcodes) obj;
		if (talendcode == null) {
			if (other.talendcode != null)
				return false;
		} else if (!talendcode.equals(other.talendcode))
			return false;
		return true;
	}

	
	
	
	
	

}
