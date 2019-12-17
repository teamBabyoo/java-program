package kr.co.nff.admin.listener;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;


import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

import kr.co.nff.admin.stat.service.StatService;
import kr.co.nff.repository.vo.Stat;


public class VisitCounter implements HttpSessionListener {
    @Override
    public void sessionCreated(HttpSessionEvent event){
        HttpSession session = event.getSession();
        WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(session.getServletContext());
        //등록되어있는 빈을 사용할수 있도록 설정해준다
        HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
        //request를 파라미터에 넣지 않고도 사용할수 있도록 설정
        StatService service = (StatService)wac.getBean("kr.co.nff.admin.stat.service.StatServiceImpl");
        Stat stat = new Stat();
        stat.setVisitIp(req.getRemoteAddr());
        service.insertVisitor(stat);
        
    }
    @Override
    public void sessionDestroyed(HttpSessionEvent event){
        System.out.println("세션 끝");
    }
    
}


