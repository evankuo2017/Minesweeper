<%@ page contentType="text/html; charset=Big5" %>

<HTML>
<HEAD>
<TITLE>��a�p�}�l�e��</TITLE>
<style>
    #middle{
	position: absolute;
    top:50%;
    left:50%;
    transform:translateX(-50%) translateY(-50%);
    }
    .box{
    width: 200px;
    height: 200px;
    background: #ecd6c7;
    margin: 0 auto;/*�϶��m��*/
    }
    #bottom{
    position: absolute;
	width: 100%;
	height: 50px;
	bottom: 0px;
    text-align: center;
    margin: 0px;
    background-color:#1c2222;
    }
    .btn{
        opacity: 0.8;
        transition:0.3s;
    }
    .btn:hover{
        opacity:1;
        transform:scale(1.2);
    }
</style>
</HEAD>
<BODY bgcolor="#b6fcf1" style="margin:0px;">


    <div id="middle">
        <img style="display:block; margin:auto;" width=50% src="mine.png" alt="mine">
        <h1 style="color: #1B2430;text-align:center;">�w��Ө��a�p</h1>
        <FORM action="block.jsp" method=post name=FORM>
            <table align="center" bgcolor="FFECEC" border="0">
                <tr>
                    <td align='center' valign="middle">
                        <input class="btn" style= "background-color:F9F9F9;height:50px;width:70px;font-size:20px;" 
                        type="submit" name="start" value="start" >
                    </td>
                </tr>
            </table>
        </FROM>
    </div>
    <div id="bottom">
        <p style="color:rgb(124, 209, 184)">�����{���]�p�M�D   �խ�:���^�� ���h�Z</p>
    </div>
</BODY>
</HTML>