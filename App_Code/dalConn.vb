Imports Microsoft.VisualBasic

Public Class dalConn
    Public Function connstr() As String
        Dim retconn As String
        retconn = "Server=192.168.1.218;Database=HRM;uid=sa;password=Farc1lgh#"
        Return retconn
    End Function
End Class
