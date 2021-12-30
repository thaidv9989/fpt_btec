package com.btec.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.btec.entity.ContentEntity;
import com.btec.repository.ContentRepository;
import com.btec.service.IContentService;

@Service
public class ContentService implements IContentService{

	@Autowired
	private ContentRepository contentRepository;
	
	@Override
	public Map<Long, String> findAll() {
		Map<Long, String> result = new HashMap<>();
		List<ContentEntity> entities = contentRepository.findAll();
		for (ContentEntity item: entities) {
			result.put(item.getContentId(), item.getLink());
		}
		return result;
	}

}
