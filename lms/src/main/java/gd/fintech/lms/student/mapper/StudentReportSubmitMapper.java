package gd.fintech.lms.student.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Report;
import gd.fintech.lms.vo.ReportSubmit;

@Mapper
public interface StudentReportSubmitMapper {
	Report selectReportSubmitOne(Map<String, Object>map);
	
	Report selectReportOne(int reportNo);
	
	Report selectReportSubmitAndReportFile(int reportSubmitNo);
	
	int insertReport(ReportSubmit reportSubmit);
	
	int updateReportSubmit(ReportSubmit reportSubmit);
	
	//과제목록 리스트
	List<Report> selectReportListPage(String accountId);
}
