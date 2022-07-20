Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.UI.WebControls.TableRowCollection
Imports System.Web.UI.HtmlControls.HtmlTableRow

Public Class WebForm1
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Me.BindGrid()
        End If
    End Sub
    Private Sub BindGrid()
        Dim constr As String = ConfigurationManager.ConnectionStrings("DNACloudDBConnectionString").ConnectionString
        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand(" select Grade,GradeName,GradeGroupName,GradeCons,GradeNameCons from Grades G left join GradeGroups GG on G.GradeGroup = GG.GradeGroup;")
                Using sda As SqlDataAdapter = New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As DataTable = New DataTable()
                        sda.Fill(dt)
                        GridView1.DataSource = dt
                        GridView1.DataBind()
                    End Using
                End Using
            End Using
        End Using
    End Sub
    Protected Sub OnPageIndexChanging(ByVal sender As Object, ByVal e As GridViewPageEventArgs)
        GridView1.PageIndex = e.NewPageIndex
        Me.BindGrid()
        Dim row As GridViewRow = GridView1.Rows(0)
        SqlDataSource1.SelectParameters("GradeID").DefaultValue = TryCast(row.FindControl("lblDescription"), Label).Text
        FormView1.DataBind()
    End Sub
    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        SqlDataSource1.SelectParameters("GradeID").DefaultValue = GridView1.SelectedValue.ToString()
        FormView1.DataBind()
    End Sub
    Protected Sub FormView1_ItemUpdated(ByVal sender As Object, ByVal e As FormViewUpdatedEventArgs)
        'GridView1.DataBind()
        Me.BindGrid()
    End Sub
    Protected Sub FormView1_ItemDeleted(ByVal sender As Object, ByVal e As FormViewDeletedEventArgs)
        'GridView1.DataBind()
        Me.BindGrid()
    End Sub

    Protected Sub SqlDataSource1_OnInserted(ByVal sender As Object, ByVal e As SqlDataSourceStatusEventArgs)
        Dim command As System.Data.Common.DbCommand = e.Command
        SqlDataSource1.SelectParameters("GradeID").DefaultValue = command.Parameters("@Grade").Value.ToString()
        'MsgBox(command.Parameters("@Grade").Value.ToString(), MsgBoxStyle.Information, "Message")
        GridView1.DataBind()
        Me.BindGrid()
        FormView1.DataBind()

    End Sub
    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As CommandEventArgs)
        SqlDataSource1.SelectParameters("GradeID").DefaultValue = e.CommandArgument.ToString()
        FormView1.DataBind()
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If TextBox19.Text.ToString() = "" Or String.IsNullOrEmpty(TextBox19.Text) Then
            Me.BindGrid()
            Dim num1 As Integer = 1
            SqlDataSource1.SelectParameters("GradeID").DefaultValue = num1
            FormView1.DataBind()
        Else
            Dim constr As String = ConfigurationManager.ConnectionStrings("DNACloudDBConnectionString").ConnectionString
            Using con As SqlConnection = New SqlConnection(constr)
                Using cmd As SqlCommand = New SqlCommand(" exec search_proc '" & DropDownList4.SelectedValue.ToString() & "' ,  '" & DropDownList5.SelectedValue.ToString() & "', '" & TextBox19.Text.ToString() & "' ")
                    Using sda As SqlDataAdapter = New SqlDataAdapter()
                        cmd.Connection = con
                        sda.SelectCommand = cmd
                        Using dt As DataTable = New DataTable()
                            sda.Fill(dt)
                            For Each row As DataRow In dt.Rows
                                SqlDataSource1.SelectParameters("GradeID").DefaultValue = row(0).ToString()
                                FormView1.DataBind()
                                Exit For
                            Next
                            GridView1.DataSource = dt
                            GridView1.DataBind()
                        End Using
                    End Using
                End Using
            End Using
        End If
    End Sub

    Protected Sub FormView1_ItemDeleted1(sender As Object, e As FormViewDeletedEventArgs) Handles FormView1.ItemDeleted
        Me.BindGrid()
    End Sub

    Protected Sub FormView1_ItemUpdated1(sender As Object, e As FormViewUpdatedEventArgs) Handles FormView1.ItemUpdated
        Me.BindGrid()
    End Sub

    'Protected Sub FormView1_ItemInserted(sender As Object, e As FormViewInsertedEventArgs) Handles FormView1.ItemInserted
    '    Dim command As System.Data.Common.DbCommand = e.Command

    '    SqlDataSource1.SelectParameters("GradeID").DefaultValue = Command.Parameters("@GradeID").Value.ToString()
    '    GridView1.DataBind()
    '    FormView1.DataBind()
    '    Me.BindGrid()
    'End Sub
End Class

