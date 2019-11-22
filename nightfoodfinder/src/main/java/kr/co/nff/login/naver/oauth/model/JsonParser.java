package kr.co.nff.login.naver.oauth.model;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import kr.co.nff.repository.vo.User;


public class JsonParser {
	JSONParser jsonParser = new JSONParser();

	public User changeJson(String string) throws Exception {

		HashMap<String, Object> map = new HashMap<>();
		JSONParser jsonParser = new JSONParser();
		User vo = new User();

		JSONObject jsonObject = (JSONObject) jsonParser.parse(string);

		jsonObject = (JSONObject) jsonObject.get("response");

		map.put("userGender", jsonObject.get("gender"));
		map.put("userId", jsonObject.get("id"));
		map.put("userName", jsonObject.get("name"));
		map.put("userEmail", jsonObject.get("email"));
		map.put("userAge", jsonObject.get("age"));
		
		vo.setUserEmail(map.get("userEmail").toString());
		vo.setUserGender(map.get("userGender").toString());
		vo.setUserId(map.get("userId").toString());
		vo.setUserName(map.get("userName").toString());
		vo.setUserAge(map.get("userAge").toString());
		
		return vo;
	}
}
