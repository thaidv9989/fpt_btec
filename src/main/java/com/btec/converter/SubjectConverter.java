package com.btec.converter;

import com.btec.dto.SubjectDTO;
import com.btec.entity.SubjectEntity;
import org.springframework.stereotype.Component;

public class SubjectConverter {
    public static SubjectDTO toDto(SubjectEntity subject){
        SubjectDTO dto = new SubjectDTO();
        dto.setSubjectId(subject.getSubjectId());
        dto.setSubjectName(subject.getSubjectName());
        dto.setMajorId(subject.getMajor().getMajorId());
        dto.setMajorName(subject.getMajor().getMajorName());
        return dto;
    }

    public static SubjectEntity toEntity(SubjectDTO dto, SubjectEntity subject){
        subject.setSubjectId(dto.getSubjectId());
        subject.setSubjectName(dto.getSubjectName());
        return subject;
    }
}
