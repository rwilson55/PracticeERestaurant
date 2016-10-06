<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RepeaterListView.aspx.cs" Inherits="Samples_RepeaterListView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>Nested Repeater</h1>
    <!-- The outer repeater is for each row in the overall data set -->
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="MenuCategoryFoodItemsODS">
        <ItemTemplate>
            <h3><%# Eval("MenuCategoryDescription") %></h3>
            <!-- The inner repeater will handle the list<T> 
                that is on each row of the overall data set -->
            <asp:Repeater ID="FoodItemList" runat="server" DataSource='<%# Eval("FoodItems") %>'>
                <ItemTemplate>
                    <%# Eval("ItemID") %>&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label1" runat="server" text='<%# Eval("FoodDescription") %>'></asp:Label>&nbsp;&nbsp;&nbsp;
                    <%# ((decimal)Eval("CurrentPrice")).ToString("C") %>&nbsp;&nbsp;&nbsp;
                    <span class="badge"><%# Eval("TimesServed") %></span>
                    </br>
                </ItemTemplate>
            </asp:Repeater>
        </ItemTemplate>
    </asp:Repeater>
    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="MenuCategoryFoodItemsODS">
        <ItemTemplate>
            <h3><%# Eval("MenuCategoryDescription") %></h3>
            <asp:ListView ID="ListViewRepeater" runat="server" DataSource='<%# Eval("FoodItems") %>'>
                <ItemTemplate>
                    <tr>
                        <td style="padding:15px">
                            <%# Eval("ItemID") %>
                        </td>
                        <td style="width:300px">
                            <asp:Label ID="Label1" runat="server" text='<%# Eval("FoodDescription") %>'></asp:Label>
                        </td>
                        <td>
                            <%# ((decimal)Eval("CurrentPrice")).ToString("C") %>
                        </td>
                        <td>
                            <span class="badge"><%# Eval("TimesServed") %></span>
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <th runat="server">ID</th>
                            <th runat="server">Item</th>
                            <th runat="server">$</th>
                            <th runat="server">Servings</th>
                        </tr>
                        <tr runat="server" id="ItemPlaceholder">

                        </tr>
                    </table>
                </LayoutTemplate>
            </asp:ListView>
        </ItemTemplate>
    </asp:Repeater>

    <asp:ObjectDataSource ID="MenuCategoryFoodItemsODS" runat="server" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="MenuCategoryFoodItemsDTO_Get" TypeName="eRestaurantSystem.BLL.ItemsController"></asp:ObjectDataSource>
</asp:Content>

