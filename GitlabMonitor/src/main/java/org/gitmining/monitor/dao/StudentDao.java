package org.gitmining.monitor.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.gitmining.monitor.bean.StudentCommit;
import org.gitmining.monitor.bean.StudentEvent;
import org.springframework.stereotype.Repository;

@Repository
public class StudentDao extends BaseDaoImpl{
	public List<StudentCommit> selectStudentCommitRange(String student, String startDay, String endDay){
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("student", student);
		params.put("startDay", startDay);
		params.put("endDay", endDay);
		return sqlSession.selectList("student.selectStudentCommitRange", params);
	}
	
	public List<Integer> selectStudentCommitItemRange(String item,String student, String startDay, String endDay){
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("item", item);
		params.put("student", student);
		params.put("startDay", startDay);
		params.put("endDay", endDay);
		return sqlSession.selectList("student.selectStudentCommitItemRange", params);
	}
	
	public List<StudentEvent> selectStudentEventRange(String student, String startDay, String endDay){
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("student", student);
		params.put("startDay", startDay);
		params.put("endDay", endDay);
		return sqlSession.selectList("student.selectStudentEventRange", params);
	}
	
	public List<Integer> selectStudentEventItemRange(String item,String student, String startDay, String endDay){
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("item", item);
		params.put("student", student);
		params.put("startDay", startDay);
		params.put("endDay", endDay);
		return sqlSession.selectList("student.selectStudentEventItemRange", params);
	}
	
	
}