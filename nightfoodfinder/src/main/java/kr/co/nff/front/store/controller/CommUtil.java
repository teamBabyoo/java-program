package kr.co.nff.front.store.controller;

import java.util.UUID;

public class CommUtil {
	public static String getUuid() {
		return UUID.randomUUID().toString().replaceAll("-", ""); 
	}
}
