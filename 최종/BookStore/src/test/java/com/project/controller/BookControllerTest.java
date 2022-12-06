package com.project.controller;
//package com.spring.controller;
//
//import java.net.URI;
//import java.nio.charset.Charset;
//
//import org.springframework.http.RequestEntity;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RestController;
//import org.springframework.web.client.RestTemplate;
//import org.springframework.web.util.UriComponentsBuilder;
//
//@RestController
//public class BookControllerTest {
//@GetMapping("/search")
//public String naver(){
//
//    URI uri = UriComponentsBuilder
//            .fromUriString("https://openapi.naver.com")
//            .path("/v1/search/local.json")
//            .queryParam("query","백엔드")
//            .queryParam("display",10)
//            .queryParam("start",1)
//            .queryParam("sort","random")
//            .encode(Charset.forName("UTF-8")) // 여기서 query 내용 encoding 해줌
//            .build()
//            .toUri();
//
//    RestTemplate restTemplate = new RestTemplate();
//
//    RequestEntity<Void> req = RequestEntity
//            .get(uri)
//            .header("X-Naver-Client-Id","YW2vH7RGW8B1W9bWgJMP")
//            .header("X-Naver-Client-Secret","2O9Vl4ysld")
//            .build();
//
//    ResponseEntity<String> result = restTemplate.exchange(req, String.class);
//
//    return result.getBody();
//}
//}
