<%@ page contentType="text/html;charset=Big5" errorPage="error.jsp"%>
<%@ page import="java.lang.Math" %>
<%@page import="java.util.Date"%>
<!--
	網路程式設計專題報告，組員：江英碩、郭逸凡

	前言：這個程式碼並沒有參考網路上的程式，全部自己從頭編寫，但也因此誤把變數名稱button拼錯
	成botton但是類似的變數名稱太多，故沒有去一一修改，有時間的話一定改正

	使用說明：
-->
<HTML>
<HEAD>
<TITLE>踩地雷</TITLE>
</HEAD>

<BODY bgcolor="#b6fcf1">
	
<%!
	String signBomb="進入標記模式";
	String time="";													//時間
	boolean bottonDif[][]=new boolean[9][9];						//按鈕是否為""且已被擴散
	String btn[][]=new String[9][9];								//按鈕 name
	String bottonSet[][]=new String[9][9];							//按鈕美編(是否顯示)
	String hiddenSet="font-size:999px;background-color:#cbadea; class=\"blockHidden\"";	//美編為隱藏
	String clearSet="font-size:20px;background-color:#F9F9F9;";		//美編為顯示
	boolean welcome=true;											//是否第一次進此頁面
	String botton[][]=new String[9][9]; 							//按鈕本身
	
	public void setMap(){
		/*初始化時間及標記模式*/
		Date date = new Date();
		time=date.toString();
		signBomb="進入標記模式";
		/*初始化按鈕*/
		for(int i=0;i<=8;i++){
			for(int j=0;j<=8;j++){
				botton[i][j]="";
				btn[i][j]="["+Integer.toString(i)+"]"+"["+Integer.toString(j)+"]";
				bottonSet[i][j]=hiddenSet;
				bottonDif[i][j]=false;
			}
		}
		/*亂數設定炸彈座標*/
		int count=0;
		while(count!=10){
			int x=(int)(Math.random()*9),y=(int)(Math.random()*9); 
			if(!botton[x][y].equals("*")){
				botton[x][y]="*";
				count++;
			}
		}
		/*創建地圖數字*/
		for(int x=0;x<=8;x++){
			for(int y=0;y<=8;y++){
				if(!botton[x][y].equals("*")){
					count=0;
					if(y+1<=8 && botton[x][y+1].equals("*"))count++;
					if(y-1>=0 && botton[x][y-1].equals("*"))count++;
					if(x-1>=0 && botton[x-1][y].equals("*"))count++;
					if(x+1<=8 && botton[x+1][y].equals("*"))count++;
					if(x-1>=0 && y+1<=8 && botton[x-1][y+1].equals("*"))count++;
					if(x-1>=0 && y-1>=0 && botton[x-1][y-1].equals("*"))count++;
					if(x+1<=8 && y-1>=0 && botton[x+1][y-1].equals("*"))count++;
					if(x+1<=8 && y+1<=8 && botton[x+1][y+1].equals("*"))count++;
					if(count!=0)botton[x][y]=Integer.toString(count);
				}
			}
		}

	}
	public void diffusion(int x,int y){
		/*九宮格遞迴擴散*/
		bottonDif[x][y]=true;
		if(y+1<=8) {
			bottonSet[x][y+1]=clearSet;
			if(botton[x][y+1].equals("")&&!bottonDif[x][y+1])diffusion(x,y+1);
		}if(y-1>=0) {
			bottonSet[x][y-1]=clearSet;
			if(botton[x][y-1].equals("")&&!bottonDif[x][y-1])diffusion(x,y-1);
		}if(x-1>=0) {
			bottonSet[x-1][y]=clearSet;
			if(botton[x-1][y].equals("")&&!bottonDif[x-1][y])diffusion(x-1,y);
		}if(x+1<=8) {
			bottonSet[x+1][y]=clearSet;
			if(botton[x+1][y].equals("")&&!bottonDif[x+1][y])diffusion(x+1,y);
		}if(x-1>=0 && y+1<=8) {
			bottonSet[x-1][y+1]=clearSet;
			if(botton[x-1][y+1].equals("")&&!bottonDif[x-1][y+1])diffusion(x-1,y+1);
		}if(x-1>=0 && y-1>=0) {
			bottonSet[x-1][y-1]=clearSet;
			if(botton[x-1][y-1].equals("")&&!bottonDif[x-1][y-1])diffusion(x-1,y-1);
		}if(x+1<=8 && y-1>=0) {
			bottonSet[x+1][y-1]=clearSet;
			if(botton[x+1][y-1].equals("")&&!bottonDif[x+1][y-1])diffusion(x+1,y-1);
		}if(x+1<=8 && y+1<=8) {
			bottonSet[x+1][y+1]=clearSet;
			if(botton[x+1][y+1].equals("")&&!bottonDif[x+1][y+1])diffusion(x+1,y+1);
		}
	}
	/*是否符合勝利條件*/
	public boolean win(){
		for(int x=0;x<=8;x++){
			for(int y=0;y<=8;y++){
				if(!botton[x][y].equals("*") && bottonSet[x][y].equals(hiddenSet))return false;
			}
		}return true;
	}
	public void sign(){
		if(bottonSet[0][0].equals(hiddenSet)){
			bottonSet[0][0]=hiddenSet+"background-image: url(\"sign.png\")";
		}else bottonSet[0][0]=hiddenSet;
	}
