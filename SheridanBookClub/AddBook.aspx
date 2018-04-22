<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddBook.aspx.cs" Inherits="SheridanBookClub.AddBook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Add Review</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
    <link rel="stylesheet" href="/resources/demos/style.css"/>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <style type="text/css">
        .auto-style1 {
            margin-top: 84px;
        }
        html{height: 100%;}
        body{
            margin: 0;
            padding: 0;
           
            color: white;
            text-align: center;
            background-color: #444444;
            font-family: 'Work Sans', sans-serif;
            font-weight: 300;
            font-size: 1em;
            overflow: hidden;

        }

        form> div{
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            padding-left: 20px;
            padding-right: 20px;
            padding-top: 2vh;
            margin: auto;
            width: 800px;
            background-color: whitesmoke;
            color: #666666;
            height: 100vh;
            box-shadow: 0 3px 6px #00000017;
        }

        form{
            z-index:-1;
            top: 5vh;
            position: absolute;
            width: 100%;
            height: 100vh;
        }

        h1{
            padding: 20px, 40px, 20px, 40px;
            background-color: #ff5e50;
            font-weight: 900;
            font-size: 3vw;
            margin:auto;
            width: 700px;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            box-shadow: 0 3px 6px #00000017;
        }

        .filter{
            position:absolute;
            top: 6vh;
            background-color: white;
            width: 300px;
            text-align:left;
            margin: 0;
            padding: 0;
            height: 650px;
            box-sizing: border-box;
            padding: 10px;
            border-radius: 10px;
            box-shadow: 0 3px 6px #00000017;
            overflow: hidden;
        }
        

        heder{
            z-index: 1;
            position: fixed;
            width: 100%;
            
        }
        label{
            display:block;
        }
        .search{
          text-align: right;
        }
        .btn-search{
            margin: 5px;
            text-align: right;
            color: white;
            
            padding: 5px;
            
        }

        .btn-search label{
           background-color: #ff5e50;
           width: 50px;
           margin-left: calc(100% - 50px);
           padding: 5px;
           border-radius: 5px;
           box-shadow: 0 3px 6px #00000017;
        }

        .btn-search label:hover {
            cursor: pointer;
        }

        ul {
            list-style-type: none;
            margin: 0;
            padding: 5px;
            overflow-y:auto;
            height: 550px;
            display: inline-block;
        }
        li{
            margin-bottom: 10px;
            padding: 5px;
        }
        li:hover{
            cursor: pointer;
            background-color: #ff5e50;
            color: white;
        }

        .reviews{
            top: 6vh;
            position: absolute;
            padding: 5px;
            width: 480px;
            height: 100%;
            right: calc((100vw - 800px)/2);
            border-radius: 0px;
            overflow-y: auto;
        }

        .review{
            padding: 10px;
            box-sizing:border-box;
            margin-bottom: 15px;
            margin-top: 10px;
            height:auto;
            width: 100%;
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.40);
            border-radius: 5px;
            background-color: white;
            display:block;
        }
        .review> .header{
            text-align: left;
            padding: 10px;
            font-weight:800;
        }

        .review> .content{
            text-align: left;
            padding: 10px;
            font-weight:200;
        }
        .reviews> .header{
            text-align: left;
            padding: 10px;
            font-weight:700;
            font-size: 2em;
        }
        .ui-widget-header{
            color: #ff5e50;
        }
        .ui-state-active, .ui-widget-content .ui-state-active{
            border: 1px solid #ff5e50;
            background: #ff5e50;
        }
        table{
            width: 100%;
        }
        table input, .filter input{
            border: none;
            background-color: whitesmoke;
            padding: 5px;
            margin-right: 10px;
            width: 95%;
            color: #666666;
        }

        nav{
            position: absolute;
            left: 30px;
            padding: 15px;
            text-align: left;

        }

        nav a{
            text-transform: uppercase;
            text-decoration: none;
            display: block;
            color: whitesmoke;
            font-weight:700;
            margin-bottom: 20px;
            background-color: gray;
            padding: 10px;
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.40);
        }

        nav a:hover{
            background-color: #ff5e50;
        }

        .active{
            background-color: slategray;
        }
        
        
    </style>
</head>
<body>
    <header>
        <h1>ADD BOOK</h1>
    </header>
    <nav>
        <a href="SearchReview.aspx">Search Review</a>
        <a href="AddReview.aspx">Add Review</a>
        <a class="active" href="AddBook.aspx">Add Book</a>
    </nav>
    <form id="form1" runat="server">
        <div>
            <div class="filter">

                <input id="BookName" name="BookName" type="text" onkeyup="myFunction()" placeholder="Search"/>
                <hr />
                <ul id="listBook" runat="server"></ul>
            </div>
            <div class="reviews" style="text-align: left" runat="server" id="Reviews">
                <div class="review">
                    <table  runat="server" >
                        <tr>
                            <td><label for="name">Book Name</label></td>
                            <td><input runat="server" required="required" id="name" type="text" onkeyup="myFunction()" /></td>
                        </tr>
                        <tr>
                            <td><label for="releaseDate">Release Date</label></td>
                            <td><input runat="server" required="required" id="releaseDate" type="text"  /></td>
                        </tr>
                        <tr>
                            <td><label for="isbn">ISBN</label></td>
                            <td><input runat="server" required="required" id="isbn" type="text" /></td>
                        </tr>
                        <tr>
                            <td><input runat="server" id="add" hidden="hidden" type="submit"/></td>
                            <td class="btn-search"><label style="text-align:center;" runat="server" for="add">Add</label></td>
                        </tr>
                    </table>
                </div>
            </div>  
        </div>
    </form>
    <script>
        $(function () {
            $("#releaseDate").datepicker({
                changeMonth: true,
                changeYear: true,
                maxDate: "+0D"
            });
        });

        function myFunction() {
            var input, filter, ul, li, a, i;
            input = document.getElementById("BookName");
            filter = input.value.toUpperCase();
            ul = document.getElementById("listBook");
            li = ul.getElementsByTagName("li");
            for (i = 0; i < li.length; i++) {

                if (li[i].innerHTML.toUpperCase().indexOf(filter) > -1) {
                    li[i].style.display = "";
                } else {
                    li[i].style.display = "none";

                }
            }
        }
    </script>
</body>
</html>
