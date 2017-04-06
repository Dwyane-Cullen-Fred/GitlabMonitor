package org.gitmining.monitor.service;

import org.gitmining.monitor.crawlerdao.ProjectCrawlerDao;
import org.gitmining.monitor.dao.ProjectDao;
import org.gitmining.monitor.dao.StudentDao;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(propagation=Propagation.SUPPORTS, readOnly=true)
public class UpdateDataService {
	public void setProjectDao(ProjectDao projectDao) {
	}
	public void setStudentDao(StudentDao studentDao) {
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=false)
	public void testUpdateData(){
		/*System.out.println("start update!");
    	String updateDate = GetDate.getCurrentDate();
		ProjectCrawlerDao projectCrawlerDao = new ProjectCrawlerDao();
		projectCrawlerDao.createLog(updateDate);
		
		GroupCrawler groupCrawler = new GroupCrawler();
		GroupProjectCrawler groupProjectCrawler = new GroupProjectCrawler();
		BranchCrawler branchCrawler = new BranchCrawler();
		CommitCrawler commitCrawler = new CommitCrawler();
		CommitStatistic commitStatistic = new CommitStatistic();
		
		groupCrawler.crawlGroup();
		groupProjectCrawler.crawlGroupProject();
		branchCrawler.crawlBranch();
		commitCrawler.crawlCommit();
		commitStatistic.countProjectCommit();
		commitStatistic.countStudentCommit();
		System.out.println("end update!");*/
		ProjectCrawlerDao projectCrawlerDao 
		= new ProjectCrawlerDao();
		for(int i = 0 ; i < 100000 ; i ++){
			projectCrawlerDao.insertTest(i + "fuck");
		}
		
	}

}