%>

<%
	
	/*遊戲開始，隨機預設地圖*/
	if(request.getParameter("start") != null||request.getParameter("reset")!=null){
		welcome=true;
	}
	if(welcome){
		setMap();
		session.setAttribute("time",time);
		welcome=false;
	}
	if(request.getParameter("sign")!=null){
		if(signBomb.equals("進入標記模式"))signBomb="取消標記模式";
		else signBomb="進入標記模式";
	}
	/*按鈕偵測*/
	if(signBomb.equals("進入標記模式")){
		for(int x=0;x<=8;x++){
			for(int y=0;y<=8;y++){
				if(request.getParameter(btn[x][y]) != null){//如果有按鈕被按下就進入偵測
					if(request.getParameter(btn[x][y]).equals("*")) {//爆炸
						for(int i=0;i<=8;i++){
							for(int j=0;j<=8;j++){
								session.setAttribute("botton"+"["+Integer.toString(i)+"]["+Integer.toString(j)+"]"
								,botton[i][j]);
								session.setAttribute("bottonSet"+"["+Integer.toString(i)+"]["+Integer.toString(j)+"]"
								,bottonSet[i][j]);
							}
						}%><jsp:forward page="over.jsp"></jsp:forward><%
					}else{	//沒爆炸
						bottonSet[x][y]=clearSet;
						if(botton[x][y].equals("")){
							diffusion(x,y);
						}if(win()){
							session.setAttribute("win","true");
							for(int i=0;i<=8;i++){
								for(int j=0;j<=8;j++){
									session.setAttribute("botton"+"["+Integer.toString(i)+"]["+Integer.toString(j)+"]"
									,botton[i][j]);
									session.setAttribute("bottonSet"+"["+Integer.toString(i)+"]["+Integer.toString(j)+"]"
									,bottonSet[i][j]);
								}
							}%><jsp:forward page="over.jsp"></jsp:forward><%
						} 
					}
				}
			}
		}	
	}else{/*標記模式*/
		for(int x=0;x<=8;x++){
			for(int y=0;y<=8;y++){
				if(request.getParameter(btn[x][y]) != null){//如果有按鈕被按下就進入偵測
					if(bottonSet[x][y].equals(hiddenSet))bottonSet[x][y]="background-image:url(\"sign1.png\");"+hiddenSet;
					else if(bottonSet[x][y].equals("background-image:url(\"sign1.png\");"+hiddenSet))bottonSet[x][y]=hiddenSet;
				}
			}
		}	
	}
	
	
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
	.blockHidden{
		transition:0.3s;
		font-size:20px;
		background-color:#F9F9F9;
	}
	.blockHidden:hover{
		box-shadow:inset 0 0 0 3px #816797;
	}
	.blockShow{
		font-size:999px;
		background-color:#cbadea;
	}
</style>

<CENTER>
	<form action="block.jsp" method=post name=form1>
		<input style= "height:25px;width:120px;font-size:20px; font-size: 15px;" 
		class="btn" type="submit" name="sign" value=<%=signBomb%> >
		<FONT SIZE = 5 style="color:rgb(26, 60, 64) ;"><b>踩地雷遊戲</b></FONT>
		<input style= "height:25px;width:50px;font-size:20px; font-size: 15px;" 
		class="btn" type="submit" name="reset" value="重開" >
	</form>
</CENTER>


<form action="block.jsp" method=post name=form>
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
</form>
</BODY>
</HTML>
