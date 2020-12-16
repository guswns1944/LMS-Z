package gd.fintech.lms.student.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import gd.fintech.lms.student.mapper.StudentQuestionFileMapper;
import gd.fintech.lms.student.mapper.StudentQuestionMapper;
import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.Question;
import gd.fintech.lms.vo.QuestionAddForm;
import gd.fintech.lms.vo.QuestionFile;

@Service
public class StudentQuestionService {
	private final String PATH ="C:\\Users\\박연원\\git\\LMS-Z\\lms\\src\\main\\webapp\\uploadfile\\questionfile";
	
	@Autowired private StudentQuestionMapper studentQuestionMapper;
	@Autowired private StudentQuestionFileMapper studentQuestionFileMapper;
	//질문목록 리스트 페이징
	public List<Question> getQuestionPage(int currentPage, int rowPerPage){
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("beginRow", (currentPage-1)*rowPerPage);
		map.put("rowPerPage", rowPerPage);
		
		return studentQuestionMapper.selectQuestionListPage(map);
	}
	
	//질문목록 행의 갯수 (페이징에 사용)
	public int totalQuestion() {
		return studentQuestionMapper.totalCountQuestion();
	}
	
	//질문 상세히 보기
	public Question getQuestionOne(int questionNo) {
		Question question = studentQuestionMapper.selectQuestionOne(questionNo);
		return question;
	}
	
	//질문 등록 +(질문 파일)
	public void addQuestion(QuestionAddForm questionAddForm) {
		Question question = new Question();
		
		question.setLectureNo(questionAddForm.getLectureNo());
		question.setAccountId(questionAddForm.getAccountId());
		question.setQuestionWriter(questionAddForm.getQuestionWriter());
		question.setQuestionTitle(questionAddForm.getQuestionTitle());
		question.setQuestionContent(questionAddForm.getQuestionContent());
		question.setQuestionCreatedate(questionAddForm.getQuestionCreatedate());
		question.setQuestionUpdatedate(questionAddForm.getQuestionUpdatedate());
		question.setQuestionPassword(questionAddForm.getQuestionPassword());
		
		studentQuestionMapper.insertQuestion(question);
		
		List<QuestionFile> questionFile=null;
		if(questionAddForm.getQuestionFile() != null) {
			questionFile = new ArrayList<QuestionFile>();
			for(MultipartFile mf : questionAddForm.getQuestionFile()) {
				QuestionFile qf = new QuestionFile();
				qf.setQuestionNo(question.getQuestionNo());
				int count = 0;
				int p = mf.getOriginalFilename().lastIndexOf(".");
				
				String ext = mf.getOriginalFilename().substring(p).toLowerCase();
				String filename = UUID.randomUUID().toString().replace("-","");
				
				qf.setQuestionFileUuid(filename+ext);
				qf.setQuestionFileOriginal(mf.getOriginalFilename());
				qf.setQuestionFileSize(mf.getSize());
				qf.setQuestionFileType(mf.getContentType());
				qf.setQuestionFileCount(count);
				questionFile.add(qf);
				
				try {
					mf.transferTo(new File(PATH+filename+ext));
				}catch(Exception e) {
					e.printStackTrace();
					throw new RuntimeException();
				}
			}
		} 
		if(questionFile != null) {
			for(QuestionFile qf : questionFile) {
				studentQuestionFileMapper.insertQuestionFile(qf);
			}
		}
	}
	
	// 질문 생성시 강의 목록중 질문 강의를 선택하기 위해 사용
	public List<Lecture> getLectureList(){
		return studentQuestionMapper.selectLectureList();
	}
	
	public void deleteQuestion(int questionNo) {
		List<String> questionFileUuid = studentQuestionFileMapper.selectQuestionFileUuid(questionNo);
		for(String s : questionFileUuid) {
			File file = new File(PATH+s);
			if(file.exists()) {
				file.delete();
			}
		}
		studentQuestionFileMapper.deleteAllQuestionFile(questionNo);
		studentQuestionMapper.deleteQuestion(questionNo);
	}
}
