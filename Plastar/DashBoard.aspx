<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DashBoard.aspx.cs" Inherits="Plastar.DashBoard" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <p class="PageDescription">This is the up running cast collection on Google Tango.</p>
    <asp:Button ID="AddBundle" runat="server" Text="Add new cast" CssClass="DashboardAddButton"/>
    <br>
    <asp:PlaceHolder ID="holder" runat="server" />
</asp:Content>