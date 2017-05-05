﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Plastar._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-md-12">
            <h2>Upload</h2>
            <p class="Description">
                Please upload your resource.
            </p>
            <div class="UploadContainer">
                <img class="UploadIcon" src="https://maxcdn.icons8.com/Share/icon/Network//upload_to_cloud1600.png" /> 
                <div class="FileContainerContainer">
                    <p class="FileContainerDescription">No file chosen.</p>
                    <label class="FileContainer">
                        Choose a .zip
                        <input class="Inputfile" type="file" id="File1" name="File1" runat="server" />
                    </label>
                </div>
                <input class="UploadButton hidden" type="submit" id="Submit1" value="Upload" runat="server" />
            </div>                    


            <div class="BuildContainer hidden">
                <img class="BuildIcon" src="https://www.casadeco.com.ro/wp-content/uploads/2016/12/256-256-1cf7344e1bb0b0dac4d06d0ed991fd4e.png" />
                <p class="BuildFileDescription"></p>
                <div class="BuildButtonContainer">  
                    <asp:Button ID="Build1" runat="server" Text="Build" CssClass="BuildButton" />
                </div>
            </div>
        </div>
        <asp:TextBox ID="status" Text="uploading" runat="server"></asp:TextBox>
    </div>

    <script>
        var status = document.getElementById("MainContent_status").value
        console.log(status);

        var input = document.querySelector('.Inputfile')
        ,   upload = document.querySelector('.UploadButton')
        ,   filename = "";
        
        //choose file
        input.addEventListener('change', function (e) {
            if(input) {
                filename = e.target.value.split('\\').pop();
                var format = filename.substr(filename.indexOf('.') + 1);
                if(format === "zip") {
                    document.querySelector('.FileContainerDescription').innerHTML = "<b>" + filename + "</b> is chosen.";
                    document.querySelector('.FileContainer').style.backgroundColor = "#bbb";
                    document.querySelector('.UploadButton').classList.remove('hidden');
                    localStorage.setItem("filename", filename);
                }
                else {
                    document.querySelector('.FileContainerDescription').innerHTML = "<span style='color: red'>Please choose a zip file. </span>";
                }
            }
            else {
                document.querySelector('.FileContainerDescription').innerHTML = "No file chooooooosen."
            }
        });

        //build
        if (status == 'uploaded') {
            var filename = localStorage.getItem('filename');

            document.querySelector('.BuildFileDescription').innerHTML = "<b>" + filename + "</b> is uploaded and ready to be built.";
            document.querySelector('.UploadContainer').classList.add('hidden');
            document.querySelector('.BuildContainer').classList.remove('hidden');
        }
    </script>

</asp:Content>
