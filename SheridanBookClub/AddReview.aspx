<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddReview.aspx.cs" Inherits="SheridanBookClub.AddReview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Review</title>
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
           margin-left: 60%;
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
            box-sizing:border-box;
            margin-bottom: 15px;
            margin-top: 10px;
            height:300px;
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
        <h1>ADD REVIEWS</h1>
    </header>
    <nav>
        <a href="SearchReview.aspx">Search Review</a>
        <a class="active" href="AddReview.aspx">Add Review</a>
        <a href="AddBook.aspx">Add Book</a>
    </nav>
    <form id="form1" runat="server">
        <div>
            <div class="filter">
                <table  runat="server" >
                    <tr>
                        <td><label runat="server" for="BookName">Book Name</label></td>
                        <td><input runat="server" required="required" id="BookName" name="BookName" type="text" onkeyup="myFunction()" /></td>
                    </tr>
                    <tr>
                        <td><label runat="server" for="Bookid">Book ID</label></td>
                        <td><input runat="server" required="required" id="Bookid" name="Bookid" type="text"  /></td>
                    </tr>
                </table>
                <hr />
                <ul id="listBook" runat="server"></ul>
            </div>
            <div class="reviews" style="text-align: left" runat="server" id="Reviews">
                <div class="header" id="bookName">Book Name</div>
                <div class="review" id="reviewContainer">
                    <textarea required="required" style="border: 0px; width:100%; height:100%; resize: none; box-sizing:border-box;"  rows="50" runat="server" id="review"></textarea>
                </div>
                
                    <label for="reviewer" style="display:inline">Reviewer</label>
                    <input required="required" style="border: 0px; resize: none; box-sizing:border-box;" runat="server" id="reviewer"/>
                    <label for="rate" style="display:inline">Rate</label>
                    <input style="border: 0px; resize: none; box-sizing:border-box;" type="number" min="0" max="10" runat="server" id="rate"/>
                    <input runat="server" id="add" hidden type="submit" OnClick="search_Click"/>
                    <label runat="server" style="margin: 10px; margin-left: 80%; background-color: #ff5e50; text-align: center; padding: 10px; color: white;" for="add">Add</label>
            </div>
            
        </div>
    </form>
     <script>
         window.onload = function () {
             ul = document.getElementById("listBook");
             li = ul.getElementsByTagName("li");
             for (i = 0; i < li.length; i++) {
                 li[i].addEventListener("click", function () {
                     getValue(this.getAttribute("value"));
                 });
             }
         }
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

         function getValue(value) {

             var params = value.split("-");
             console.log(params);
             document.getElementById("BookName").value = "";
             document.getElementById("Bookid").value = "";
             document.getElementById("BookName").value = params[1];
             document.getElementById("Bookid").value = params[0];
             document.getElementById("bookName").innerHTML = params[1];
             myFunction();
         }
    </script>
</body>
</html>
