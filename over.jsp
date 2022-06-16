<%@ page contentType="text/html;charset=Big5" %>
<%@ page import="java.lang.Math" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<HTML>
<HEAD>
<TITLE>笴栏挡</TITLE>
</HEAD>
<BODY bgcolor="#b6fcf1">
<%!
    String time="";
    String btn[][]=new String[9][9];
    String botton[][]=new String[9][9];
    String bottonSet[][]=new String[9][9];
%>
<%
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
    int day=seconds/(60*60*24);//传Θぱ
    int hour=(seconds-(60*60*24*day))/3600;//羆计-传衡Θぱ计=逞緇计    逞緇计传衡
    int minute=(seconds-60*60*24*day-3600*hour)/60;//羆计-传衡Θぱ计-传衡Θ计=逞緇计    逞緇计传衡だ
    int second=seconds-60*60*24*day-3600*hour-60*minute;//羆计-传衡Θぱ计-传衡Θ计-传衡だ计=逞緇计
    if(day==0){
        time=Integer.toString(hour)+""+Integer.toString(minute)+"だ"+Integer.toString(second);
        if(hour==0){
            time=Integer.toString(minute)+"だ"+Integer.toString(second);
            if(minute==0){
                time=Integer.toString(second);
            }
        }
    }   
    else time=Integer.toString(day)+"ぱ"+Integer.toString(hour)+""+Integer.toString(minute)+"だ"+Integer.toString(second);
%>
        
<style>
	input{
		height:70px;
		width:70px;
	}
    .btn{
        transition:0.3s;
		background-color:F9F9F9;
    }
    .btn:hover{
        opacity:1.5;
		background-color:B3E8E5;
    }
	.btn:active{
    background-color: FFC3C3;
    }

</style>
<CENTER>
    <form action="welcome.jsp" method=post name=form1>
    <%if("true".equals((String)session.getAttribute("win"))){
        session.setAttribute("win","flase");
        %><FONT  SIZE = 5 COLOR = "#5FD068" face="稬硁タ堵砰"><b>眤磷秨┮Τ筽!<%=time%></b></FONT><%
    }else{%><FONT  SIZE = 5 COLOR = "#5FD068" face="稬硁タ堵砰"><b>眤津筽!<%=time%></b></FONT><%}%>
    <input style= "height:25px;width:50px;font-size:20px; font-size: 15px;" 
	class="btn"	type="submit" name="reset" value="秨" >
    </form>
