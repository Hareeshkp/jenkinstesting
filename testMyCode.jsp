<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>jQuery multi-select.js Plugin Examples</title>
    <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="./css/example-styles.css">
    <link rel="stylesheet" type="text/css" href="./css/demo-styles.css">
    <style>
        body {
    padding:0;
}
.container { margin: 150px auto; max-width: 960px;}
    </style>

<title>Insert title here</title>
</head>
<body>
    <div class="container">
<h1>jQuery multi-select.js Plugin Examples</h1>
    <form class="demo-example">
        <label for="people">Select people:</label>
        <select id="people" name="people" multiple>
            <option value="alice">Alice</option>
            <option value="bob">Bob</option>
            <option value="carol">Carol</option>
        </select>
    </form>

    </div>
<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
    <script type="text/javascript" src="./js/jquery.multi-select.js"></script>
    <script type="text/javascript">
    $(function(){
        $('#people').multiSelect();
            });
    </script>

</body>
</html>