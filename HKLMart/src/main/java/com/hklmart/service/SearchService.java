package com.hklmart.service;

import com.hklmart.persistence.SearchDAO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SearchService {

    private SearchDAO search;

    public SearchService(SearchDAO search) {
        this.search = search;
    }

    public List<String> searchProduct(String searchStr) {
        return search.searchProduct(searchStr);
    }
}
