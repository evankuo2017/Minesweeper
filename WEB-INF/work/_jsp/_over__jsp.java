/*
 * JSP generated by Resin-3.1.6 (built Sun, 04 May 2008 03:25:50 PDT)
 */

package _jsp;
import javax.servlet.*;
import javax.servlet.jsp.*;
import javax.servlet.http.*;
import java.lang.Math;
import java.util.Date;
import java.text.SimpleDateFormat;

public class _over__jsp extends com.caucho.jsp.JavaPage
{
  private static final java.util.HashMap<String,java.lang.reflect.Method> _jsp_functionMap = new java.util.HashMap<String,java.lang.reflect.Method>();
  private boolean _caucho_isDead;

  
      String time="";
      String btn[][]=new String[9][9];
      String botton[][]=new String[9][9];
      String bottonSet[][]=new String[9][9];

  
  public void
  _jspService(javax.servlet.http.HttpServletRequest request,
              javax.servlet.http.HttpServletResponse response)
    throws java.io.IOException, javax.servlet.ServletException
  {
    javax.servlet.http.HttpSession session = request.getSession(true);
    com.caucho.server.webapp.WebApp _jsp_application = _caucho_getApplication();
    javax.servlet.ServletContext application = _jsp_application;
    com.caucho.jsp.PageContextImpl pageContext = com.caucho.jsp.QJspFactory.allocatePageContext(this, _jsp_application, request, response, null, session, 8192, true, false);
    javax.servlet.jsp.JspWriter out = pageContext.getOut();
    final javax.el.ELContext _jsp_env = pageContext.getELContext();
    javax.servlet.ServletConfig config = getServletConfig();
    javax.servlet.Servlet page = this;
    response.setContentType("text/html;charset=Big5");
    request.setCharacterEncoding("Big5");
    try {
      out.write(_jsp_string0, 0, _jsp_string0.length);
      
    for(int x=0;x<=8;x++){
        for(int y=0;y<=8;y++){
            botton[x][y]=(String)session.getAttribute("botton"+"["+Integer.toString(x)+"]["+Integer.toString(y)+"]");
            bottonSet[x][y]=(String)session.getAttribute("bottonSet"+"["+Integer.toString(x)+"]["+Integer.toString(y)+"]");
            if(botton[x][y].equals("*"))bottonSet[x][y]="color:f01b1b;"+bottonSet[x][y].replace("999","40");
        }
    }
    String lastTime=(String)session.getAttribute("time");
    Date date = new Date();
	String nowTime=date.toString();
    System.out.println(nowTime);
    System.out.println(lastTime);
    session.removeAttribute("time");
    String ls[]=lastTime.split(" ");
    String ns[]=nowTime.split(" ");
    String ls2[]=ls[3].split(":");
    String ns2[]=ns[3].split(":");
    int seconds=3600*(Integer.parseInt(ns2[0])-Integer.parseInt(ls2[0]))+60*(Integer.parseInt(ns2[1])-Integer.parseInt(ls2[1]))
    +(Integer.parseInt(ns2[2])-Integer.parseInt(ls2[2]));
    int day=seconds/(60*60*24);//\u63db\u6210\u5929
    int hour=(seconds-(60*60*24*day))/3600;//\u7e3d\u79d2\u6578-\u63db\u7b97\u6210\u5929\u7684\u79d2\u6578=\u5269\u9918\u7684\u79d2\u6578    \u5269\u9918\u7684\u79d2\u6578\u63db\u7b97\u70ba\u5c0f\u6642
    int minute=(seconds-60*60*24*day-3600*hour)/60;//\u7e3d\u79d2\u6578-\u63db\u7b97\u6210\u5929\u7684\u79d2\u6578-\u63db\u7b97\u6210\u5c0f\u6642\u7684\u79d2\u6578=\u5269\u9918\u7684\u79d2\u6578    \u5269\u9918\u7684\u79d2\u6578\u63db\u7b97\u70ba\u5206
    int second=seconds-60*60*24*day-3600*hour-60*minute;//\u7e3d\u79d2\u6578-\u63db\u7b97\u6210\u5929\u7684\u79d2\u6578-\u63db\u7b97\u6210\u5c0f\u6642\u7684\u79d2\u6578-\u63db\u7b97\u70ba\u5206\u7684\u79d2\u6578=\u5269\u9918\u7684\u79d2\u6578
    if(day==0){
        time=Integer.toString(hour)+"\u6642"+Integer.toString(minute)+"\u5206"+Integer.toString(second);
        if(hour==0){
            time=Integer.toString(minute)+"\u5206"+Integer.toString(second);
            if(minute==0){
                time=Integer.toString(second);
            }
        }
    }   
    else time=Integer.toString(day)+"\u5929"+Integer.toString(hour)+"\u6642"+Integer.toString(minute)+"\u5206"+Integer.toString(second);

      out.write(_jsp_string1, 0, _jsp_string1.length);
      if("true".equals((String)session.getAttribute("win"))){
        session.setAttribute("win","flase");
        
      out.write(_jsp_string2, 0, _jsp_string2.length);
      out.print((time));
      out.write(_jsp_string3, 0, _jsp_string3.length);
      
    }else{
      out.write(_jsp_string4, 0, _jsp_string4.length);
      out.print((time));
      out.write(_jsp_string3, 0, _jsp_string3.length);
      }
      out.write(_jsp_string5, 0, _jsp_string5.length);
      out.print((bottonSet[0][0]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[0][0]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[0][0]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[0][1]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[0][1]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[0][1]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[0][2]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[0][2]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[0][2]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[0][3]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[0][3]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[0][3]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[0][4]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[0][4]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[0][4]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[0][5]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[0][5]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[0][5]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[0][6]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[0][6]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[0][6]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[0][7]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[0][7]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[0][7]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[0][8]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[0][8]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[0][8]));
      out.write(_jsp_string9, 0, _jsp_string9.length);
      out.print((bottonSet[1][0]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[1][0]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[1][0]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[1][1]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[1][1]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[1][1]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[1][2]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[1][2]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[1][2]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[1][3]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[1][3]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[1][3]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[1][4]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[1][4]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[1][4]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[1][5]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[1][5]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[1][5]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[1][6]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[1][6]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[1][6]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[1][7]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[1][7]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[1][7]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[1][8]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[1][8]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[1][8]));
      out.write(_jsp_string9, 0, _jsp_string9.length);
      out.print((bottonSet[2][0]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[2][0]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[2][0]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[2][1]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[2][1]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[2][1]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[2][2]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[2][2]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[2][2]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[2][3]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[2][3]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[2][3]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[2][4]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[2][4]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[2][4]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[2][5]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[2][5]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[2][5]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[2][6]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[2][6]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[2][6]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[2][7]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[2][7]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[2][7]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[2][8]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[2][8]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[2][8]));
      out.write(_jsp_string9, 0, _jsp_string9.length);
      out.print((bottonSet[3][0]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[3][0]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[3][0]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[3][1]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[3][1]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[3][1]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[3][2]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[3][2]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[3][2]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[3][3]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[3][3]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[3][3]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[3][4]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[3][4]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[3][4]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[3][5]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[3][5]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[3][5]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[3][6]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[3][6]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[3][6]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[3][7]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[3][7]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[3][7]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[3][8]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[3][8]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[3][8]));
      out.write(_jsp_string9, 0, _jsp_string9.length);
      out.print((bottonSet[4][0]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[4][0]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[4][0]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[4][1]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[4][1]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[4][1]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[4][2]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[4][2]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[4][2]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[4][3]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[4][3]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[4][3]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[4][4]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[4][4]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[4][4]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[4][5]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[4][5]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[4][5]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[4][6]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[4][6]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[4][6]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[4][7]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[4][7]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[4][7]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[4][8]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[4][8]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[4][8]));
      out.write(_jsp_string9, 0, _jsp_string9.length);
      out.print((bottonSet[5][0]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[5][0]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[5][0]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[5][1]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[5][1]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[5][1]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[5][2]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[5][2]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[5][2]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[5][3]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[5][3]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[5][3]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[5][4]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[5][4]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[5][4]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[5][5]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[5][5]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[5][5]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[5][6]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[5][6]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[5][6]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[5][7]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[5][7]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[5][7]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[5][8]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[5][8]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[5][8]));
      out.write(_jsp_string9, 0, _jsp_string9.length);
      out.print((bottonSet[6][0]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[6][0]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[6][0]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[6][1]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[6][1]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[6][1]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[6][2]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[6][2]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[6][2]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[6][3]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[6][3]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[6][3]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[6][4]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[6][4]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[6][4]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[6][5]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[6][5]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[6][5]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[6][6]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[6][6]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[6][6]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[6][7]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[6][7]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[6][7]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[6][8]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[6][8]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[6][8]));
      out.write(_jsp_string9, 0, _jsp_string9.length);
      out.print((bottonSet[7][0]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[7][0]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[7][0]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[7][1]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[7][1]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[7][1]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[7][2]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[7][2]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[7][2]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[7][3]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[7][3]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[7][3]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[7][4]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[7][4]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[7][4]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[7][5]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[7][5]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[7][5]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[7][6]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[7][6]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[7][6]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[7][7]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[7][7]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[7][7]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[7][8]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[7][8]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[7][8]));
      out.write(_jsp_string9, 0, _jsp_string9.length);
      out.print((bottonSet[8][0]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[8][0]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[8][0]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[8][1]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[8][1]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[8][1]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[8][2]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[8][2]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[8][2]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[8][3]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[8][3]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[8][3]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[8][4]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[8][4]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[8][4]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[8][5]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[8][5]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[8][5]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[8][6]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[8][6]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[8][6]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[8][7]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[8][7]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[8][7]));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print((bottonSet[8][8]));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print((btn[8][8]));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print((botton[8][8]));
      out.write(_jsp_string10, 0, _jsp_string10.length);
    } catch (java.lang.Throwable _jsp_e) {
      pageContext.handlePageException(_jsp_e);
    } finally {
      com.caucho.jsp.QJspFactory.freePageContext(pageContext);
    }
  }

