package com.project.controller;

import java.net.URI;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.project.domain.BookDTO;
import com.project.service.BookService;

@RestController
@RequestMapping(value = "/api/*", produces = "application/json; charset= UTF-8;")
public class BookAddController {

	@Autowired
	private BookService service;
	
	
	@GetMapping("/add")
	public void naver() throws ParseException {

		URI uri = UriComponentsBuilder.fromUriString("https://openapi.naver.com").path("/v1/search/book.json")
				.queryParam("query", "최초의 역사 수메르").queryParam("display", 10).queryParam("start", 1).queryParam("sort", "sim")
				.encode() // 여기서 query 내용 encoding 해줌
				.build().toUri();

		RestTemplate restTemplate = new RestTemplate(); // Rest api호출 내장 클래스

		RequestEntity<Void> req = RequestEntity.get(uri).header("X-Naver-Client-Id", "YW2vH7RGW8B1W9bWgJMP")
				.header("X-Naver-Client-Secret", "2O9Vl4ysld").build();

		ResponseEntity<String> result = restTemplate.exchange(req, String.class);
		String jsonInfo = result.getBody();

		JsonParser jsonParser = new JsonParser();  
		JsonObject jsonObject = (JsonObject) jsonParser.parse(jsonInfo); //2중 구조여서 Object -> Array -> Object 순으로 데이터를 가져옴
		JsonArray bookInfoArray = (JsonArray) jsonObject.get("items");
		JsonObject bookObject = null;

//		for (int i = 0; i < bookInfoArray.size(); i++) {
//
//			System.out.println("Book" + i + "=========================");
//
//			bookObject = (JsonObject) bookInfoArray.get(i);
//			
//			System.out.println(bookObject.get("title"));
//			System.out.println(bookObject.get("author"));
//			System.out.println(bookObject.get("publisher"));
//			System.out.println(bookObject.get("discount"));
//			System.out.println(bookObject.get("image"));
//			System.out.println(bookObject.get("pubdate"));
//			
//		}
		  JsonElement jsonElement = bookInfoArray.get(0);
		  String title = jsonElement.getAsJsonObject().get("title").getAsString();
		  String author = jsonElement.getAsJsonObject().get("author").getAsString();
		  Long discount = jsonElement.getAsJsonObject().get("discount").getAsLong();
		  String pubdate_Str = jsonElement.getAsJsonObject().get("pubdate").getAsString();
		  SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		  Date pubdate = sdf.parse(pubdate_Str);
		  Long isbn = jsonElement.getAsJsonObject().get("isbn").getAsLong();
		  String image = jsonElement.getAsJsonObject().get("image").getAsString();
		  String publisher = jsonElement.getAsJsonObject().get("publisher").getAsString();
		  String description = jsonElement.getAsJsonObject().get("description").getAsString();
		  
		  BookDTO dto = new BookDTO();
		  dto.setTitle(title);
		  dto.setAuthor(author);
		  dto.setDiscount(discount);
		  dto.setPubdate(pubdate);
		  dto.setIsbn(isbn);
		  dto.setImage(image);
		  dto.setCategory("역사");
		  dto.setPublisher(publisher);
		  dto.setDescription(description);
		  service.register(dto);
	}
	
	@GetMapping("/addList")
	public String navarAddList() {

		URI uri = UriComponentsBuilder.fromUriString("https://openapi.naver.com").path("/v1/search/book.json")
				.queryParam("query", "최초의 역사 수메르").queryParam("display", 10).queryParam("start", 1).queryParam("sort", "sim")
				.encode() // 여기서 query 내용 encoding 해줌
				.build().toUri();

		RestTemplate restTemplate = new RestTemplate(); // Rest api호출 내장 클래스

		RequestEntity<Void> req = RequestEntity.get(uri).header("X-Naver-Client-Id", "YW2vH7RGW8B1W9bWgJMP")
				.header("X-Naver-Client-Secret", "2O9Vl4ysld").build();

		ResponseEntity<String> result = restTemplate.exchange(req, String.class);
		
		return result.getBody();
		
	}
	
	
}
