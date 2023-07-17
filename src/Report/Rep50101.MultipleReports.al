report 50101 "Multiple Reports"
{
    ApplicationArea = All;
    Caption = 'Multiple Reports';
    UsageCategory = Administration;
    DefaultLayout = RDLC;
    RDLCLayout = 'src\RDLC\myreport.rdl';
    dataset
    {
        dataitem(Customer; "Customer")
        {
            DataItemTableView = sorting("No.");

            RequestFilterFields = "No.";
            PrintOnlyIfDetail = true;

            column(No_Customer; "No.")
            {
                IncludeCaption = true;

            }
            column(Customer_Name; Name)
            {

            }
            column(Customer_Address; Address)
            {

            }
            column(Customer_Email; "E-Mail")
            {

            }
            dataitem(CustLedger; "Cust. Ledger Entry")
            {
                DataItemTableView = sorting("Entry No.");
                DataItemLink = "Customer No." = field("No.");

                column(EntryNo_CustLedgerEntry; "Entry No.")
                {

                }

            }

        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}