  private java.util.ArrayList _caucho_depends = new java.util.ArrayList();

  public java.util.ArrayList _caucho_getDependList()
  {
    return _caucho_depends;
  }

  public void _caucho_addDepend(com.caucho.vfs.PersistentDependency depend)
  {
    super._caucho_addDepend(depend);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
  }

  public boolean _caucho_isModified()
  {
    if (_caucho_isDead)
      return true;
    if (com.caucho.server.util.CauchoSystem.getVersionId() != -7072480922035483583L)
      return true;
    for (int i = _caucho_depends.size() - 1; i >= 0; i--) {
      com.caucho.vfs.Dependency depend;
      depend = (com.caucho.vfs.Dependency) _caucho_depends.get(i);
      if (depend.isModified())
        return true;
    }
    return false;
  }

  public long _caucho_lastModified()
  {
    return 0;
  }

  public java.util.HashMap<String,java.lang.reflect.Method> _caucho_getFunctionMap()
  {
    return _jsp_functionMap;
  }

  public void init(ServletConfig config)
    throws ServletException
  {
    com.caucho.server.webapp.WebApp webApp
      = (com.caucho.server.webapp.WebApp) config.getServletContext();
    super.init(config);
    com.caucho.jsp.TaglibManager manager = webApp.getJspApplicationContext().getTaglibManager();
    com.caucho.jsp.PageContextImpl pageContext = new com.caucho.jsp.PageContextImpl(webApp, this);
  }

