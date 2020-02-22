Attribute VB_Name = "Module1"
Sub Vba_Stock_Market()

   



    ' Loop / Iterate Through All Worksheets
    For Each ws In Worksheets


        ' Column Headers  and summary table
        
        ws.Range("I1").Value = "Ticker"
        ws.Range("J1").Value = "Yearly Change"
        ws.Range("K1").Value = "Percent Change"
        ws.Range("L1").Value = "Total Stock Volume"
        ws.Range("O2").Value = "Greatest % Increase"
        ws.Range("O3").Value = "Greatest % Decrease"
        ws.Range("O4").Value = "Greatest Total Volume"
        ws.Range("P1").Value = "Ticker"
        ws.Range("Q1").Value = "Value"


        ' Declare Variables
        
        Dim TickerName As String
        Dim LastRow As Long
        Dim TotalTickerVolume As Double
        TotalTickerVolume = 0
        Dim SummaryTableRow As Long
        SummaryTableRow = 2
        Dim YearlyChange As Double
        Dim PercentChange As Double
        Dim GreatestIncrease As Double
        Dim GreatestDecrease As Double
        Dim LastRowValue As Long
        Dim GreatestTotalVolume As Double
        


        ' Determine the Last Row
        LastRow = ws.Cells(Rows.Count, 1).End(xlUp).Row
        
        For i = 2 To LastRow


            ' Add To Ticker Total Volume
            
            TotalTickerVolume = TotalTickerVolume + ws.Cells(i, 7).Value
            
            ' Check If We Are Still Within The Same Ticker Name If It Is Not...
            If ws.Cells(i + 1, 1).Value <> ws.Cells(i, 1).Value Then
                    

                ' Set Ticker Name
                TickerName = ws.Cells(i, 1).Value
                ' Print The Ticker Name In The Summary Table
                ws.Range("I" & SummaryTableRow).Value = TickerName
                ' Print The Ticker Total Amount To The Summary Table
                ws.Range("L" & SummaryTableRow).Value = TotalTickerVolume
              


                ' Conditional Formatting
                
                If ws.Range("J" & SummaryTableRow).Value >= 0 Then
                    ws.Range("J" & SummaryTableRow).Interior.ColorIndex = 4
                Else
                    ws.Range("J" & SummaryTableRow).Interior.ColorIndex = 3
                End If
            
                
                End If
            Next i





           


              

    Next ws


End Sub

