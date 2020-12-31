package com.hklmart.service;

import com.hklmart.persistence.SearchDAO;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

@Service
public class SearchService {

    private final SearchDAO search;

    public SearchService(SearchDAO search) {
        this.search = search;
    }

    public List<String> searchProduct(String searchStr) {
        List<String> brand = Arrays.asList("아식스", "호킨스", "대너", "반스", "베어파우", "포티세컨드", "뉴발란스", "노오보",
                "푸마", "누오보", "팀버랜드", "리복", "스테파노로시", "페이유에", "아디다스", "써코니", "닥터마틴", "스페리", "레브",
                "스트레이", "나이키", "스케쳐스", "휠라", "마크모크", "포즈간츠", "덤퍼", "컨버스");
        List<String> result = search.searchProduct(searchStr);
        result.addAll(brand);
        return result;
    }

}
