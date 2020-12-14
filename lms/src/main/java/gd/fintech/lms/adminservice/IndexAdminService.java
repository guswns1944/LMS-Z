package gd.fintech.lms.adminservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.adminmapper.IndexAdminMapper;
import gd.fintech.lms.vo.ManagerQueue;

@Transactional
@Service
public class IndexAdminService {
	@Autowired IndexAdminMapper indexAdminMapper;
	
	// 운영자 승인 대기 리스트 출력
	public List<ManagerQueue> getManagerQueueList(){
		return indexAdminMapper.selectManagerQueue();
	}
	// 승인/거부 하려는 운영자 정보 불러오기
	public ManagerQueue getManagerQueueOne(String managerId) {
		return indexAdminMapper.selectManagerQueueOne(managerId);
	}
	// 운영자 승인
	public int addManagerInformation(ManagerQueue managerQueue) {
		return indexAdminMapper.insertManagerInformation(managerQueue);
	}
	// 운영자 승인 거부
	public int removeManagerQueue(String managerId) {
		return indexAdminMapper.deleteManagerQueue(managerId);
	}
}
