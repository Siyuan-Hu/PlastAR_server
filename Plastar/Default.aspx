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
                    <p class="FileContainerDiscription">No file chosen.</p>
                    <label class="FileContainer">
                        Choose a .zip
                        <input type="file" id="File1" name="File1" runat="server" />
                    </label>
                </div>

                <input class="Upload" type="submit" id="Submit1" value="Upload" runat="server" />
            </div>                    
            <br>
            <br>
            <div class="BuildButtonContainer">
                <asp:Button ID="Build1" runat="server" Text="Build" CssClass="BuildButton" />
            </div>
        </div>
    </div>

</asp:Content>
