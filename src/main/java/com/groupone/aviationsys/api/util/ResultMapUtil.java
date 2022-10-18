package com.groupone.aviationsys.api.util;

import java.util.HashMap;

import com.baomidou.mybatisplus.core.metadata.IPage;

public class ResultMapUtil {

	
	public static HashMap<String, Object> getHashMapMysql(IPage<?> object){
		 HashMap<String,Object> resultMap = new HashMap<>();
		 resultMap.put("code",0);		//return successful with 0
		 resultMap.put("msg","");
		 resultMap.put("count",object.getTotal()); //How many data we have
		 resultMap.put("data",object.getRecords());
		 return resultMap;
	}
	
	//Solve exception problem
	public static HashMap<String, Object> getHashMapException(Exception e){
		 HashMap<String,Object> resultMap = new HashMap<>();
		 resultMap.put("code",0);		//return successful with 0
		 resultMap.put("msg",e.getMessage()); //return message to ront
		 return resultMap;
	}
	
	
	//Save and return all
	public static HashMap<String, Object> getHashMapSave(int i){
		 HashMap<String,Object> resultMap = new HashMap<>();
		 if(i==0) {
			 resultMap.put("msg","save fail");
			 resultMap.put("code",1);
			 resultMap.put("icon",5);
			 resultMap.put("anim",6);
			 
		 }else {
			 resultMap.put("msg","save successfully");
			 resultMap.put("code",0);
			 resultMap.put("icon",1);
			 resultMap.put("anim",4);
			 	 
		 }
		 return resultMap;
	
	}
	

	//Save and return all
	public static HashMap<String, Object> getHashMapUpdate(int i){
		 HashMap<String,Object> resultMap = new HashMap<>();
		 if(i==0) {
			 resultMap.put("msg","update fail");
			 resultMap.put("code",1);
			 resultMap.put("icon",5);
			 resultMap.put("anim",6);
			 
		 }else {
			 resultMap.put("msg","update successfully");
			 resultMap.put("code",0);
			 resultMap.put("icon",1);
			 resultMap.put("anim",4);
			 	 
		 }
		 return resultMap;
	
	}
	

	//Save and return all
	public static HashMap<String, Object> getHashMapDel(int i){
		 HashMap<String,Object> resultMap = new HashMap<>();
		 if(i==0) {
			 resultMap.put("msg","delete fail");
			 resultMap.put("code",1);
			 resultMap.put("icon",5);
			 resultMap.put("anim",6);
			 
		 }else {
			 resultMap.put("msg","delete successfully");
			 resultMap.put("code",0);
			 resultMap.put("icon",1);
			 resultMap.put("anim",4);
			 	 
		 }
		 return resultMap;
	}	
	
}
