package org.gitmining.monitor.controller;

import static org.gitmining.monitor.util.URLMapping.PROJECT_SCORE;
import static org.gitmining.monitor.util.URLMapping.PROJECT_SCORE_ADD;
import static org.gitmining.monitor.util.URLMapping.PROJECT_SCORE_CHANGE;
import static org.gitmining.monitor.util.URLMapping.PROJECT_SCORE_DELETE;
import static org.gitmining.monitor.util.URLMapping.PROJECT_SCORE_STATISTICS;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.gitmining.monitor.bean.CourseTeamScore;
import org.gitmining.monitor.bean.ItemStatistics;
import org.gitmining.monitor.bean.ScoreRange;
import org.gitmining.monitor.bean.SimpleItem;
import org.gitmining.monitor.service.ScoreService;
import org.gitmining.monitor.util.ResultMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

@RestController
public class ScoreController {
	@Autowired
	private ScoreService scoreService;
	public void setScoreService(ScoreService scoreService) {
		this.scoreService = scoreService;
	}

	/**
	 * mapping to the Project score page,showing all the scores,separated by project and phase, for a specific course.
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value=PROJECT_SCORE)
	public ModelAndView showProjectScore(HttpServletRequest request, HttpServletResponse response){
		ModelAndView view = new ModelAndView("projectScore");
		String courseName = request.getParameter("course_name");
		if(courseName == null){
			courseName = "2016_nju_se_cseiii";
		}
		List<CourseTeamScore> teamScores = scoreService.getCourseTeamScores(courseName);
		List<SimpleItem> items = scoreService.getActiveItemNames(courseName);
		view.addObject("teamScores", teamScores);
		view.addObject("items", items);
		
		view.addObject("course", scoreService.getCourseInfo(courseName));
		view.addObject("courseNames", scoreService.getAllCourseNames());
		view.addObject("course_name", courseName);
		return view;
	}
	
	/**
	 * adding a new score column for a course
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value=PROJECT_SCORE_ADD)
	public ModelAndView addProjectScore(HttpServletRequest request, HttpServletResponse response){
		ModelAndView view = new ModelAndView("redirect:/project/score");
		String columnName = request.getParameter("column");
		int courseId = Integer.parseInt(request.getParameter("course_id"));
		String courseName = request.getParameter("course_name");
		if(courseName == null){
			courseName = "2016_nju_se_cseiii";
		}
		scoreService.addCourseScore(courseId, columnName);
		view.addObject("course_name", courseName);
		return view;
	}
	
	/**
	 * modify score on page
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value=PROJECT_SCORE_CHANGE)
	public Map<String, Object> changeProjectScore(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			int item_id = Integer.parseInt(request.getParameter("item_id"));
			int project_id = Integer.parseInt(request.getParameter("project_id"));
			int score = Integer.parseInt(request.getParameter("score"));
			result = scoreService.updateScore(project_id, item_id, score);
		}catch(NumberFormatException e){
			result.put("status", "wrong");
			result.put("info", "data not a int");
		}
		return result;
	}
	
	/**
	 * delete a score column
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value=PROJECT_SCORE_DELETE)
	public ModelAndView deleteProjectScore(HttpServletRequest request, HttpServletResponse response){
		ModelAndView view = new ModelAndView("redirect:/project/score");
		int itemId = Integer.parseInt(request.getParameter("delete_item"));
		scoreService.deleteCourseItem(itemId);
		String courseName = request.getParameter("course_name");
		if(courseName == null){
			courseName = "2016_nju_se_cseiii";
		}
		view.addObject("course_name", courseName);
		return view;
	}
	
	/**
	 * figure out some statistics among all the projects for a course
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value=PROJECT_SCORE_STATISTICS)
	public ResultMap getScoreStatistics(HttpServletRequest request, HttpServletResponse response){
		String courseName = request.getParameter("courseName");
		List<ItemStatistics> itemStatistics = scoreService.getCourseItemStatistics(courseName);
		List<ScoreRange> scoreRanges = new ArrayList<ScoreRange>();
		Gson gson = new Gson();
		for (int i = 0; i < itemStatistics.size(); i++) {
			ScoreRange scoreRange = gson.fromJson(itemStatistics.get(i).getScore_range(), ScoreRange.class);
			scoreRanges.add(scoreRange);
		}

		ResultMap resultMap = new ResultMap();
		resultMap.setStatus(ResultMap.SUCCESS_STATUS);
		//score range is the data for the line chart
		resultMap.add("scoreRanges", scoreRanges);
		
		//statisticsList includes several classic statistics for analyzing data
		resultMap.add("statisticsList", itemStatistics);
		return resultMap;
	}
}
