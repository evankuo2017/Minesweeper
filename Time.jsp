<html><head>
    <script>
    <%
    String clock = request.getParameter( "clock" );
    if( clock == null ) clock = "0";
    %>
    var timeout = <%=clock%>;
    function timer()
    {
    timeout++;
    document.forma.clock.value = timeout;
    window.setTimeout( "timer()", 1000 );
    }
    
    </script>
    </head>
    <body>
    <form action="<%=request.getRequestURL()%>" name="forma">
    Seconds remaining: <input type="text" name="clock" value="<%=clock%>" style="border:0px solid white">
    ...
    </form>
    <script>
    timer();
    </script>
    </body></html>