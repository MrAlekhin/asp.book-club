<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddBook.aspx.cs" Inherits="SheridanBookClub.AddBook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
            height: 470px;
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
            margin-bottom: 15px;
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
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
