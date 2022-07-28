<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register assembly="DevExpress.Web.v18.1, Version=18.1.18.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Focused Row Example</title>
    <script type="text/javascript">
        function OnGridFocusedRowChanged() {
            grid.GetRowValues(grid.GetFocusedRowIndex(), 'EmployeeID;Notes;Country;City', OnGetRowValues);
        }
        function OnGetRowValues(values) {
            DetailImage.SetImageUrl("Default.aspx?Photo=" + values[0]);
            DetailNotes.SetText(values[1]);
            DetailCountry.SetText(values[2] + ' - ' + values[3]);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <dx:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" PreviewFieldName="Notes"
            AutoGenerateColumns="False" EnableRowsCache="false" Width="100%" 
            DataSourceID="SqlDataSource1" KeyFieldName="EmployeeID">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="EmployeeID" ReadOnly="True" 
                    VisibleIndex="0">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LastName" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Title" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="BirthDate" VisibleIndex="4">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="City" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Country" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
		<dx:GridViewDataTextColumn FieldName="Notes" VisibleIndex="8" Visible="false">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior AllowFocusedRow="True"/>
            <ClientSideEvents FocusedRowChanged="function(s, e) { OnGridFocusedRowChanged(); }"/>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
            SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Title], [BirthDate], [City], [Region], [Country], [Extension], [Photo], [Notes], [ReportsTo], [PhotoPath] FROM [Employees]">
        </asp:SqlDataSource>
        <p>Details:</p>
        <table cellpadding="5" cellspacing="2" width="100%">
            <tr>
                <td style="width: 10%">
                    <dx:ASPxImage runat="server" ID="DetailImage" ClientInstanceName="DetailImage" Height="160"/>
                </td>
                <td style="width: 70%" align="left">
                    <dx:ASPxMemo runat="server" ID="DetailNotes" ClientInstanceName="DetailNotes" Width="100%"
                        Height="160" ReadOnly="true" />
                </td>
                <td style="width: 20%" align="left">
                    <dx:ASPxMemo runat="server" ID="DetailCountry" ClientInstanceName="DetailCountry"
                        Width="100%" Height="160" ReadOnly="true" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
