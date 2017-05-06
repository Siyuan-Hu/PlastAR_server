<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Plastar._Default" %>

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
                <div class="ProgressBarContainer hidden">
                    <div class="ProgressBar"></div>
                </div>
            </div>

            <div class="SuccessContainer hidden">
                <img class="SuccessIcon" src="https://www.originalvapery.com/wp-content/uploads/2015/05/success-icon-check-02.png" />
                <p class="SuccessDescription">Build completed. Tango app is updated and ready to go. </p>
                <button onclick="reload()" class="RefreshButton">Upload next cast</button>
            </div>
        </div>
        <asp:TextBox ID="status" Text="uploading" runat="server"></asp:TextBox>
    </div>

    <script>
        var status = document.getElementById("MainContent_status").value
        console.log(status);

        var input = document.querySelector('.Inputfile')
        , upload = document.querySelector('.UploadButton')
        , build = document.querySelector('.BuildButton')
        , filename = "";
        
        //choose file
        input.addEventListener('change', function (e) {
            if(input) {
                filename = e.target.value.split('\\').pop();
                var format = filename.substr(filename.indexOf('.') + 1);
                if(format === "zip") {
                    document.querySelector('.FileContainerDescription').innerHTML = "<b>" + filename + "</b> is chosen.";
                    document.querySelector('.FileContainer').style.backgroundColor = "#bbb";
                   // document.querySelector('.FileContainer').innerHTML = "Change a .zip";
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

        //building
        build.addEventListener('click', function () {
            document.querySelector('.ProgressBarContainer').classList.remove('hidden');
            build.style.backgroundColor = '#bbb';
            build.disabled = true;
            document.querySelector('.BuildFileDescription').innerHTML = "<b>" + filename + "</b> is being added to the collection. <br> This might take a while. <b>Please don't close this page. </b>";

            var bar = document.querySelector('.ProgressBar');
            var left = 0;
            var id = setInterval(frame, 10);
            var direction = 1;

            function frame() {
                if (direction == 1) {
                    if (left <= 80) {
                        left++;
                        bar.style.left = left + '%';
                    }
                    else {
                        direction = -1;
                    }
                }
                else {
                    if (left >= 0) {
                        left--;
                        bar.style.left = left + '%';
                    }
                    else {
                        direction = 1;
                    }
                }
            }
        });

        //build completed
        if (status == 'built') {
            document.querySelector('.SuccessContainer').classList.remove('hidden');
            document.querySelector('.UploadContainer').classList.add('hidden');
        }

        //reload
        function reload() {
            location.reload();
        }
    </script>

</asp:Content>