</CENTER>
    <FORM action="welcome.jsp" method=post name=FORM>
        <table style="border-collapse: collapse;border-spacing: 0;" align="center" bgcolor="FFECEC" border="0">
            <tr>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[0][0]%> type="submit" name=<%=btn[0][0]%> value=<%=botton[0][0]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[0][1]%> type="submit" name=<%=btn[0][1]%> value=<%=botton[0][1]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[0][2]%> type="submit" name=<%=btn[0][2]%> value=<%=botton[0][2]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[0][3]%> type="submit" name=<%=btn[0][3]%> value=<%=botton[0][3]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[0][4]%> type="submit" name=<%=btn[0][4]%> value=<%=botton[0][4]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[0][5]%> type="submit" name=<%=btn[0][5]%> value=<%=botton[0][5]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[0][6]%> type="submit" name=<%=btn[0][6]%> value=<%=botton[0][6]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[0][7]%> type="submit" name=<%=btn[0][7]%> value=<%=botton[0][7]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[0][8]%> type="submit" name=<%=btn[0][8]%> value=<%=botton[0][8]%> >
                </td>
            </tr>
            <tr>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[1][0]%> type="submit" name=<%=btn[1][0]%> value=<%=botton[1][0]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[1][1]%> type="submit" name=<%=btn[1][1]%> value=<%=botton[1][1]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[1][2]%> type="submit" name=<%=btn[1][2]%> value=<%=botton[1][2]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[1][3]%> type="submit" name=<%=btn[1][3]%> value=<%=botton[1][3]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[1][4]%> type="submit" name=<%=btn[1][4]%> value=<%=botton[1][4]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[1][5]%> type="submit" name=<%=btn[1][5]%> value=<%=botton[1][5]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[1][6]%> type="submit" name=<%=btn[1][6]%> value=<%=botton[1][6]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[1][7]%> type="submit" name=<%=btn[1][7]%> value=<%=botton[1][7]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[1][8]%> type="submit" name=<%=btn[1][8]%> value=<%=botton[1][8]%> >
                </td>
            </tr>
            <tr>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[2][0]%> type="submit" name=<%=btn[2][0]%> value=<%=botton[2][0]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[2][1]%> type="submit" name=<%=btn[2][1]%> value=<%=botton[2][1]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[2][2]%> type="submit" name=<%=btn[2][2]%> value=<%=botton[2][2]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[2][3]%> type="submit" name=<%=btn[2][3]%> value=<%=botton[2][3]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[2][4]%> type="submit" name=<%=btn[2][4]%> value=<%=botton[2][4]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[2][5]%> type="submit" name=<%=btn[2][5]%> value=<%=botton[2][5]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[2][6]%> type="submit" name=<%=btn[2][6]%> value=<%=botton[2][6]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[2][7]%> type="submit" name=<%=btn[2][7]%> value=<%=botton[2][7]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[2][8]%> type="submit" name=<%=btn[2][8]%> value=<%=botton[2][8]%> >
                </td>
            </tr>
            <tr>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[3][0]%> type="submit" name=<%=btn[3][0]%> value=<%=botton[3][0]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[3][1]%> type="submit" name=<%=btn[3][1]%> value=<%=botton[3][1]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[3][2]%> type="submit" name=<%=btn[3][2]%> value=<%=botton[3][2]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[3][3]%> type="submit" name=<%=btn[3][3]%> value=<%=botton[3][3]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[3][4]%> type="submit" name=<%=btn[3][4]%> value=<%=botton[3][4]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[3][5]%> type="submit" name=<%=btn[3][5]%> value=<%=botton[3][5]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[3][6]%> type="submit" name=<%=btn[3][6]%> value=<%=botton[3][6]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[3][7]%> type="submit" name=<%=btn[3][7]%> value=<%=botton[3][7]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[3][8]%> type="submit" name=<%=btn[3][8]%> value=<%=botton[3][8]%> >
                </td>
            </tr>
            <tr>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[4][0]%> type="submit" name=<%=btn[4][0]%> value=<%=botton[4][0]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[4][1]%> type="submit" name=<%=btn[4][1]%> value=<%=botton[4][1]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[4][2]%> type="submit" name=<%=btn[4][2]%> value=<%=botton[4][2]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[4][3]%> type="submit" name=<%=btn[4][3]%> value=<%=botton[4][3]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[4][4]%> type="submit" name=<%=btn[4][4]%> value=<%=botton[4][4]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[4][5]%> type="submit" name=<%=btn[4][5]%> value=<%=botton[4][5]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[4][6]%> type="submit" name=<%=btn[4][6]%> value=<%=botton[4][6]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[4][7]%> type="submit" name=<%=btn[4][7]%> value=<%=botton[4][7]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[4][8]%> type="submit" name=<%=btn[4][8]%> value=<%=botton[4][8]%> >
                </td>
            </tr>
            <tr>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[5][0]%> type="submit" name=<%=btn[5][0]%> value=<%=botton[5][0]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[5][1]%> type="submit" name=<%=btn[5][1]%> value=<%=botton[5][1]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[5][2]%> type="submit" name=<%=btn[5][2]%> value=<%=botton[5][2]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[5][3]%> type="submit" name=<%=btn[5][3]%> value=<%=botton[5][3]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[5][4]%> type="submit" name=<%=btn[5][4]%> value=<%=botton[5][4]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[5][5]%> type="submit" name=<%=btn[5][5]%> value=<%=botton[5][5]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[5][6]%> type="submit" name=<%=btn[5][6]%> value=<%=botton[5][6]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[5][7]%> type="submit" name=<%=btn[5][7]%> value=<%=botton[5][7]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[5][8]%> type="submit" name=<%=btn[5][8]%> value=<%=botton[5][8]%> >
                </td>
            </tr>
            <tr>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[6][0]%> type="submit" name=<%=btn[6][0]%> value=<%=botton[6][0]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[6][1]%> type="submit" name=<%=btn[6][1]%> value=<%=botton[6][1]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[6][2]%> type="submit" name=<%=btn[6][2]%> value=<%=botton[6][2]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[6][3]%> type="submit" name=<%=btn[6][3]%> value=<%=botton[6][3]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[6][4]%> type="submit" name=<%=btn[6][4]%> value=<%=botton[6][4]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[6][5]%> type="submit" name=<%=btn[6][5]%> value=<%=botton[6][5]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[6][6]%> type="submit" name=<%=btn[6][6]%> value=<%=botton[6][6]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[6][7]%> type="submit" name=<%=btn[6][7]%> value=<%=botton[6][7]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[6][8]%> type="submit" name=<%=btn[6][8]%> value=<%=botton[6][8]%> >
                </td>
            </tr>
            <tr>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[7][0]%> type="submit" name=<%=btn[7][0]%> value=<%=botton[7][0]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[7][1]%> type="submit" name=<%=btn[7][1]%> value=<%=botton[7][1]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[7][2]%> type="submit" name=<%=btn[7][2]%> value=<%=botton[7][2]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[7][3]%> type="submit" name=<%=btn[7][3]%> value=<%=botton[7][3]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[7][4]%> type="submit" name=<%=btn[7][4]%> value=<%=botton[7][4]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[7][5]%> type="submit" name=<%=btn[7][5]%> value=<%=botton[7][5]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[7][6]%> type="submit" name=<%=btn[7][6]%> value=<%=botton[7][6]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[7][7]%> type="submit" name=<%=btn[7][7]%> value=<%=botton[7][7]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[7][8]%> type="submit" name=<%=btn[7][8]%> value=<%=botton[7][8]%> >
                </td>
            </tr>
            <tr>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[8][0]%> type="submit" name=<%=btn[8][0]%> value=<%=botton[8][0]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[8][1]%> type="submit" name=<%=btn[8][1]%> value=<%=botton[8][1]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[8][2]%> type="submit" name=<%=btn[8][2]%> value=<%=botton[8][2]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[8][3]%> type="submit" name=<%=btn[8][3]%> value=<%=botton[8][3]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[8][4]%> type="submit" name=<%=btn[8][4]%> value=<%=botton[8][4]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[8][5]%> type="submit" name=<%=btn[8][5]%> value=<%=botton[8][5]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[8][6]%> type="submit" name=<%=btn[8][6]%> value=<%=botton[8][6]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[8][7]%> type="submit" name=<%=btn[8][7]%> value=<%=botton[8][7]%> >
                </td>
                <td align='center' valign="middle">
                    <input style=<%=bottonSet[8][8]%> type="submit" name=<%=btn[8][8]%> value=<%=botton[8][8]%> >
                </td>
            </tr>
        </table>
    </FROM>
    </BODY>
    </HTML>
    