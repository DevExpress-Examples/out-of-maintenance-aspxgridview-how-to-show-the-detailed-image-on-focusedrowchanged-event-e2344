Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.IO
Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.Data
Imports System.Data.SqlClient

Partial Public Class _Default
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
		If Not String.IsNullOrEmpty(Request.Params("Photo")) Then
			PostImage(Request.Params("Photo"))
		End If
	End Sub

	Private Sub PostImage(ByVal id As String)
		Dim image() As Byte = FindImage(id)
		WriteBinaryImage(image)
	End Sub
	Private Sub WriteBinaryImage(ByVal image() As Byte)
		If image IsNot Nothing Then
			Response.ContentType = "image/bmp"
			Using ms As New MemoryStream(image)
				Using bmp As Bitmap = CType(Bitmap.FromStream(ms), Bitmap)
					bmp.Save(Response.OutputStream, ImageFormat.Jpeg)
				End Using
				Response.BinaryWrite(image)
			End Using
		Else
			Response.ContentType = "image/gif"
		End If
		Response.End()
	End Sub
	Private Function FindImage(ByVal id As String) As Byte()
		Dim queryString As String = "SELECT [Photo] FROM [Employees] WHERE [EmployeeID] = " & id
		Dim dt As New DataTable()

		Using connection As New SqlConnection("Data Source=(local);Initial Catalog=Northwind;Integrated Security=True")
			Dim command As New SqlCommand(queryString, connection)
			connection.Open()

			Dim da As New SqlDataAdapter()
			da.SelectCommand = command
			da.Fill(dt)
		End Using
		If dt.Rows.Count > 0 Then
			Return TryCast(dt.Rows(0)(0), Byte())
		End If
		Return Nothing


	End Function

End Class
