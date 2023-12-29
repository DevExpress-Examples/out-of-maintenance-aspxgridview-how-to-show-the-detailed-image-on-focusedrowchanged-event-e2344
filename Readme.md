<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
<!-- default file list end -->
# ASPxGridView - How to show the detailed image on FocusedRowChanged event


<p>This example illustrates how to dynamically display a focused employee's photo and details outside the ASPxGridView.</p><p>The FocusedRowChanged event is handled to call the OnGridFocusedRowChanged() function. This function queries the server to return the employee's ID, Notes, Country and City. The returned array is passed to the OnGetRowValues() function that specifies values for corresponding HTML elements.</p><p><strong>See Also:</strong><br />
<a href="http://demos.devexpress.com/ASPxGridViewDemos/Rows/FocusedRow.aspx">ASPxGridView - Focused Row Demo</a><br />
<a href="https://www.devexpress.com/Support/Center/p/E1414">How to bind the ASPxBinaryImage to a field which contains image data stored as OLE object</a></p>

<br/>