  public void destroy()
  {
      _caucho_isDead = true;
      super.destroy();
  }

  public void init(com.caucho.vfs.Path appDir)
    throws javax.servlet.ServletException
  {
    com.caucho.vfs.Path resinHome = com.caucho.server.util.CauchoSystem.getResinHome();
    com.caucho.vfs.MergePath mergePath = new com.caucho.vfs.MergePath();
    mergePath.addMergePath(appDir);
    mergePath.addMergePath(resinHome);
    com.caucho.loader.DynamicClassLoader loader;
    loader = (com.caucho.loader.DynamicClassLoader) getClass().getClassLoader();
    String resourcePath = loader.getResourcePathSpecificFirst();
    mergePath.addClassPath(resourcePath);
    com.caucho.vfs.Depend depend;
    depend = new com.caucho.vfs.Depend(appDir.lookup("over.jsp"), -1133880951441337833L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
  }

  private final static char []_jsp_string9;
  private final static char []_jsp_string2;
  private final static char []_jsp_string4;
  private final static char []_jsp_string0;
  private final static char []_jsp_string6;
  private final static char []_jsp_string8;
  private final static char []_jsp_string1;
  private final static char []_jsp_string10;
  private final static char []_jsp_string7;
  private final static char []_jsp_string3;
  private final static char []_jsp_string5;
  static {
    _jsp_string9 = " >\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td align='center' valign=\"middle\">\r\n                    <input style=".toCharArray();
    _jsp_string2 = "<FONT  SIZE = 5 COLOR = \"#5FD068\" face=\"\u5fae\u8edf\u6b63\u9ed1\u9ad4\"><b>\u60a8\u907f\u958b\u4e86\u6240\u6709\u5730\u96f7!\u8017\u6642\uff1a".toCharArray();
    _jsp_string4 = "<FONT  SIZE = 5 COLOR = \"#5FD068\" face=\"\u5fae\u8edf\u6b63\u9ed1\u9ad4\"><b>\u60a8\u8e29\u5230\u4e86\u5730\u96f7!\u8017\u6642\uff1a".toCharArray();
    _jsp_string0 = "\r\n\r\n\r\n\r\n<HTML>\r\n<HEAD>\r\n<TITLE>\u904a\u6232\u7d50\u675f</TITLE>\r\n</HEAD>\r\n<BODY bgcolor=\"#b6fcf1\">\r\n\r\n".toCharArray();
    _jsp_string6 = " type=\"submit\" name=".toCharArray();
    _jsp_string8 = " >\r\n                </td>\r\n                <td align='center' valign=\"middle\">\r\n                    <input style=".toCharArray();
    _jsp_string1 = "\r\n        \r\n<style>\r\n	input{\r\n		height:70px;\r\n		width:70px;\r\n	}\r\n    .btn{\r\n        transition:0.3s;\r\n		background-color:F9F9F9;\r\n    }\r\n    .btn:hover{\r\n        opacity:1.5;\r\n		background-color:B3E8E5;\r\n    }\r\n	.btn:active{\r\n    background-color: FFC3C3;\r\n    }\r\n\r\n</style>\r\n<CENTER>\r\n    <form action=\"welcome.jsp\" method=post name=form1>\r\n    ".toCharArray();
    _jsp_string10 = " >\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </FROM>\r\n    </BODY>\r\n    </HTML>\r\n    ".toCharArray();
    _jsp_string7 = " value=".toCharArray();
    _jsp_string3 = "\u79d2</b></FONT>".toCharArray();
    _jsp_string5 = "\r\n    <input style= \"height:25px;width:50px;font-size:20px; font-size: 15px;\" \r\n	class=\"btn\"	type=\"submit\" name=\"reset\" value=\"\u91cd\u958b\" >\r\n    </form>\r\n</CENTER>\r\n    <FORM action=\"welcome.jsp\" method=post name=FORM>\r\n        <table style=\"border-collapse: collapse;border-spacing: 0;\" align=\"center\" bgcolor=\"FFECEC\" border=\"0\">\r\n            <tr>\r\n                <td align='center' valign=\"middle\">\r\n                    <input style=".toCharArray();
  }
}
