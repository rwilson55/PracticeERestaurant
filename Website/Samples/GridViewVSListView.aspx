<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="GridViewVSListView.aspx.cs" Inherits="Samples_GridViewVSListView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="GridView POCO"></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="GridViewODS" AllowPaging="True">
        <Columns>
            <asp:BoundField DataField="MenuCategoryDescription" HeaderText="MenuCategoryDescription" SortExpression="MenuCategoryDescription"></asp:BoundField>
            <asp:BoundField DataField="ItemID" HeaderText="ItemID" SortExpression="ItemID"></asp:BoundField>
            <asp:BoundField DataField="FoodDescription" HeaderText="FoodDescription" SortExpression="FoodDescription"></asp:BoundField>
            <asp:BoundField DataField="CurrentPrice" HeaderText="CurrentPrice" SortExpression="CurrentPrice"></asp:BoundField>
            <asp:BoundField DataField="TimesServed" HeaderText="TimesServed" SortExpression="TimesServed"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="GridViewODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="MenuCategoryFoodItemsPOCO_Get" TypeName="eRestaurantSystem.BLL.ItemsController"></asp:ObjectDataSource>
</asp:Content>

