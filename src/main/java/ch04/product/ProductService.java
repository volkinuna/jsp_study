package ch04.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

// model(모델)
// 1. 직접적으로 Database와 대화를 한다.(데이터를 저장, 수정, 삭제, 조회 요구)
// 2. 컨트롤러에서 요청을 받아서 Database에서 가져 온 데이터를 전달해준다.
public class ProductService {
	// 데이터 베이스를 연결하지 않았으므로 데이터를 임의로 만들어준다.
	// 데이터 베이스에서 select 해 온 상품 리스트
	Map<String, Product> products = new HashMap();
	
	// 생성자
	public ProductService() {
		Product p = new Product("101", "애플사과폰 12", "애플전자", 1200000, "2020.12.12");
		products.put("101", p); // 키값은 상품코드로 HashMap에 저장
		
		p = new Product("102", "삼전우주폰 21", "삼전전자", 1300000, "2021.2.2");
		products.put("102", p);
		
		p = new Product("103", "엘스듀얼폰", "엘스전자", 1500000, "2021.3.3");
		products.put("103", p);
	}
	
	// 상품 리스트를 리턴해주는 메소드
	public List<Product> findAll() {
		// Product 객체가 저장된 hashMap -> ArrayList로 변경 후 리턴
		return new ArrayList<>(products.values()); // Product 객체가 담긴 ArrayList 리턴
	}
	
	// 상품코드로 상품 객체를 리턴해주는 메소드
	public Product find(String id) {
		return products.get(id); // 상품코드(key값)를 이용해서 Product 객체를 받아온다.
	}
}
